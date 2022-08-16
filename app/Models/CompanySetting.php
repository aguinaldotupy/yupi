<?php

namespace Crater\Models;

use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Support\Facades\Cache;

class CompanySetting extends Model
{
    use HasFactory;

    protected $fillable = ['company_id', 'option', 'value'];

    public function company(): BelongsTo
    {
        return $this->belongsTo(Company::class);
    }

    public function scopeWhereCompany(Builder $query, $company_id): Builder
    {
        return $query->where('company_id', '=', $company_id);
    }

    public static function setSettings($settings, $company_id): void
    {
        foreach ($settings as $key => $value) {
            Cache::forget('company_setting:'.$company_id.':'.$key);
            self::updateOrCreate(
                [
                    'option' => $key,
                    'company_id' => $company_id,
                ],
                [
                    'option' => $key,
                    'company_id' => $company_id,
                    'value' => $value,
                ]
            );
        }
    }

    public static function getAllSettings($company_id)
    {
        return static::whereCompany($company_id)->get()->mapWithKeys(function ($item) {
            return [$item['option'] => $item['value']];
        });
    }

    public static function getSettings($settings, $company_id)
    {
        return static::whereIn('option', $settings)->whereCompany($company_id)
            ->get()->mapWithKeys(function ($item) {
                return [$item['option'] => $item['value']];
            });
    }

    public static function getSetting($key, $company_id)
    {
        $setting = Cache::remember('company_setting:'.$company_id.':'.$key, now()->addMinutes(15), static fn () => static::whereOption($key)->whereCompany($company_id)->first());

        if ($setting) {
            return $setting->value;
        }

        return null;
    }
}
