{{
  config(
    materialized='table'
  )
}}

SELECT 
  events.event_id
  , events.session_id
  , events.user_id
  , events.event_type
  , events.page_url
  , events.order_id
  , orders.estimated_delivery_at
  , orders.delivered_at
  , orders.status
  , orders.order_total
  , events.product_id
 
FROM {{ ref('stg_events') }} AS events
LEFT JOIN {{ ref('stg_orders') }} AS orders
  ON events.order_id = orders.order_id
LEFT JOIN {{ ref('stg_users') }} AS users
  ON events.user_id = users.user_id
