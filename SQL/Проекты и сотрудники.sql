 create table employee (
employee_id int primary key,
first_name varchar,
last_name varchar);
create table projects (
project_id serial primary KEY,
project_name VARCHAR);
create TABLE  titles (
Id serial primary key,
titel_name VARCHAR);
create table  positions (
Id serial PRIMARY key,
employee_id int,
project_id int,
title_id  int,
salary numeric(19,2));
insert into projects (project_name)
values ('ПУМЧД'),
('ЛОГЗ'),
('RTY');
insert into titles (titel_name)
values ('admin'),
('deloper'),
('tester'),
('manager');
insert into positions (employee_id, project_id, title_id, salary)
values (1, 1, 1, 40000.00),
(2, 1, 3, 40000.00),
(3, 1, 3, 50000.00),
(5, 1, 4, 60000.00),
(5, 2, 4, 60000.00),
(5, 3, 4, 60000.00),
(2, 2, 3, 40000.00),
(3, 2, 3, 50000.00);
Описание задания
1) Вывести среднюю заработную плату всех тестировщиков на проекте “ПУМЧД”.
Ответ должен содержать столбцы:
 Название проекта;
 Название должности;
 Средняя заработная плата.
2) Вывести всех работников, которые работают сразу на нескольких проектах.
Ответ должен содержать следующие столбцы:
 Имя и фамилия сотрудника;
 Название должности.
SELECT project_name as Проект, titel_name as Должность, round(avg(salary), 2) as Средняя_зп from projects pr
join positions po on pr.project_id=po.project_id
join titles ti on po.title_id=ti.id
where titel_name='tester' and project_name='ПУМЧД'
GROUP by project_name, titel_name;
select concat(first_name, ' ', last_name) as Имя_Фамилия_сотрудника, titel_name as Должность from employee e
join positions po on e.employee_id=po.employee_id
join titles ti on po.title_id=ti.id
group by Имя_Фамилия_сотрудника, Должность having count(project_id)>1;