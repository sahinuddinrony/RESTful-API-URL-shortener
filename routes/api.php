<?php

use Illuminate\Support\Facades\Route;
// use App\Http\Controllers\API\V1\UrlController;
// use App\Http\Controllers\API\V2\UrlController;
use App\Http\Controllers\API\V1\UrlController as V1UrlController;
use App\Http\Controllers\API\V2\UrlController as V2UrlController;
use App\Http\Controllers\API\RegisterController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::post('/register', [RegisterController::class, 'register']);
Route::post('/login', [RegisterController::class, 'login']);

Route::middleware('auth:sanctum')->group(function () {
    Route::prefix('v1')->group(function () {

        // Route::resource('profile' [ProfileController::class])->only(['create', 'store']);
        Route::post('/shorten-url', [V1UrlController::class, 'shortenUrl'])->name('v1.shorten-url');
        // Route::get('/list-urls', [UrlController::class, 'listUrls'])->name('v1.list-urls');
        Route::get('/{shortUrl}', [V1UrlController::class, 'redirect'])->name('redirect');
        Route::post('logout', [RegisterController::class, 'logout']);
    });

    Route::prefix('v2')->group(function () {
        Route::get('/list-urls', [V2UrlController::class, 'listUrls'])->name('v2.list-urls');
    });
});

