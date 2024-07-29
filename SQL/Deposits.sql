create table deposits (
id serial PRIMARY KEY,
clientID int not null,
accountID BIGINT not null,
currency varchar(10),
saldo decimal(10,2),
statusID int);

insert into deposits (clientID, accountID, currency, saldo, statusID)
values (65743, 1354686498, 'RUB', 0, 11255),
(63522, 7319797999, 'EUR', 14.5, 11255),
(43532, 165489952, 'USD', 2164.89, 11255),
(65674, 4687954697, 'USD', 114.0, 11258),
(63522, 1133547879, 'RUB', 0, 11255),
(56889, 265985499, 'EUR', 447.54, 11255),
(65674, 3565659988, 'RUB', 0, 32565),
(65743, 7489415891, 'USD', 57.4, 11255),
(43532, 1564898811, 'RUB', 25574.84, 11255),
(63522, 2645988554, 'USD', 0, 32565),
(43532, 2123659887, 'RUB', 125484.89, 11255),
(43532, 3125477787, 'EUR', 66.95, 11255);
create table status (
statusID int,
statusName VARCHAR(30),
statusCode varchar(20)
);
insert into status (statusID, statusName, statusCode)
values (556, 'В ожидании', 'PENDING'),
(11255, 'Работает', 'WORK'),
(11258, 'Заблокирован', 'BLOCKED'),
(30005, 'Арестован', 'ARREST'),
(32565, 'Закрыт', 'CLOSED');
CREATE table clients (
clientID int not null,
clientType VARCHAR(5),
clientName VARCHAR(50)
);
insert into clients (clientID, clientType, clientName)
values (155, 'PRIV', 'Иванов Иван Иваныч'),
(225, 'PRIV', 'Иванов Петр Сидорович'),
(226, 'ORG', 'ООО "Иванов"'),
(358, 'PRIV', 'Петров Иван Иваныч'),
(598, 'ORG', 'ИП Сидоров И.П.'),
(973, 'PRIV', 'Сидоров Иван Петрович');

Написать запрос, выводящий количество работающих счетов(депозитов) с остатком более 0 по каждому клиенту(вывести колонки: ФИО_клиента, Рубли, Доллары, Евро) 
select clientname as ФИО_клиента, (select count(currency) from deposits where currency='RUB' and saldo>0
and statusid in (select statusid from status where statusname='Работает')) Рубли,
(select count(currency) from deposits where currency='USD' and saldo>0
and statusid in (select statusid from status where statusname='Работает')) Доллары,
(select count(currency) from deposits where currency='EUR'and saldo>0
and statusid in (select statusid from status where statusname='Работает')) Евро
FROM clients cl
right join deposits d on cl.clientID=d.clientID
RIGHT join status s on d.statusid=s.statusid
group by clientname; 