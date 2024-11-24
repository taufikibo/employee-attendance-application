<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Support\Facades\DB;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        DB::unprepared('
            DROP PROCEDURE IF EXISTS do_absence;
            CREATE PROCEDURE do_absence(
                IN emp_id INT, 
                IN photo VARCHAR(255), 
                IN geolocation VARCHAR(255), 
                IN description VARCHAR(255) 
            )
            BEGIN
                DECLARE record_count INT; 

                -- Hitung apakah sudah ada record absensi hari ini
                SELECT COUNT(*) INTO record_count
                FROM absence
                WHERE employee_id = emp_id AND DATE(created_at) = CURRENT_DATE();

                -- Jika sudah ada record, maka update clock_out
                IF record_count > 0 THEN
                    UPDATE absence
                    SET 
                        clock_out = NOW(), -- Waktu clock out
                        clock_out_geolocation = geolocation, -- Lokasi clock out
                        clock_out_photo = photo, -- Foto clock out
                        clock_out_description = description, -- Deskripsi clock out
                        updated_at = NOW() -- Update timestamp
                    WHERE employee_id = emp_id AND DATE(created_at) = CURRENT_DATE();

                -- Jika belum ada record, tambahkan record baru untuk clock_in
                ELSE
                    INSERT INTO absence (
                        employee_id, 
                        clock_in, 
                        clock_in_photo, 
                        clock_in_geolocation, 
                        clock_in_description, 
                        created_at, 
                        updated_at
                    )
                    VALUES (
                        emp_id, 
                        NOW(), 
                        photo, 
                        geolocation, 
                        description, 
                        NOW(), 
                        NOW()
                    );
                END IF;
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
        DB::unprepared('DROP PROCEDURE IF EXISTS do_absence');
    }
};
