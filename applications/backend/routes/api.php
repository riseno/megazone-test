<?php

use App\Models\VisitCount;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

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

Route::get('visit-count', function (Request $request) {
    VisitCount::create([
        'ip_address' => $request->getClientIp(),
    ]);

    return response()->json([
        'count' => VisitCount::where('ip_address', $request->getClientIp())->count(),
    ]);
});
