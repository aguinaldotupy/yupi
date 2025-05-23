<?php

namespace Crater\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

/**
 * @mixin IdeHelperCountry
 */
class Country extends Model
{
    use HasFactory;

    public function address()
    {
        return $this->hasMany(Address::class);
    }
}
