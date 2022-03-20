{{
  config(
    materialized='table'
  )
}}

SELECT 
  users.user_id
  , AVG(orders.delivered_at - orders.created_at) AS average_delivery_time
  , SUM(orders.order_cost) AS total_order_cost
  , SUM(orders.shipping_cost) AS total_shipping_cost
  , SUM(orders.order_total) AS total_order_total
  , MIN(orders.created_at) AS first_order_date
  , MAX(orders.created_at) AS last_order_date
  , COUNT(*) AS total_orders
 
FROM {{ ref('stg_orders') }} AS orders
LEFT JOIN {{ ref('stg_users') }} AS users
  ON orders.user_id = users.user_id
GROUP BY 1