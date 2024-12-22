<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Auth\LoginRegisterController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\StoreController;
use App\Http\Controllers\InventoryController;

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

/*Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});*/

// Public routes of authtication
Route::controller(LoginRegisterController::class)->group(function() {
    Route::post('/register',                'register');
    Route::post('/login',                   'login');
});

// Protected routes of product and logout
Route::middleware('auth:api')->group( function () {

    // Get authenticated user's info
    Route::get('/user',                     [UserController::class, 'getUser']);

    // Update authenticated user's info
    Route::post('/user',                    [UserController::class, 'updateUser']);

    // Logout and revoke token
    Route::post('/logout',                  [LoginRegisterController::class, 'logout']);

    // Stores routes
    Route::controller(StoreController::class)->group(function() {
        // List stores entries
        Route::get('/stores',               'index');
        // Get active stores (DroupDown)
        Route::get('/activestores',         'getActiveStores');
        // Save store entry
        Route::post('/stores',              'store');
        // Delete store entry
        Route::delete('/stores/{id}',       'destroy');
    });

    // Stocks routes
    Route::controller(InventoryController::class)->group(function() {
        // List inventories entries
        Route::get('/inventories',          'index');
        // Save inventory entry
        Route::post('/inventories',         'store');
        // Bulk insert inventories
        Route::post('/inventories-bulk-store', 'bulkStore');
        // Delete inventory entry
        Route::delete('/inventories/{id}',  'destroy');
    });
});