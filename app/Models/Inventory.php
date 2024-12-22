<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Inventory extends Model
{
    use HasFactory;

    protected $primaryKey = 'inventory_item_id';

    // Define the table and the fields that can be mass-assigned
    protected $table = 'inventories';

    // Allow mass-assignment for these fields
    protected $fillable = [
        'inventory_item_code',
        'inventory_item_name',
        'quantity',
        'location',
        'store_id',
        'in_stock_date',
        'status',
    ];

    // Relationship with Store model
    public function store()
    {
        return $this->belongsTo(Store::class);
    }
}
