-- Первый вариант решения
-- use shop;
-- 
-- select name from products
-- 	union
-- select name FROM catalogs


-- Второй вариант решения
use shop;
select 
	p.name as p_name, 
	c.name as c_name
from 
	products as p
join
	catalogs as c

where p.catalog_id = c.id
order by c.name DESC 



