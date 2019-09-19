rem -- using product table from Lab2
DROP TABLE Product;
CREATE TABLE Product
(
Maker Varchar2(1),
Model NUMBER(4) PRIMARY KEY,
Type VARCHAR2(7)
);
INSERT INTO Product VALUES('A',1001,'PC');
INSERT INTO Product VALUES('A',1002,'PC');
INSERT INTO Product VALUES('A',1003,'PC');
INSERT INTO Product VALUES('A',2004,'LAPTOP');
INSERT INTO Product VALUES('A',2005,'LAPTOP');
INSERT INTO Product VALUES('A',2006,'LAPTOP');
INSERT INTO Product VALUES('B',1004,'PC');
INSERT INTO Product VALUES('B',1005,'PC');
INSERT INTO Product VALUES('B',1006,'PC');
INSERT INTO Product VALUES('B',2001,'LAPTOP');
INSERT INTO Product VALUES('B',2002,'LAPTOP');
INSERT INTO Product VALUES('B',2003,'LAPTOP');
INSERT INTO Product VALUES('C',1007,'PC');
INSERT INTO Product VALUES('C',1008,'PC');
INSERT INTO Product VALUES('C',2008,'LAPTOP');
INSERT INTO Product VALUES('C',2009,'LAPTOP');
INSERT INTO Product VALUES('C',3002,'PRINTER');
INSERT INTO Product VALUES('C',3003,'PRINTER');
INSERT INTO Product VALUES('C',3006,'PRINTER');
INSERT INTO Product VALUES('D',1009,'PC');
INSERT INTO Product VALUES('D',1010,'PC');
INSERT INTO Product VALUES('D',1011,'PC');
INSERT INTO Product VALUES('D',2007,'LAPTOP');
INSERT INTO Product VALUES('E',1012,'PC');
INSERT INTO Product VALUES('E',1013,'PC');
INSERT INTO Product VALUES('E',2010,'LAPTOP');
INSERT INTO Product VALUES('F',3001,'PRINTER');
INSERT INTO Product VALUES('F',3004,'PRINTER');
INSERT INTO Product VALUES('G',3005,'PRINTER');
INSERT INTO Product VALUES('H',3007,'PRINTER');
rem a
SELECT AVG(speed)
FROM pc;
rem b
SELECT AVG(speed)
FROM laptop;
rem c
SELECT AVG(price)
FROM pc
WHERE  model in (SELECT model FROM product WHERE maker like 'A');
rem d
SELECT AVG(price)
FROM(
SELECT price
FROM PC
WHERE Model in (SELECT model
                FROM product
                WHERE MAKER LIKE 'D')
UNION
SELECT price
FROM LAPTOP
WHERE Model in (SELECT model
                FROM product
                WHERE MAKER LIKE 'D'));
rem e
SELECT speed, AVG(price)
FROM pc
GROUP BY speed;
rem f
SELECT maker, AVG(screen)
FROM product,laptop
WHERE product.model = laptop.model
GROUP BY maker;
rem g
SElECT maker
FROM product
WHERE model IN (SELECT model
                FROM pc)
GROUP BY maker
HAVING COUNT(model)>=3;
rem h
SELECT pr.maker, MAX(p.price)
FROM product pr, pc p
WHERE pr.model = p.model
GROUP BY maker;
rem i
SELECT speed,AVG(price)
FROM pc
WHERE speed<900
GROUP BY speed;
rem j
SELECT P.maker, AVG(HD)
FROM Pc C,Product P
WHERE C.Model=P.Model AND P.maker IN (SELECT maker
                                             FROM Product
                                             WHERE Type LIKE 'PRINTER')
GROUP BY p.maker;