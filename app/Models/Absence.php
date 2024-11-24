<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Absent extends Model
{
    use HasFactory;

    protected $fillable = [
        'employee_id',
        'clock_in',
        'clock_out',
        'clock_in_photo',
        'clock_out_photo',
        'clock_in_geolocation',
        'clock_out_geolocation',
        'clock_in_description',
        'clock_out_description',
    ];

    public function employee()
    {
        return $this->belongsTo(Employee::class);
    }
}
