# Write your MySQL query statement below

select e.name
from Employee e
join Employee m on e.id=m.managerId
group by e.id,e.name
having count(*)>=5


-- with cte as (select managerId,count(*) as total_count
-- from Employee
-- where managerId is not null
-- group by managerId)

-- select e.name
-- from cte c join Employee e on c.managerId=e.id
-- where c.total_count>=5