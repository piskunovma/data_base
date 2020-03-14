use shop;


SELECT 
ROUND(AVG(TO_DAYS(now())/365.25 - TO_DAYS(birthday_at)/365.25) , 0) as avg
from users
;