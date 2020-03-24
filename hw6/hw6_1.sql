/*
 Пусть задан некоторый пользователь.
Из всех друзей этого пользователя найдите человека, 
который больше всех общался с нашим пользователем.
*/
 
 
 SELECT user_id FROM (
	(SELECT to_user_id as user_id, COUNT(*) as message_total FROM messages WHERE from_user_id = 1 GROUP BY to_user_id)
	UNION
	(SELECT from_user_id as user_id, COUNT(*) as message_total FROM messages WHERE to_user_id = 1 GROUP BY from_user_id)
) as my_tmp_table
WHERE user_id IN (
  		SELECT initiator_user_id FROM friend_requests WHERE (target_user_id = 1) AND status='approved' -- ИД друзей, заявку которых я подтвердил
 		union
  		SELECT target_user_id FROM friend_requests WHERE (initiator_user_id = 1) AND status='approved' -- ИД друзей, подрвердивших мою заявку
	) or
	user_id IN (
		SELECT initiator_user_id FROM friend_requests WHERE (target_user_id = 1) AND status='approved' -- ИД друзей, заявку которых я подтвердил
		union
		SELECT target_user_id FROM friend_requests WHERE (initiator_user_id = 1) AND status='approved' -- ИД друзей, подрвердивших мою заявку
	)
GROUP by user_id
ORDER by any_value(message_total) DESC 
limit 1
;
