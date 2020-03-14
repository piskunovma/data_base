use shop;


SELECT value from storehouses_products
order by IF(value > 0, 1, 2), value
;