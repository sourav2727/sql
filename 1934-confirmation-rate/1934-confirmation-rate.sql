# Write your MySQL query statement below
-- with cte as (
--     select user_id,count(*) as total_request
--     from Confirmations 
--     group by user_id
-- ),
-- cte_1 as (select user_id,count(*) as confiremed_request
-- from Confirmations
-- where action='confirmed')
-- select c.user_id,round(c1.confiremed_request/c.total_request,2) as confirmation_rate 
-- from cte c join cte_1 c1 on c1.user_id=c.user_id

with cte as (select s.user_id,count(c.action) as total_request
from Signups s left join Confirmations c on c.user_id=s.user_id
group by s.user_id),
cte_1 as (
    select s.user_id,sum(case
    when  c.action='confirmed' then 1 else 0 end) as confirm_request
from Signups s left join Confirmations c on c.user_id=s.user_id
group by s.user_id
)
select c.user_id,coalesce(round(c.confirm_request/c1.total_request,2),0) as confirmation_rate
from cte_1
c join cte c1 on c1.user_id=c.user_id

