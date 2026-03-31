# Write your MySQL query statement below

/*select round(count (distinct player_id)/(select count (distinct player_id) from activity),2) as Fraction
from activity
where (player_id, date_sub(event_date,interval 1 day)) in(
    select player_id, min(event_date) as first_login
    from activity
    group by player_id
)*/

WITH ranked AS (
    SELECT 
        player_id,
        event_date,
        MIN(event_date) OVER (PARTITION BY player_id) AS first_date
    FROM activity
),
filtered AS (
    SELECT DISTINCT player_id
    FROM ranked
    WHERE event_date = DATE_ADD(first_date, INTERVAL 1 DAY)
)
SELECT 
    ROUND(
        COUNT(*) / (SELECT COUNT(DISTINCT player_id) FROM activity),
        2
    ) AS fraction
FROM filtered;
