# Write your MySQL query statement below
with first_login as (
    select player_id,min(event_date) as first_login_date
    from Activity
    group by player_id
),
next_appear_player as (
    select a.player_id,count(*) as player_count
    from Activity a join first_login fb
    on a.player_id=fb.player_id
    where a.event_date=date_add(fb.first_login_date,interval 1 day)
    group by a.player_id
),
total_count_ as (
    select count(distinct player_id) as total_count from Activity 
)
select coalesce(round((select sum(player_count) from next_appear_player)/(select total_count from total_count_),2),0)
as fraction  
