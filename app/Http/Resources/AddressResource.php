<?php

namespace Crater\Http\Resources;

use Crater\Models\Address;
use Illuminate\Http\Resources\Json\JsonResource;

/**
 * @mixin Address
 */
class AddressResource extends JsonResource
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
            'address_street_1' => $this->address_street_1,
            'address_street_2' => $this->address_street_2,
            'city' => $this->city,
            'state' => $this->state,
            'country_id' => $this->country_id,
            'zip' => $this->zip,
            'phone' => $this->phone,
            'fax' => $this->fax,
            'type' => $this->type,
            'user_id' => $this->user_id,
            'company_id' => $this->company_id,
            'customer_id' => $this->customer_id,
            'country' => $this->when(! is_null($this->country), function () {
                return new CountryResource($this->country);
            }),
            'user' => $this->when(! is_null($this->user), function () {
                return new UserResource($this->user);
            }),
        ];
    }
}
