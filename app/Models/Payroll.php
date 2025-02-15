<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Payroll extends Model
{
    protected $fillable =[
        "reference_no", "employee_id", "account_id", "user_id", "salary",
        "amount", "paying_method", "note", "created_at"
    ];

    public function employee()
    {
    	return $this->belongsTo('App\Models\Employee');
    }
}
