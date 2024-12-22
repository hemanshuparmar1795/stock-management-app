<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Validator;

class UserController extends Controller
{

    /**
     * Get authenticated user's info.
     */
    public function getUser()
    {
        $user = auth()->user();
  
        if (is_null($user)) {

            return response()->json([
                'status'    => 'failed',
                'message'   => 'User is not found!',
            ], 200);
        }

        $response   = [
            'status'    => 'success',
            'message'   => 'Fetch the user\'s details successfully.',
            'data'      => [
                'userid'        => trim($user->id),
                'username'      => trim($user->name),
                'email'         => trim($user->email),
            ],
        ];
        
        return response()->json($response, 200);
    }

    public function updateUser(Request $request)
    {
        // Get the authenticated user
        $user = auth()->user();

        // Check if the user is null
        if (is_null($user)) {

            return response()->json([
                'status'  => 'failed',
                'message' => 'User not found.',
            ], 200);
        }

        // Get the user ID
        $userid = trim($user->id);

        // Initialize validation rules
        $rules = [];

        // Apply validation rules based on the input
        if ($request->has('name') && !empty($request->name)) {
            $rules['name'] = 'required|string|max:255';
        }

        if ($request->has('email') && !empty($request->email)) {
            $rules['email'] = 'required|string|email|max:255|unique:users,email,' . $userid;
        }

        if ($request->has('password') && !empty($request->password)) {
            $rules['password'] = 'required|string|min:8|confirmed';
        }

        // Validate incoming request
        $validate = Validator::make($request->all(), $rules);

        // Check if validation fails
        if ($validate->fails()) {
            return response()->json([
                'status'  => 'failed',
                'message' => 'Validation Error!',
                'data'    => $validate->errors(),
            ], 403);
        }

        // Update user information if fields are provided
        if ($request->has('name') && !empty($request->name)) {
            $user->name = $request->name;
        }

        if ($request->has('email') && !empty($request->email)) {
            $user->email = $request->email;
        }

        if ($request->has('password') && !empty($request->password)) {
            // Hash the password before saving
            $user->password = Hash::make($request->password); 
        }

        // Save the updated user
        $user->save();

        // Response data after successful update
        $response = [
            'status'  => 'success',
            'message' => 'User updated successfully.',
            'data'    => $user,
        ];

        return response()->json($response, 200);
    }
}