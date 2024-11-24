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
        Schema::create('employees', function (Blueprint $table) {
            $table->id();
            $table->timestamps();
            $table->string('name')->index();
            $table->string('email')->unique()->index();
            $table->string('password');
            $table->date('dob');
            $table->string('phone')->index();
            $table->string('gender');
            $table->string('photo');
            $table->string('address');
            $table->string('nik')->index();
            $table->string('department')->index();
            $table->string('position')->index();
            $table->decimal('salary', 10, 2);
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('employees');
    }
};
