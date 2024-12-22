<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\User;
use Illuminate\Support\Facades\Hash;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        // Direct dummy user data
        $defaultUsers = [];

        // Generate 10 users
        for ($i = 1; $i <= 10; $i++) {

            $defaultUsers[]     = [
                'id'                => $i,
                // User 1, User 2, ..., User 10
                'name'              => 'User ' . $i,
                // user1@example.com, user2@example.com, ...
                'email'             => 'user' . $i . '@yopmail.com',
                // Password is hashed
                'password'          => Hash::make('password123'),
            ];
        }

        // Insert the data into the users table
        foreach ($defaultUsers as $defaultUser) {
            
            // Check if a user with the same id already exists
            $user = User::where('id', $defaultUser['id'])->first();

            if(empty($user)) {
                $user                       = new User();
                $user->id                   = $defaultUser['id'];
            }

            $user->name                     = $defaultUser['name'];
            $user->email                    = $defaultUser['email'];
            $user->password                 = $defaultUser['password'];
            $user->save();
        }
    }
}
