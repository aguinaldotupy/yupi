<?php

namespace Crater\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

/**
 * @mixin IdeHelperCurrency
 */
class Currency extends Model
{
    use HasFactory;

    protected $guarded = [
        'id'
    ];
}
