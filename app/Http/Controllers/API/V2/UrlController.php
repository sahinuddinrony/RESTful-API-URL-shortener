<?php

namespace App\Http\Controllers\API\V2;

use App\Models\Url;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use App\Http\Controllers\BaseController;

class UrlController extends Controller
{
    protected $baseController;

    public function __construct(BaseController $baseController)
    {
        $this->baseController = $baseController;
    }

    public function listUrls(Request $request)
    {
        $user = Auth::user();
        $urls = Url::where('user_id', $user->id)->get();

        // Add visit_count to each URL in the response
        $formattedUrls = $urls->map(function ($url) {
            return [
                'long_url' => $url->long_url,
                'short_url' => $url->short_url,
                'visit_count' => $url->visit_count,
            ];
        });

        return $this->baseController->sendResponse(['urls' => $formattedUrls], 'List of URLs retrieved successfully.');
    }


}
