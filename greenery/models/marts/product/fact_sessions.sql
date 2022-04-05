{{
  config(
    materialized='table'
  )
}}


SELECT 
    created_at::date AS created_date
    , COUNT(DISTINCT CASE WHEN event_type IN ('page_view', 'checkout', 'add_to_cart') THEN session_id END) AS level_1
    , COUNT(DISTINCT CASE WHEN event_type IN ('add_to_cart', 'checkout') THEN session_id END) AS level_2
    , COUNT(DISTINCT CASE WHEN event_type IN ('checkout') THEN session_id END) AS level_3
    , ROUND(COUNT(DISTINCT CASE WHEN event_type IN ('checkout') THEN session_id END) / COUNT(DISTINCT CASE WHEN event_type IN ('page_view', 'checkout', 'add_to_cart') THEN session_id END), 4) AS conversion
FROM {{ ref('stg_events') }}
GROUP BY 1