<?php

namespace Crater\Http\Resources;

use Crater\Models\Customer;
use Illuminate\Http\Resources\Json\JsonResource;

/**
 * @mixin Customer
 */
class CustomerResource extends JsonResource
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
            'name' => $this->name,
            'email' => $this->email,
            'phone' => $this->phone,
            'contact_name' => $this->contact_name,
            'company_name' => $this->company_name,
            'website' => $this->website,
            'enable_portal' => $this->enable_portal,
            'password_added' => $this->password ? true : false,
            'currency_id' => $this->currency_id,
            'company_id' => $this->company_id,
            'facebook_id' => $this->facebook_id,
            'google_id' => $this->google_id,
            'github_id' => $this->github_id,
            'created_at' => $this->created_at,
            'formatted_created_at' => $this->formattedCreatedAt,
            'updated_at' => $this->updated_at,
            'avatar' => $this->avatar,
            'due_amount' => $this->due_amount,
            'base_due_amount' => $this->base_due_amount,
            'prefix' => $this->prefix,
            'billing' => $this->when(! is_null($this->billingAddress), function () {
                return new AddressResource($this->billingAddress);
            }),
            'shipping' => $this->when(! is_null($this->shippingAddress), function () {
                return new AddressResource($this->shippingAddress);
            }),
            'fields' => $this->when($this->fields->count(), function () {
                return CustomFieldValueResource::collection($this->fields);
            }),
            'company' => $this->when(! is_null($this->company), function () {
                return new CompanyResource($this->company);
            }),
            'currency' => $this->when(! is_null($this->currency), function () {
                return new CurrencyResource($this->currency);
            }),
        ];
    }
}
