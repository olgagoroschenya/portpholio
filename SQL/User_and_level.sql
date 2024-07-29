Таблица - user						

id	user_name	level_id	skill
1	Anton	    1	        900000      
2	Denis	    3	        4000
3	Petr	    2	        50000
4	Andrey	    4	        20
5	Olga	    1	        600000
6	Anna	    1           1600000


Таблица - level						
id	level_name					
1	admin					
2	power_user					
3	user					
4	guest					

Отобрать из таблицы user всех пользователей, у которых level_id=1, skill > 799000 и в имени встречается буква а														
SELECT user_name  from users where level_id=1 and skill>799000 and user_name like '%a%' or user_name like 'a%';

Вывести все данные из таблицы user в порядке убывания по полю skill
select * from users order by skill desc;

Добавить в таблицу user нового пользователя по имени Oleg, с уровнем 4 и skill =10
insert into users (user_name, level_id,skill)
VALUES ('Oleg', 4, 10);

Обновить данные в таблице user -  для пользователей с level_id меньше 2 проставить skill 2000000
update users set skill=2000000 where level_id<2;

Выбрать user_name всех пользователей уровня admin используя подзапрос
SELECT user_name from users where level_id in (select id_ from levels where level_name='admin');

Выбрать user_name всех пользователей уровня admin используя join	
select user_name from users 
join levels on users.level_id=levels.id_ where level_name='admin';

Удалить всех пользователей, у которых skill меньше 100000
delete from users where skill<100000;
