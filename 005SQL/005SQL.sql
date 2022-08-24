DROP DATABASE MyJoinsDB;
CREATE DATABASE MyJoinsDB;
USE MyJoinsDB;

DROP TABLE Phone_Names;
DROP TABLE Salery_Position;
DROP TABLE Femily_Born_LivePlase;


-- Задание 3 

-- В данной базе данных создайте 3 таблицы, 
-- В 1-й таблице содержатся имена и номера телефонов сотрудников компании. 
-- Во 2-й таблице содержатся ведомости о зарплате и должностях сотрудников: главный директор, менеджер, рабочий. 
-- В 3-й таблице содержится информация о семейном положении, дате рождения, и месте проживания.


CREATE TABLE Phone_Names(

id INT NOT NULL,
Phone VARCHAR(20),
NamesWorker VARCHAR(40),

PRIMARY KEY(id)

);

INSERT INTO Phone_Names
(id, Phone, NamesWorker)
VALUES
(1, '380996667788', 'Квентин Тарантино'),
(2, '380634445566', 'Гай Ричи'),
(3, '380738881122', 'Роберт Родригес');



CREATE TABLE Salery_Position(

id INT NOT NULL,
Salery DOUBLE NOT NULL,
PositionWorker VARCHAR(20),

PRIMARY KEY (id)

);
INSERT INTO Salery_Position
(id, Salery, PositionWorker)
VALUES
(1, 5359.89,'главный директор'),
(2, 33121.99,'менеджер'),
(3, 59000.75,'рабочий');



CREATE TABLE Femily_Born_LivePlase(

id INT NOT NULL,
BornDate VARCHAR(10),
Family VARCHAR(30),
LivePlace VARCHAR(70),

PRIMARY KEY (id)

);

INSERT INTO Family_Born_LivePlase
(id, BornDate, Family, LivePlace)
VALUES
(1, '26/03/1963','одружений', 'Ноксвілл, Теннессі, США'),
(2, '10/09/1968','не одружений','Хатфілд, Велика Британія'),
(3, '20/06/1968','одружений','Сан-Антоніо, Техас, США');



SELECT * FROM MyJoinsDB.Phone_Names;
SELECT * FROM MyJoinsDB.Salery_Position;
SELECT * FROM MyJoinsDB.Family_Born_LivePlase;

-- ----------------------------------------------------------------------------------------------------------------------


-- Задание 4 

-- Сделайте выборку при помощи вложенных запросов для таких заданий: 

-- 1) Получите контактные данные сотрудников (номера телефонов, место жительства). 

select Phone , LivePlace 
from Phone_Names, Femily_Born_LivePlase
where Femily_Born_LivePlase.id = Phone_Names.id;


-- 2) Получите информацию о дате рождения всех холостых сотрудников и их номера. 

select BornDate, Family, Phone
from Phone_Names, Family_Born_LivePlase
where Family_Born_LivePlase.id = Phone_Names.id and Family = 'не одружений';



-- 3) Получите информацию обо всех менеджерах компании: дату рождения и номер телефона. 
select PositionWorker , BornDate , Phone
from Salery_Position,Phone_Names,Family_Born_LivePlase
where Salery_Position.id = Phone_Names.id = Family_Born_LivePlase.id and PositionWorker = 'менеджер';


