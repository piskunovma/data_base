use shop;

SELECT * 
from users
where id in (select user_id from orders)
