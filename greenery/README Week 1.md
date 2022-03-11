
### The following contains answers to Week 1 questions

Part 3
Q1: 130 unique users
    SELECT COUNT(DISTINCT user_id) AS total_unique_users FROM dbt_joren_ha.stg_users

Q2: On average 15.04 orders per hour
    WITH orders_per_hour AS (
        SELECT 
            COUNT(*) AS total_orders
        FROM dbt_joren_ha.stg_orders
        GROUP BY DATE_TRUNC('hour', created_at) 
    )

    SELECT AVG(total_orders) AS average_orders FROM orders_per_hour

Q3: 3 days, 21 hours, 24 minutes and 11.8 seconds average delivery time
    SELECT 
        AVG(delivered_at - created_at) AS average_delivery_time
    FROM dbt_joren_ha.stg_orders
    
Q4: 25 users 1 order only, 28 users 2 orders, 71 users 3 or more orders

    WITH orders AS (
        SELECT 
            user_id
            , COUNT(*) AS total_orders
        FROM dbt_joren_ha.stg_orders
        GROUP BY 1
    )

    SELECT 
        CASE WHEN total_orders = 1 THEN '1' 
            WHEN total_orders = 2 THEN '2' ELSE '3+' END AS total_orders
        , COUNT(user_id) AS total_users
    FROM orders
    GROUP BY 1
    ORDER BY 1

Q5: 16.3 sessions per hour on average

    WITH sessions_per_hour AS (
        SELECT 
            DATE_TRUNC('hour', created_at)  AS hour
        , COUNT(DISTINCT session_id) AS unique_sessions
        FROM dbt_joren_ha.stg_events
        GROUP BY 1
    )

    SELECT AVG(unique_sessions) AS average_sessions FROM sessions_per_hour