<?php

namespace App\Http\Controllers;

use App\Models\Inventory;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Carbon\Carbon;

class InventoryController extends Controller
{

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $query = Inventory::query();

        // Handle sorting (Tabulator will send 'sort' query parameter)
        if ($request->has('sort')) {

            $sortcolumn     = $request->input('sort');
            $sortdirection  = $request->input('direction', 'desc');
            
            $query->orderBy($sortcolumn, $sortdirection);
        }

        // Handle search (Tabulator will send 'search' query parameter)
        if ($request->has('search') && !empty($request->input('search'))) {

            $search = trim($request->input('search'));

            // Apply search to name and description (you can extend this to other fields)
            $query->where(function ($query) use ($search) {

                $query->where('inventory_item_code', 'like', '%' . $search . '%')
                    ->orWhere('inventory_item_code', 'like', '%' . $search . '%')
                    ->orWhere('location', 'like', '%' . $search . '%');
            });
        }

        // Handle pagination (Tabulator will send 'page' and 'pagesize' query parameters)
        $page       = $request->input('page', 1);
        $pagesize   = $request->input('pagesize', 10);
        
        $inventories     = $query->paginate($pagesize, ['*'], 'page', $page);

        return response()->json([
            'status'    => 'success',
            'message'   => 'Inventory items were successfully fetched.',
            'rows'      => $inventories->items(),
            'total'     => $inventories->total(),
        ], 200);
    }

    /**
     * Store a newly created inventory in the database.
     */
    public function store(Request $request)
    {
        // Define validation rules
        $validator = Validator::make($request->all(), [
            'inventory_item_code'     => 'required|string|max:255|unique:inventories,inventory_item_code',
            'inventory_item_name'     => 'required|string|max:255',
            'quantity'      => 'required|integer',
            'location'      => 'required|string|max:255',
            'store_id'      => 'required|exists:stores,store_id',
            'in_stock_date' => 'required|date',
            'status'        => 'required|integer',
        ]);

        // If validation fails, return a response with errors
        if ($validator->fails()) {

            return response()->json([
                'status'    => 'failed',
                'message'   => 'Validation Error!',
                'data'      => $validator->errors(),
            ], 422);  // HTTP 422 for validation errors
        }

        try {

            $inventory = Inventory::create([
                'inventory_item_code'       => trim($request->input('inventory_item_code')),
                'inventory_item_name'       => trim($request->input('inventory_item_name')),
                'quantity'                  => intval($request->input('quantity')),
                'location'                  => trim($request->input('location')),
                'store_id'                  => trim($request->input('store_id')),
                'in_stock_date'             => Carbon::parse($request->input('in_stock_date'))->toDateString(),
                'status'                    => intval($request->input('status')),
            ]);

            // Return a success response with the created inventory data
            return response()->json([
                'status'    => 'success',
                'message'   => 'Inventory item has been created successfully.',
                'data'      => $inventory,
            ], 201);  // HTTP 201 Created
        } 
        catch (\Exception $e) {

            // If there is an error, return an error response
            return response()->json([
                'status'    => 'failed',
                'message'   => 'An error occurred while storing the inventory.',
                'error'     => $e->getMessage(),
            ], 500);  // HTTP 500 Internal Server Error
        }
    }

    /**
     * Store multiple inventory items in the database.
     */
    public function bulkStore(Request $request)
    {
        // Define validation rules for bulk data
        $validator = Validator::make($request->all(), [
            // Validate that we have an array of items
            'inventory_items' => 'required|array|min:1',  
            'inventory_items.*.inventory_item_code' => 'required|string|max:255|unique:inventories,inventory_item_code',
            'inventory_items.*.inventory_item_name' => 'required|string|max:255',
            'inventory_items.*.quantity' => 'required|integer',
            'inventory_items.*.location' => 'required|string|max:255',
            'inventory_items.*.store_id' => 'required|exists:stores,store_id',
            'inventory_items.*.in_stock_date' => 'required|date',
            'inventory_items.*.status' => 'required|integer',
        ]);

        // If validation fails, return a response with errors
        if ($validator->fails()) {

            return response()->json([
                'status'    => 'failed',
                'message'   => 'Validation Error!',
                'data'      => $validator->errors(),
            ], 422);  // HTTP 422 for validation errors
        }

        try {

            // Prepare the inventory items for bulk insertion
            $inventories = [];
            
            foreach ($request->input('inventory_items') as $item) {

                $inventories[] = [
                    'inventory_item_code'   => trim($item['inventory_item_code']),
                    'inventory_item_name'   => trim($item['inventory_item_name']),
                    'quantity'              => intval($item['quantity']),
                    'location'              => trim($item['location']),
                    'store_id'              => trim($item['store_id']),
                    'in_stock_date'         => Carbon::parse($item['in_stock_date'])->toDateString(),
                    'status'                => intval($item['status']),
                    'created_at'            => Carbon::now(),  // Set created_at timestamp
                    'updated_at'            => Carbon::now(),  // Set updated_at timestamp
                ];
            }

            // Perform bulk insert
            Inventory::insert($inventories);

            // Return a success response with a message
            return response()->json([
                'status'    => 'success',
                'message'   => 'Inventory items have been created successfully.',
                'data'      => $inventories,
            ], 201);  // HTTP 201 Created
        }
        catch (\Exception $e) {

            // If there is an error, return an error response
            return response()->json([
                'status'    => 'failed',
                'message'   => 'An error occurred while storing the inventory.',
                'error'     => $e->getMessage(),
            ], 500);  // HTTP 500 Internal Server Error
        }
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy($id)
    {
        try {

            // Attempt to find the inventory by ID
            $inventory = Inventory::find($id);

            // If inventory is not found, return a 404 response
            if (is_null($inventory)) {
                
                return response()->json([
                    'status'    => 'failed',
                    'message'   => 'Inventory not found!',
                ], 404); // 404 Not Found
            }

            // Attempt to delete the inventory
            $inventory->delete();

            // Return success response
            return response()->json([
                'status'    => 'success',
                'message'   => 'Inventory deleted successfully.',
            ], 200); // 200 OK
        } 
        catch (\Exception $e) {

            // Catch any exceptions that may occur and return an error response
            return response()->json([
                'status'    => 'failed',
                'message'   => 'An error occurred while deleting the inventory.',
                'error'     => $e->getMessage(), // Optionally include the exception message for debugging
            ], 500); // 500 Internal Server Error
        }
    }
}
