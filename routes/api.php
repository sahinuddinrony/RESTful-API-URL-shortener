<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\API\UrlController;
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
        Route::post('/shorten-url', [UrlController::class, 'shortenUrl'])->name('v1.shorten-url');
        Route::get('/list-urls', [UrlController::class, 'listUrls'])->name('v1.list-urls');
        Route::get('/{shortUrl}', [UrlController::class, 'redirect'])->name('redirect');
    });

    Route::prefix('v2')->group(function () {
        Route::post('/shorten-url', [UrlController::class, 'shortenUrl'])->name('v2.shorten-url');
        Route::get('/list-urls', [UrlController::class, 'listUrls'])->name('v2.list-urls');
        Route::get('/{shortUrl}', [UrlController::class, 'redirect'])->name('redirect');
    });
});




// Route::middleware('auth:sanctum')->group(function () {
//     Route::prefix('{version}')->group(function () {
//         Route::post('/shorten-url', [UrlController::class, 'shortenUrl'])->name('shorten-url');
//         Route::get('/list-urls', [UrlController::class, 'listUrls'])->name('list-urls');
//         Route::get('/{shortUrl}', [UrlController::class, 'redirect'])->name('redirect');
//     });
