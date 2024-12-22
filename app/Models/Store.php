<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Store extends Model
{
    use HasFactory;

    protected $primaryKey = 'store_id';

    // Define the table and the fields that can be mass-assigned
    protected $table = 'stores';

    // Allow mass-assignment for these fields
    protected $fillable = [
        'store_name',
        'status',
    ];

    public function inventories()
    {
        return $this->hasMany(Inventory::class);
    }
}
