/* Создайте хранимую функцию hello(), которая будет возвращать приветствие, 
в зависимости от текущего времени суток.
С 6:00 до 12:00 функция должна возвращать фразу "Доброе утро", 
с 12:00 до 18:00 фразу "Добрый день", с 18:00 до 00:00 фразу "Добрый вечер",
с 00:00 до 6:00 "Доброй ночи"
*/

DELIMITER //

DROP FUNCTION IF EXISTS hello//
CREATE function hello() -- (time_now time)
returns varchar(100) not deterministic
begin
	
	declare time_now time;
	set time_now = HOUR(NOW());

	if (time_now >= 6 and time_now < 12) THEN return "Доброе утро";
  	elseif (time_now >= 12 and time_now < 18) THEN return "Добрый день";
  	elseif (time_now >= 18 and time_now < 24) THEN return "Добрый вечер";
  	else return "Доброй ночи";
  	end if;

end//

SELECT hello()//