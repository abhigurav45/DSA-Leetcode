# Write your MySQL query statement below
WITH LogsNeighbors AS (
    SELECT 
        num,
        LAG(num, 1) OVER (ORDER BY id) AS prev_num,
        LEAD(num, 1) OVER (ORDER BY id) AS next_num
    FROM Logs
)
SELECT DISTINCT num AS ConsecutiveNums
FROM LogsNeighbors
WHERE num = prev_num AND num = next_num;
