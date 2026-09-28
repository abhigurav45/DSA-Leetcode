# Write your MySQL query statement below
WITH daily AS (
    SELECT 
        visited_on, 
        SUM(amount) AS amount
    FROM Customer
    GROUP BY visited_on
),
moving_avg AS (
    SELECT 
        visited_on,
        SUM(amount) OVER (
            ORDER BY visited_on 
            ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
        ) AS amount,
        ROUND(AVG(amount) OVER (
            ORDER BY visited_on 
            ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
        ), 2) AS average_amount,
        MIN(visited_on) OVER () AS first_date
    FROM daily
)
SELECT 
    visited_on,
    amount,
    average_amount
FROM moving_avg
WHERE visited_on >= DATE_ADD(first_date, INTERVAL 6 DAY)
ORDER BY visited_on;
