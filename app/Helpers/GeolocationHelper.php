<?php

namespace App\Helpers;

use Illuminate\Support\Facades\Http;

class GeolocationHelper
{
    /**
     * Get geolocation info from IPinfo API.
     *
     * @param string|null $ip The IP address. If null, the request's IP will be used.
     * @return array|null
     */
    public static function getGeolocation($ip = null)
    {
        $ip = $ip ?? request()->ip();

        $apiKey = env('IPINFO_API_KEY');

        $response = Http::get("http://ipinfo.io/{$ip}/json?token={$apiKey}");

        if ($response->successful()) {
            return $response->json();
        }

        return null;
    }
}
