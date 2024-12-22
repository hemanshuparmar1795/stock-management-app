<?php

namespace App\Http\Controllers;

use App\Models\Store;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Carbon\Carbon;

class StoreController extends Controller
{

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $query = Store::query();

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

                $query->where('store_name', 'like', '%' . $search . '%');  
            });
        }

        // Handle pagination (Tabulator will send 'page' and 'pagesize' query parameters)
        $page       = $request->input('page', 1);
        $pagesize   = $request->input('pagesize', 10);

        // Execute query with pagination
        $stores     = $query->paginate($pagesize, ['*'], 'page', $page);

        // Return response with store data, total count, etc.
        return response()->json([
            'status'    => 'success',
            'message'   => 'Stores were successfully fetched.',
            'rows'      => $stores->items(),
            'total'     => $stores->total(),
        ], 200);
    }

    /**
     * Get active stores (status = 1) for the dropdown.
     *
     * @return \Illuminate\Http\Response
     */
    public function getActiveStores(Request $request)
    {
        // Fetch stores where status is 1
        $stores = Store::where('status', 1)
                            // Only select the necessary fields for the dropdown
                            ->select('store_id', 'store_name')
                            ->get();

        // Return the response in a format suitable for a dropdown
        return response()->json([
            'status'  => 'success',
            'data'    => $stores
        ], 200);
    }

    /**
     * Store a newly created store in the database.
     */
    public function store(Request $request)
    {
        // Define validation rules
        $validator = Validator::make($request->all(), [
            'store_name'    => 'required|string|max:255',
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

            $store = Store::create([
                'store_name'                => trim($request->input('store_name')),
                'status'                    => intval($request->input('status')),
            ]);

            // Return a success response with the created store data
            return response()->json([
                'status'    => 'success',
                'message'   => 'Store item has been created successfully.',
                'data'      => $store,
            ], 201);  // HTTP 201 Created
        } 
        catch (\Exception $e) {

            // If there is an error, return an error response
            return response()->json([
                'status'    => 'failed',
                'message'   => 'An error occurred while storing the store.',
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

            // Attempt to find the store by ID
            $store = Store::find($id);

            // If store is not found, return a 404 response
            if (is_null($store)) {
                
                return response()->json([
                    'status'    => 'failed',
                    'message'   => 'Store not found!',
                ], 404); // 404 Not Found
            }

            // Attempt to delete the store
            $store->delete();

            // Return success response
            return response()->json([
                'status'    => 'success',
                'message'   => 'Store deleted successfully.',
            ], 200); // 200 OK
        } 
        catch (\Exception $e) {

            // Catch any exceptions that may occur and return an error response
            return response()->json([
                'status'    => 'failed',
                'message'   => 'An error occurred while deleting the store.',
                'error'     => $e->getMessage(), // Optionally include the exception message for debugging
            ], 500); // 500 Internal Server Error
        }
    }
}