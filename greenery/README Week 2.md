
### The following contains answers to Week 2 questions
PART 1
What is our user repeat rate? ~ 80%

WITH users AS (
SELECT 
  DISTINCT user_id AS distinct_user
  , COUNT(*) AS total_orders
FROM dbt_joren_ha.stg_orders
GROUP BY 1
)

SELECT CAST(SUM(CASE WHEN total_orders > 1 THEN 1 END) AS float) / COUNT(distinct_user) AS repeat_user_share
FROM users

