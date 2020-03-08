use vk;

UPDATE profiles
set is_active = 0
where DATEDIFF(now(), birthday) > 18*365
order by birthday