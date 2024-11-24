<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Support\Facades\DB;

class CreateInsertEmployeeProcedure extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        DB::unprepared('
            DROP PROCEDURE IF EXISTS insert_employee;
            CREATE PROCEDURE insert_employee(
                p_name VARCHAR(255),
                p_email VARCHAR(255),
                p_password VARCHAR(255),
                p_dob DATE,
                p_phone VARCHAR(20),
                p_gender VARCHAR(20),
                p_photo VARCHAR(255),
                p_address TEXT,
                p_nik VARCHAR(20),
                p_department VARCHAR(100),
                p_position VARCHAR(100),
                p_salary DECIMAL(10, 2)
            )
            BEGIN
                INSERT INTO employees (
                    name,
                    email,
                    password,
                    dob,
                    phone,
                    gender,
                    photo,
                    address,
                    nik,
                    department,
                    position,
                    salary,
                    created_at,
                    updated_at
                ) VALUES (
                    p_name,
                    p_email,
                    p_password,
                    p_dob,
                    p_phone,
                    p_gender,
                    p_photo,
                    p_address,
                    p_nik,
                    p_department,
                    p_position,
                    p_salary,
                    NOW(),
                    NOW()
                );
            END;

        ');
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        DB::unprepared('DROP PROCEDURE IF EXISTS insert_employee');
    }
}
