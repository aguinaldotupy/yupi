<?php

namespace Crater\Console\Commands;

use DB;
use Illuminate\Console\Command;

class ConvertPgSqlToMySqlCommand extends Command
{
    protected $signature = 'convert:pg-sql-to-my-sql';

    protected $description = 'Command description';

    public function handle(): void
    {
        config()->set('database.connections.pgsql.port', 5432);
        config()->set('database.connections.pgsql.username', 'yupi');

        DB::reconnect('pgsql');

        $this->info('Convertendo dados do banco de dados PGSQL para MySql...');

        $tables = DB::connection('pgsql')->select(DB::raw('SELECT table_name FROM information_schema.tables WHERE table_schema = \'public\''));

        DB::connection('mysql')->unprepared('SET foreign_key_checks = 0');

        foreach ($tables as $table) {
            $this->info('Convertendo tabela '.$table->table_name.'...');
            $this->convertTable($table->table_name);
        }

        DB::connection('mysql')->unprepared('SET foreign_key_checks = 1');
    }

    private function convertTable($table_name): void
    {
        $values = DB::connection('pgsql')->table($table_name)->get();

        foreach ($values as $value) {
            DB::connection('mysql')->table($table_name)->insert((array) $value);
        }
    }
}
