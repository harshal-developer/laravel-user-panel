<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\User;
use Illuminate\Support\Facades\Hash;

class AuthController extends Controller
{   
    // **Developed on 2 oct 2025
    // authenticate 
    public function showLoginForm()
    {
        return view('auth.login');
    }

    public function login(Request $request)
    {
        $credentials = $request->validate([
            'email' => ['required', 'email'],
            'password' => ['required'],
        ]);

        // Remember me : if session timed out but you enabled remember me then still you are able to login 
        $remember = $request->has('remember');

        if (Auth::attempt($credentials, $remember)) {
            $request->session()->regenerate();
            return redirect()->intended(route('users.index'));
        }

        return back()->withErrors([
            'email' => 'Invalid Credentials',
        ]);
    }

    // Registration 
    public function register()
    {
        return view('auth.register');
    }

    public function store(Request $request)
    {
        // validations here
        $request->validate([
            'name' => 'required|string|max:30',
            'email' => 'required|email|max:30|unique:users,email',
            'password' => 'required|confirmed|min:6',
            'gender' => 'required',
            'phone' => 'required|digits:10|unique:users,phone',
        ]);

        User::create([
            'name' => $request->name,
            'email' => $request->email,
            'password' => Hash::make($request->password), //encrypted
            'gender' => $request->gender,
            'phone' => $request->phone,
        ]);

        return redirect()->route('login')->with('success', 'Account created successfully! You can now login.');
    }


    public function logout(Request $request)
    {
        Auth::logout();
        $request->session()->invalidate();
        $request->session()->regenerateToken();
        return redirect()->route('login');
    }
}
