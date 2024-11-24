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
        Schema::create('absence', function (Blueprint $table) {
            $table->id();
            $table->timestamps();
            $table->datetime('clock_in')->index();
            $table->datetime('clock_out')->nullable()->index();
            $table->string('clock_in_photo');
            $table->string('clock_out_photo')->nullable();
            $table->string('clock_in_geolocation')->index();
            $table->string('clock_out_geolocation')->nullable()->index();
            $table->string('clock_in_description')->nullable();
            $table->string('clock_out_description')->nullable();
            $table->foreignId('employee_id')->constrained('employees')->onDelete('cascade');
            
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('absence');
    }
};
