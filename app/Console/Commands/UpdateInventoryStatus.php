<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\Models\Inventory;
use Carbon\Carbon;
use Illuminate\Support\Facades\Log;

class UpdateInventoryStatus extends Command
{
    // The name and signature of the console command.
    protected $signature = 'inventory:update-status';

    // To manually test the command before it runs on the schedule, you can run the following Artisan command:
    // php artisan inventory:update-status

    // The console command description.
    protected $description = 'Update inventory status from 0 (outofstock) to 1 (instock) based on certain conditions';

    // Execute the console command
    public function handle()
    {
        // Get the current date in 'Y-m-d' format
        $currentdate = Carbon::now()->toDateString();

        // Update the inventory entries where in_stock_date equals the current date and status is 0, meaning 'outofstock'
        $inventoriesToUpdate    = Inventory::where('in_stock_date', $currentdate)
                                                ->where('status', 0)
                                                ->get();

        // Loop through the inventories and log the inventory_item_id for each updated record
        foreach ($inventoriesToUpdate as $inventory) {
            // Update the status
            $inventory->status = 1;
            $inventory->save();

            // Log the inventory_item_id of the updated record
            Log::channel('command_inventory_status_update')->info("Inventory Item ID {$inventory->inventory_item_id} has been updated to '1: instock'.");

            // Optionally, you can print out a message to the console
            $this->info("Inventory Item ID {$inventory->inventory_item_id} updated to '1: instock'.");
        }

        // If no inventories were updated, log that no updates were made
        if ($inventoriesToUpdate->isEmpty()) {

            Log::channel('command_inventory_status_update')->info("No inventories were updated. No inventory records with '0: outofstock' status were found for the current date.");
        }
    }
}
