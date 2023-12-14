<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Url;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Str;

class UrlController extends Controller
{
    // public function shortenUrl(Request $request, $version)
    public function shortenUrl(Request $request)
    {
        $user = Auth::user();

        $longUrl = $request->input('long_url');

        $url = Url::where('long_url', $longUrl)->where('user_id', $user->id)->first();

        if (!$url) {
            $shortUrl = $this->generateUniqueShortUrl();
            $url = Url::create([
                'user_id' => $user->id,
                'long_url' => $longUrl,
                'short_url' => $shortUrl,
            ]);
        }

       

        return response()->json(['short_url' => $url->short_url]);
    }

    // public function listUrls(Request $request, $version)
    public function listUrls(Request $request)
    {
        $user = Auth::user();
        $urls = Url::where('user_id', $user->id)->get();

        return response()->json(['urls' => $urls]);
    }

    // public function redirect(Request $request, $version, $shortUrl)
    public function redirect(Request $request, $shortUrl)
    {
        $url = Url::where('short_url', $shortUrl)->first();

        if ($url) {
            $url->increment('visit_count');
            return redirect($url->long_url);
        } else {
            return abort(404);
        }
    }

    private function generateUniqueShortUrl()
    {
        do {
            $shortUrl = Str::random(6);
        } while (Url::where('short_url', $shortUrl)->exists());

        return $shortUrl;
    }
}
