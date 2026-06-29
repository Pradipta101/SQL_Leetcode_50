# Write your MySQL query statement below
/*select distinct author_id as id 
from views 
where author_id = viewer_id
order by id */

select distinct viewer_id as id 
from Views 
where viewer_id = author_id 
order by id 















































