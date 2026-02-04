# Write your MySQL query statement below
select w.id
from Weather w, weather w1
where datediff(w.recordDate , w1.recordDate ) = 1
and w.temperature > w1.temperature 