# Write your MySQL query statement below
-- total distinct product in the product table
-- if a customer bought total is equal to that number then return that customer id


select customer_id
from Customer
group by customer_id
having count(distinct product_key)=(select count(distinct product_key) from Product)
