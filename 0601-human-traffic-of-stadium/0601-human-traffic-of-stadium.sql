# Write your MySQL query statement below

-- first filter people and filter out same gap
with cte as (select *,
id-row_number() over(order by id asc) as gap
from Stadium
where people>=100)
-- group by same gap and filter count>=3
select id,visit_date,people
from cte
where gap in (
    select gap
    from cte
    group by gap
    having count(*)>=3
)


