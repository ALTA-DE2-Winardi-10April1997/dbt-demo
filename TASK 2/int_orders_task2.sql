select
    orders.order_date
    , product.product_name
    , brands.brand_name
    , order_details.quantity  as qty_sold
    , order_details.price as revenue
from {{ ref('stg_order_details')}} as order_details
left join {{ ref('stg_orders')}} as orders
    on order_details.order_id=orders.order_id
left join {{ ref('stg_products')}} as product
    on order_details.product_id=product.product_id
left join {{ ref('stg_brands')}} as brands
    on product.brand_id=brands.brand_id