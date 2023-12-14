<?php

namespace App\Http\Controllers\API;

use App\Models\User;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use App\Http\Controllers\BaseController as BaseController;
use Validator;

class RegisterController extends BaseController
{
    public function register(Request $request)
    {
       $validator = validator::make($request->all(),[
            'name' => 'required|string|max:255',
            'email' => 'required|email|max:255|unique:users,email',
            'password' => 'required|min:6',
            // 'password' => 'required|min:6|confirm',
            'confirm_password' => 'required|same:password',
        ]);

        if($validator->fails())
        {
            return $this->sendError('Validation Error', $validator->errors());
        }

        $user = User::create([
            'name' => $request->name,
            'email' => $request->email,
            'password' => Hash::make($request->password),
        ]);

        $success['token'] = $user->createToken('RestApi')->plainTextToken;
        $success['name'] = $user->name;

        return $this->sendResponse($success, 'User register successfully');

        // return response()->json(['message' => 'User registered successfully', 'user' => $user]);
    }

    public function login(Request $request)
    {

        $validator = Validator::make($request->all(), [
            'email'    => 'required|email',
            'password' => 'required',
        ]);

        if($validator->fails())
        {
            return $this->sendError('Validation Error', $validator->errors());
        }

        if (Auth::attempt(['email' => $request->email, 'password' => $request->password])) {
            $user = Auth::user();
            $success['token'] = $user->createToken('RestApi')->plainTextToken;
            $success['name'] = $user->name;

            return $this->sendResponse($success, 'User Logged successful');

            // return response()->json(['message' => 'Login successful', 'user' => $user, 'token' => $token]);
        } else {

            return $this->sendError('Unauthorized', ['error' =>'Unauthorized credentials']);
            // return response()->json(['message' => 'Invalid credentials'], 401);
        }


    }

    public function logout()
    {
        auth()->user()->tokens()->delete();
        return $this->sendResponse([], 'User Logged Out');
    }

    // public function logout(Request $request)
    // {
    //     $request->user()->currentAccessToken()->delete();

    //     return $this->sendResponse([], 'User Logged Out');
    // }
}


// $request->validate([
        //     'email' => 'required|email',
        //     'password' => 'required',
        // ]);

        // if (Auth::attempt(['email' => $request->email, 'password' => $request->password])) {
        //     $user = Auth::user();
        //     $token = $user->createToken('auth_token')->plainTextToken;

        //     return response()->json(['message' => 'Login successful', 'user' => $user, 'token' => $token]);
        // } else {
        //     return response()->json(['message' => 'Invalid credentials'], 401);
        // }
