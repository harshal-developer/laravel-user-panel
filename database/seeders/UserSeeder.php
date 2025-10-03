<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\User;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
         User::factory()->create([
            'name' => 'Harshal',
            'email' => 'person1@gmail.com',
            'password' => bcrypt('person@123'),
            'phone' => '9307357056',
            'gender' => 'male',
        ]);
        User::factory(50)->create(); //insert the dummy data
    }
}
