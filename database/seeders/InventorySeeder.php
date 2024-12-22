<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Inventory;
use Carbon\Carbon;

class InventorySeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        // Direct dummy inventories data
        $defaultInventories = [];

        for ($i = 1; $i <= 100; $i++) {
            $defaultInventories[]           = [
                'inventory_item_id'         => $i, 
                // ITEM001, ITEM002, ..., ITEM100
                'inventory_item_code'       => 'ITEM' . str_pad($i, 3, '0', STR_PAD_LEFT),
                // Item 1, Item 2, ..., Item 100
                'inventory_item_name'       => 'Item ' . $i,
                // Random quantity between 1 and 500
                'quantity'                  => rand(1, 500),
                // Location A, Location B, ..., Location Z, looping
                'location'                  => 'Location ' . chr(64 + ($i % 26)),
                'store_id'                  => rand(1, 26),
                'in_stock_date'             => Carbon::now()->toDateString(),
                // Alternate between 1: instock and  0: outofstock
                'status'                    => $i % 2 == 0 ? 1 : 0,
            ];
        }

        // Insert data into the database
        foreach ($defaultInventories as $defaultInventory) {
            
            // Check if a inventory with the same inventory item id already exists
            $inventory = Inventory::where('inventory_item_id', $defaultInventory['inventory_item_id'])->first();

            if(empty($inventory)) {

                $inventory                      = new Inventory();
                $inventory->inventory_item_id   = $defaultInventory['inventory_item_id'];
            }

            $inventory->inventory_item_code     = $defaultInventory['inventory_item_code'];
            $inventory->inventory_item_name     = $defaultInventory['inventory_item_name'];
            $inventory->quantity                = $defaultInventory['quantity'];
            $inventory->location                = $defaultInventory['location'];
            $inventory->store_id                = $defaultInventory['store_id'];
            $inventory->in_stock_date           = $defaultInventory['in_stock_date'];
            $inventory->status                  = $defaultInventory['status'];
            $inventory->save();
        }
    }
}