<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Unit extends Model
{
    protected $fillable =[

       "unit_name", "operation_value", "is_active"
    ];

    public function product()
    {
    	return $this->hasMany('App\Models\Product');
    }
}
