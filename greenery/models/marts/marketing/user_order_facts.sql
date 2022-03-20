{{
  config(
    materialized='table'
  )
}}

SELECT 
  users.user_id
  , users.first_name
  , users.last_name
  , users.email
  , addresses.address
  , users.phone_number
  , orders.average_delivery_time
  , orders.total_order_cost
  , orders.total_shipping_cost
  , orders.total_order_total
  , orders.first_order_date
  , orders.last_order_date
  , orders.total_orders
 
FROM {{ ref('int_orders_aggregate') }} AS orders
LEFT JOIN {{ ref('stg_users') }} AS users
  ON orders.user_id = users.user_id
LEFT JOIN {{ ref('stg_addresses') }} AS addresses
  ON users.address_id = addresses.address_id
