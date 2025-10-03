<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;

class UserController extends Controller
{

    // used for both fetch and search
    public function index(Request $request)
    {
        $q = $request->input('q'); // search keyword

        $query = User::where('id', '!=', auth()->id()); //in users table, you are not able to see record of logged person (prevent deletion)

        if ($q) {
            $query->where(function ($q2) use ($q) {
                $q2->where('name', 'like', "%{$q}%")
                    ->orWhere('email', 'like', "%{$q}%")
                    ->orWhere('phone', 'like', "%{$q}%");
            });
        }

        $users = $query->paginate(10)->withQueryString(); //pagination 

        return view('users.index', compact('users', 'q'));
    }

    public function create()
    {
        // create.blade.php is a single page both used to add or update operations 
        return view('users.create');
    }
    public function store(Request $request)
    {
        $data = $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|email|unique:users,email',
            'phone' => 'required|digits:10|unique:users,phone',
            'gender' => 'required|in:male,female,other',
            'password' => 'required|string|min:6|confirmed',
        ]);

        $data['password'] = bcrypt($data['password']);

        User::create($data);

        return redirect()->route('users.index')->with('success', 'User created successfully.');
    }


    public function edit(User $user)
    {
        return view('users.create', compact('user'));
    }

    public function update(Request $request, User $user)
    {
        $data = $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|email|unique:users,email,' . $user->id,
            'phone' => 'required|digits:10|unique:users,phone',
            'gender' => 'required|in:male,female,other',
            'password' => 'nullable|string|min:6|confirmed',
        ]);

        // This is important 
        if (!empty($data['password'])) {
            $data['password'] = bcrypt($data['password']);
        } else {
            unset($data['password']);
        }

        $user->update($data);

        return redirect()->route('users.index')->with('success', 'User updated successfully.');
    }

    public function view(Request $request)
    {
        $user = User::find($request->id);

        if (!$user) {
            return response()->json(['status' => false, 'message' => 'User not found'], 404);
        }

        return response()->json(['status' => true,'data' => $user]);
    }

    public function destroy(User $user)
    {
        //$user->delete(); //hard delete 
        // var_dump($user->gender);
        // die;
        if ($user->gender === 'other' || str_contains($user->phone, '+1')) {
            $user->delete();
            return redirect()->route('users.index')->with('success', 'User deleted successfully.');
        }

        // Agar condition match nahi hoti
        return redirect()->route('users.index')->with('error', 'This user cannot be deleted based on the given conditions.');
    }
}
