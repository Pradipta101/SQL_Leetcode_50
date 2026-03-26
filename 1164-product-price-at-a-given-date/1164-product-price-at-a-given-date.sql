# Write your MySQL query statement below
/*select product_id, new_price as price 
from Products
where (product_id, change_date) IN
 (
    select product_id, max(change_date)
    from Products 
    where change_date <= '2019-08-16'
    group by product_id
 )

 Union

 select product_id, 10 as price 
 from Products
 where product_id not In
 (
    select product_id
    from Products 
    where change_date <= '2019-08-16'
 )*/

 select product_id,
       coalesce(new_price, 10) as price
from (
    select product_id,
           new_price,
           row_number() over (
               partition by product_id
               order by change_date desc
           ) as rn
    from Products
    where change_date <= '2019-08-16'
) t
where rn = 1

union

select product_id, 10 as price
from Products
group by product_id
having min(change_date) > '2019-08-16';