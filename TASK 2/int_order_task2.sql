select
    orders.order_date
    , products.product_name
    , brands.brand_name
    , sum(order_details.quantity)  as qty_sold
    , sum(order_details.price) as revenue
from {{ ref('stg_order_detail')}} as order_details
left join {{ ref('stg_orders')}} as orders
    on order_details.order_id=orders.order_id
left join {{ ref('stg_products')}} as products
    on order_details.product_id=products.product_id
left join {{ ref('stg_brands')}} as brands
    on products.brand_id=brands.brand_id
group by orders.order_date, products.product_name, brands.brand_name
