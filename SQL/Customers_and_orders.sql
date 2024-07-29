create table Customers (
CustomerID char(5) primary key, CompanyName varchar(100), Address varchar(100), City varchar(30), Country varchar(20));
insert into customers (customerid, companyname, address, city, country)
VALUES ('ALFKI', 'Alfreds Futterkiste', 'Obere Str. 57', 'Berlin', 'Germany'),
('ANATR', 'Ana Trujillo Emparedados y helados', 'Avda. de la Constitución 2222', 'México D.F.', 'Mexico'),
('ANTON', 'Antonio Moreno Taquería', 'Mataderos  2312', 'México D.F.', 'Mexico'),
('AROUT', 'Around the Horn', '120 Hanover Sq.', 'London', 'UK'),
('BERGS', 'Berglunds snabbköp', 'Berguvsvägen  8', 'Luleå', 'Sweden'),
('BLAUS', 'Blauer See Delikatessen', 'Forsterstr. 57', 'MannheimCity', 'Germany'),
('BLONP', 'Blondesddsl père et fils', '24, place Kléber', 'StrasbourgCity', 'France'),
('BOLID', 'Bólido Comidas preparadas', 'C/ Araquil, 67', 'MadridCity', 'Spain');
create table orders (orderID int, customerid char(5) references customers(customerid), orderDate DATE, orderSum INT);
INSERT into orders (orderID, customerid, orderDate, orderSum)
VALUES (10355, 'AROUT', '1996-11-15', 10000),
(10365, 'ANTON', '1996-11-27', 15000),
(10436, 'BLONP', '1997-02-05', 17500),
(10449, 'BLONP', '1997-02-18', 10000),
(10453, 'AROUT', '1997-02-21', 15000); 


Вывести названия всех компаний, которые не выполнили заказ с 15.11.1996 – 18.02.1997
select companyname from customers where customerid in (select customerid from orders where orderdate not between
'1996-11-15' and '1997-02-18'); 

Вывести названия компаний поставщиков, которые находятся в México D.F.;
SELECT companyname from customers where city='México D.F.';

Вывести только те заказы, которые были оформлены с 12.12.1996 по 18.02.1997;
select orderid from orders where orderdate between '1996-12-12' and '1997-02-18';

Вывести только тех заказчиков,  название компании которых начинаются с ‘An’;
select companyname from customers where companyname like 'An%';

Вывести названия компаний и заказы, которые они оформили, с суммой заказа более 17000.
select companyname, orderid from customers cu join orders o on cu.customerid=o.customerid where ordersum>17000;

Вывести следующие колонки: имя поставщика, сумма заказа. Результаты отсортировать по поставщикам в порядке убывания
SELECT companyname, ordersum from customers cu join orders o on cu.customerid=o.customerid order by companyname desc;

Вывести следующие колонки: имя поставщика, дата заказа. Вывести  таким образом, чтобы все заказчики из таблицы 1 были показаны в таблице результатов.
select companyname, orderdate from customers cu left join orders o on cu.customerid=o.customerid;