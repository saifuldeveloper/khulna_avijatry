<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ProductPurchase extends Model
{
    protected $table = 'product_purchases';

    protected $fillable = [
        "purchase_id",
        "product_id",
        "product_batch_id",
        "variant_id",
        "imei_number",
        "qty",
        "recieved",
        "purchase_unit_id",
        "net_unit_cost",
        "selling_price",
        "discount",
        "tax_rate",
        "tax",
        "total"
    ];

    public function purchase()
    {
        return $this->belongsTo('App\Models\Purchase');
    }

    public function product()
    {
        return $this->belongsTo('App\Models\Product');
    }
}
