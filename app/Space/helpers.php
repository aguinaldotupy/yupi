<?php

use Crater\Models\CompanySetting;
use Crater\Models\Currency;
use Crater\Models\CustomField;
use Crater\Models\Setting;
use Illuminate\Support\Str;

/**
 * Get company setting
 *
 * @param $key
 * @param $company_id
 * @return string
 */
function get_company_setting($key, $company_id): ?string
{
    if (\Storage::disk('local')->has('database_created')) {
        return CompanySetting::getSetting($key, $company_id);
    }

    return null;
}

/**
 * Get app setting
 *
 * @param $key
 * @return string
 */
function get_app_setting($key): ?string
{
    if (\Storage::disk('local')->has('database_created')) {
        return Setting::getSetting($key);
    }

    return null;
}

/**
 * Get page title
 *
 * @param $company_id
 * @return string
 */
function get_page_title($company_id): string
{
    $routeName = Route::currentRouteName();

    $defaultPageTitle = 'Crater - Self Hosted Invoicing Platform';

    if (\Storage::disk('local')->has('database_created')) {
        if ($routeName === 'customer.dashboard') {
            $pageTitle = CompanySetting::getSetting('customer_portal_page_title', $company_id);

            return $pageTitle ?: $defaultPageTitle;
        }

        $pageTitle = Setting::getSetting('admin_page_title');

        return $pageTitle ?: $defaultPageTitle;
    }

    return $defaultPageTitle;
}

/**
 * Set Active Path
 *
 * @param $path
 * @param string $active
 * @return string
 */
function set_active($path, string $active = 'active'): string
{
    return call_user_func_array('Request::is', (array)$path) ? $active : '';
}

/**
 * @param $path
 * @return mixed
 */
function is_url($path)
{
    return call_user_func_array('Request::is', (array)$path);
}

/**
 * @param string $type
 * @return string
 */
function getCustomFieldValueKey(string $type): string
{
    switch ($type) {

        case 'Number':
        case 'Phone':
            return 'number_answer';

        case 'Switch':
            return 'boolean_answer';

        case 'Date':
            return 'date_answer';

        case 'Time':
            return 'time_answer';

        case 'DateTime':
            return 'date_time_answer';

        case 'Dropdown':
        case 'Url':
        case 'TextArea':
        case 'Input':
        default:
            return 'string_answer';
    }
}

/**
 * @param $money
 * @param null $currency
 * @return string formated_money
 */
function format_money_pdf($money, $currency = null): string
{
    $money /= 100;

    if (! $currency) {
        $currency = Currency::findOrFail(CompanySetting::getSetting('currency', 1));
    }

    $format_money = number_format(
        $money,
        $currency->precision,
        $currency->decimal_separator,
        $currency->thousand_separator
    );

    $currency_with_symbol = '';
    if ($currency->swap_currency_symbol) {
        $currency_with_symbol = $format_money.'<span style="font-family: DejaVu Sans;">'.$currency->symbol.'</span>';
    } else {
        $currency_with_symbol = '<span style="font-family: DejaVu Sans;">'.$currency->symbol.'</span>'.$format_money;
    }

    return $currency_with_symbol;
}

/**
 * @param $model
 * @param $title
 * @param int|string $id
 * @return string
 * @throws Exception
 */
function clean_slug($model, $title, $id = 0): string
{
    // Normalize the title
    $slug = Str::upper('CUSTOM_'.$model.'_'.Str::slug($title, '_'));

    // Get any that could possibly be related.
    // This cuts the queries down by doing it once.
    $allSlugs = getRelatedSlugs($model, $slug, $id);

    // If we haven't used it before then we are all good.
    if (! $allSlugs->contains('slug', $slug)) {
        return $slug;
    }

    // Just append numbers like a savage until we find not used.
    for ($i = 1; $i <= 10; $i++) {
        $newSlug = $slug.'_'.$i;
        if (! $allSlugs->contains('slug', $newSlug)) {
            return $newSlug;
        }
    }

    throw new \RuntimeException('Can not create a unique slug');
}

function getRelatedSlugs($type, $slug, $id = 0)
{
    return CustomField::select('slug')->where('slug', 'like', $slug.'%')
        ->where('model_type', $type)
        ->where('id', '<>', $id)
        ->get();
}

function respondJson($error, $message): \Illuminate\Http\JsonResponse
{
    return response()->json([
        'error' => $error,
        'message' => $message
    ], 422);
}

function getSqlWithBindings(string $sql, array $bindings): string
{
    return vsprintf(str_replace('?', '%s', $sql), array_map(static fn ($binding) => is_numeric($binding) ? $binding : "'$binding'", $bindings));
}

function getSqlWithBindingsFromQueryLog(array $queryLog = []): array
{
    if (count($queryLog) === 0) {
        $queryLog = DB::getQueryLog();
    }

    return array_map(static fn ($log) => getSqlWithBindings($log['query'] ?? '', $log['bindings'] ?? []), $queryLog);
}
