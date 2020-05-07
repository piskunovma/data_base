/*
Создайте представление, которое выводит название name товарной позиции 
из таблицы products и соответствующее название каталога name из таблицы catalogs.
*/
drop view if exists list_of_products;
create view list_of_products as

select 
	p.name as `name_catalogs`,
	c.name as `name_products`
	 
from 
	products p
join
	catalogs c
on
	c.id = p.catalog_id
;

select * from list_of_products