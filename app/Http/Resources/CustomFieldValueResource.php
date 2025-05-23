<?php

namespace Crater\Http\Resources;

use Crater\Models\CompanySetting;
use Crater\Models\CustomFieldValue;
use Illuminate\Http\Resources\Json\JsonResource;

/**
 * @mixin CustomFieldValue
 */
class CustomFieldValueResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'custom_field_valuable_type' => $this->custom_field_valuable_type,
            'custom_field_valuable_id' => $this->custom_field_valuable_id,
            'type' => $this->type,
            'boolean_answer' => $this->boolean_answer,
            'date_answer' => $this->date_answer,
            'time_answer' => $this->time_answer,
            'string_answer' => $this->string_answer,
            'number_answer' => $this->number_answer,
            'date_time_answer' => $this->date_time_answer,
            'custom_field_id' => $this->custom_field_id,
            'company_id' => $this->company_id,
            'default_answer' => $this->defaultAnswer,
            'default_formatted_answer' => $this->dateTimeFormat(),
            'custom_field' => $this->when(! is_null($this->customField), function () {
                return new CustomFieldResource($this->customField);
            }),
            'company' => $this->when(! is_null($this->company), function () {
                return new CompanyResource($this->company);
            }),
        ];
    }

    public function dateTimeFormat()
    {
        $key = getCustomFieldValueKey($this->type);

        $answer = $this->default_answer;
        if (! $answer) {
            return null;
        }

        if ($key == 'date_time_answer') {
            return $answer->format('Y-m-d H:i');
        }

        if ($key == 'date_answer') {
            return $answer->format(CompanySetting::getSetting('carbon_date_format', $this->company_id));
        }

        return $answer;
    }
}
