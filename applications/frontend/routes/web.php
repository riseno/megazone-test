<?php

use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', function () {
    $response = Http::get('http://megazone-backend.default.svc.cluster.local/api/visit-count');

    try {
        return response()->json([
            'count' => $response['count'],
        ]);
    } catch (Exception $exception) {
        return response()->json([
            'error' => $exception->getMessage(),
        ], 500);
    }
});
