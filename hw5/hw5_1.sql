use vk_test;

alter table users
add created_at date,
add updated_at date;


update users
set updated_at = now(), created_at = now()
