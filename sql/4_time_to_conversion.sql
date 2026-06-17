-- Time to conversion analysis

-- Use a CTE to calculate the time differences between key funnel stages for users who completed a purchase
WITH user_journey AS (
    SELECT
        user_id,
        MIN(CASE WHEN event_type = 'page_view' THEN event_date END) AS view_time,
        MIN(CASE WHEN event_type = 'add_to_cart' THEN event_date END) AS cart_time,
        MIN(CASE WHEN event_type = 'purchase' THEN event_date END) AS purchase_time

    FROM user_events

    GROUP BY user_id
    HAVING MIN(CASE WHEN event_type = 'purchase' THEN event_date END) IS NOT NULL
)

SELECT
    COUNT(*) AS converted_users,

    -- Calculate average view to cart minutes
    ROUND(AVG(EXTRACT(EPOCH FROM (cart_time - view_time)) / 60), 2) AS avg_view_to_cart_minutes,

    -- Calculate average cart to purchase minutes
    ROUND(AVG(EXTRACT(EPOCH FROM (purchase_time - cart_time)) / 60), 2) AS avg_cart_to_purchase_minutes,

    -- Calculate average total journey minutes
    ROUND(AVG(EXTRACT(EPOCH FROM (purchase_time - view_time)) / 60), 2) AS avg_total_journey_minutes

FROM user_journey;
