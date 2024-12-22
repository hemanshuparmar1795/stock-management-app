<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('inventories', function (Blueprint $table) {
            $table->increments('inventory_item_id');
            $table->string('inventory_item_code');
            $table->string('inventory_item_name');
            $table->integer('quantity');
            $table->string('location');
            $table->foreignId('store_id')->constrained('stores'); // Foreign Key to the Stores Table
            $table->date('in_stock_date');
            $table->tinyInteger('status')->default(1)->comment('0: outofstock, 1: instock');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('inventories');
    }
};
