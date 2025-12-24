# Write your MySQL query statement below
select
case
when id%2=1 and next is not null
then next
when id%2=0
then prev
when id%2=1 and next is null
then id end as id,student
from
(select *,
lag(id) over(order by id asc) as prev,
lead(id) over(order by id asc) as next
from Seat)t
order by id asc