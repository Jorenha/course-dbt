{{
  config(
    materialized='table'
  )
}}

WITH event_order_info AS (
SELECT 
  e.session_id
  , e.event_id
  , e.order_id
  , COALESCE(e.product_id, o.product_id) AS product_id
FROM {{ ref('stg_events') }} AS e
LEFT JOIN {{ ref('stg_products') }} AS p
  ON e.product_id = p.product_id
LEFT JOIN {{ ref('stg_order_items') }} AS o
  ON o.order_id = e.order_id
)

SELECT 
  product_id
  , {{ conversion('order_id', 'session_id', 'session_id') }}
FROM event_order_info
GROUP BY 1