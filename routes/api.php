<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\EmployeeController;

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

Route::post('register', [EmployeeController::class, 'register']);
Route::post('login', [EmployeeController::class, 'login']);
Route::middleware('custom.jwt.auth')->post('absence', [EmployeeController::class, 'absence']);
Route::middleware('custom.jwt.auth')->get('logout', [EmployeeController::class, 'logout']);

