<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Store;
use Carbon\Carbon;

class StoreSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        // Direct dummy store data
        $defaultStores = [];

        for ($i = 1; $i <= 26; $i++) {
            $defaultStores[] = [
                'store_id'                 => $i,
                // Store 1, Store 2, ..., Store 26
                'store_name'                => 'Store ' . $i,
                'status'                    => 1,
            ];
        }

        // Insert data into the database
        foreach ($defaultStores as $defaultStore) {

            // Check if a store with the same store id already exists
            $store = Store::where('store_id', $defaultStore['store_id'])->first();

            if(empty($store)) {

                $store                      = new Store();
                $store->store_id            = $defaultStore['store_id'];
            }

            $store->store_name              = $defaultStore['store_name'];
            $store->status                  = $defaultStore['status'];
            $store->save();
        }
    }
}