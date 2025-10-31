<?php

namespace Database\Seeders;

use App\Models\TaskStatus;
use DB;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class TaskStatusSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $statuses = ['новая', 'завершена', 'выполняется', 'в архиве'];

        foreach ($statuses as $status) {
            TaskStatus::create(['name' => $status]);
        }
    }
}
