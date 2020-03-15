/*Таблица users была неудачно спроектирована. 
 Записи created_at и updated_at были заданы типом VARCHAR и в них долгое время
 помещались значения в формате "20.10.2017 8:10". 
 Необходимо преобразовать поля к типу DATETIME, сохранив введеные ранее значения.
*/
use vk_test;

-- UPDATE 

-- ALTER TABLE vk_test.users MODIFY COLUMN updated_at DATETIME NULL;
-- ALTER TABLE vk_test.users MODIFY COLUMN created_at DATETIME NULL;

SELECT
  id,
  name,
  birthday_at,
  DATETIME(created_at) created_at,
  DATETIME(updated_at) updated_at
FROM
users;
