# Write your MySQL query statement below
SELECT 
    CASE 
        -- If id is odd and not the last row, increment id by 1
        WHEN id % 2 = 1 AND id < (SELECT MAX(id) FROM Seat) THEN id + 1
        -- If id is odd and IS the last row, keep it the same
        WHEN id % 2 = 1 AND id = (SELECT MAX(id) FROM Seat) THEN id
        -- If id is even, decrement id by 1
        ELSE id - 1
    END AS id,
    student
FROM Seat
ORDER BY id ASC;

