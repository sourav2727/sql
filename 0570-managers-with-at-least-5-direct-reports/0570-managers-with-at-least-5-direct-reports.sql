# Write your MySQL query statement below
with cte as (select managerId,count(*) as total_count
from Employee
where managerId is not null
group by managerId)

select e.name
from cte c join Employee e on c.managerId=e.id
where c.total_count>=5