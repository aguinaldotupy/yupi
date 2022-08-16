<?php

namespace Crater\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

/**
 * @mixin IdeHelperModule
 */
class Module extends Model
{
    use HasFactory;

    protected $guarded = ['id'];
}
