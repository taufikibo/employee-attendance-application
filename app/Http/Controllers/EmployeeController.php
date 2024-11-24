<?php
namespace App\Http\Controllers;

use App\Models\Employee;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Auth;
use Tymon\JWTAuth\Facades\JWTAuth;
use App\Helpers\GeolocationHelper;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Http;

class EmployeeController extends Controller
{
    /**
     * Handle the employee registration.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function register(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required|string|max:255',
            'email' => 'required|email|unique:employees,email',
            'password' => 'required|string|min:8|confirmed',
            'dob' => 'required|date',
            'phone' => 'required|string|max:15',
            'gender' => 'required|string',
            'photo' => 'image|mimes:jpeg,jpg,png|max:2048',
            'address' => 'required|string',
            'nik' => 'required|string|max:20|unique:employees,nik',
            'department' => 'required|string',
            'position' => 'required|string',
            'salary' => 'required|string',
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }

        $photoPath = null;
        if ($request->hasFile('photo')) {
            $photoPath = $request->file('photo')->store('photos', 'public');
        }

        DB::statement('CALL insert_employee(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)', [
            $request->name,
            $request->email,
            bcrypt($request->password),
            $request->dob,
            $request->phone,
            $request->gender,
            $photoPath,
            $request->address,
            $request->nik,
            $request->department,
            $request->position,
            $request->salary,
        ]);
        return response()->json(['message' => "Register successfully"], 201);
    }

    public function login(Request $request)
    {
        $credentials = $request->only('email', 'password');
        if ($token = JWTAuth::attempt($credentials)) {
            return response()->json([
                'message' => 'Employee successfully logged in',
                'token' => $token,
            ]);
        }

        return response()->json(['error' => 'Unauthorized'], 401);
    }


    public function logout(Request $request)
    {
        JWTAuth::invalidate($request->token);

        return response()->json(['message' => 'Successfully logged out']);
    }

    public function absence(Request $request)
    {
        try {
            $user = JWTAuth::parseToken()->authenticate();
        } catch (JWTException $e) {
            return response()->json(['message' => 'Token is invalid or expired'], 401);
        }
        $request->validate([
            'photo' => 'image|mimes:jpeg,jpg,png|max:2048',
            'description' => 'nullable|string',
        ]);

        $photoPath = null;
        if ($request->hasFile('photo')) {
            $photoPath = $request->file('photo')->store('absence_photos', 'public');
        }
        $description = $request->input('description', '');
        $user = JWTAuth::parseToken()->authenticate();
        $emp_id = $user->id;
        $ip = Http::get('https://api.ipify.org')->body();
        $geolocation = GeolocationHelper::getGeolocation($ip);
        if ($geolocation) {
            $geolocation = $geolocation['city'] . ', ' . $geolocation['region'] . ', ' . $geolocation['country'] . ', ' . $geolocation['loc'] ?? 'Unknown';  
        } else {
            $geolocation = 'Unknown';  
        }
        DB::statement('CALL do_absence(?, ?, ?, ?)', [$emp_id, $photoPath, $geolocation, $description]);
        return response()->json(['message' => 'Absence logged successfully']);
    }

}
