/*В таблице products есть два текстовых поля: 
name с названием товара и description с его описанием. 
Допустимо присутствие обоих полей или одно из них. 
Ситуация, когда оба поля принимают неопределнное 
значение NULL неприемлема. 
Используя триггеры, добейтесь того, 
чтобы одно из этих полей или оба поля были заполнены. 
При попытке присвоить полям NUUL-значение необходимо 
отменить операцию.
*/

USE shop;

DROP trigger if exists tr_notnull;

delimiter //

CREATE TRIGGER tr_notnull AFTER INSERT
ON products FOR EACH ROW

begin
	
if new.name is NULL and new.description is null THEN 
	signal sqlstate '45000' 
	set message_text = 'Значения полей name и description не могут быть NULL одновременно!';
end if;

end//

delimiter ;
