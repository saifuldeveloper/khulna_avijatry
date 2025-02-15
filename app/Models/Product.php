<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    public static function getNextId()
    {
        $last = self::where('id', 'not like', 'X-%')->orderByRaw('convert(conv(id, 16, 10), signed) desc')->first();
        if (!$last) {
            // return '100';
            return 'R-100';
        }
        $lastCode = substr($last->code, 2); // Remove 'R-' prefix
        $lastId = hexdec($lastCode);  
        // $lastId = hexdec($last->code);
        // $nextId = dechex($lastId + 1);
        $nextId = dechex($lastId + 1);
        return 'R-' . strtoupper($nextId);
    }



    protected $fillable = [
        "name",
        "code",
        "type",
        "barcode_symbology",
        "brand_id",
        "category_id",
        "unit_id",
        "purchase_unit_id",
        "sale_unit_id",
        "cost",
        "price",
        "qty",
        "alert_quantity",
        "daily_sale_objective",
        "promotion",
        "promotion_price",
        "starting_date",
        "last_date",
        "tax_id",
        "tax_method",
        "image",
        "file",
        "is_embeded",
        "is_batch",
        "is_variant",
        "is_diffPrice",
        "is_imei",
        "featured",
        "product_list",
        "variant_list",
        "qty_list",
        "price_list",
        "product_details",
        "variant_option",
        "variant_value",
        "is_active",
        "is_sync_disable",
        "woocommerce_product_id",
        "woocommerce_media_id",
        "tags",
        "meta_title",
        "meta_description"

    ];

    public function category()
    {
        return $this->belongsTo('App\Models\Category');
    }

    public function brand()
    {
        return $this->belongsTo('App\Models\Brand');
    }

    public function unit()
    {
        return $this->belongsTo('App\Models\Unit');
    }

    public function variant()
    {
        return $this->belongsToMany('App\Models\Variant', 'product_variants')->withPivot('id', 'item_code', 'additional_cost', 'additional_price');
    }

    public function scopeActiveStandard($query)
    {
        return $query->where([
            ['is_active', true],
            ['type', 'standard']
        ]);
    }

    public function scopeActiveFeatured($query)
    {
        return $query->where([
            ['is_active', true],
            ['featured', 1]
        ]);
    }

    public function productSales()
    {
        return $this->hasMany(Product_Sale::class);
    }
    
    public function productVariants()
    {
        return $this->hasMany(ProductVariant::class);
    }
}
