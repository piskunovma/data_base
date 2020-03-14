use shop;


SELECT 
DATE_FORMAT(date(CONCAT_WS('-',YEAR(now()), MONTH(birthday_at), day(birthday_at))), '%W') as days,
count(*) as result
from users
group by days
;