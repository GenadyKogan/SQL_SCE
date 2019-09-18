DROP TABLE Dept;

CREATE TABLE Dept
(
deptno NUMBER(2),
dname VARCHAR2(12),
Loc VARCHAR2(10)
);

INSERT INTO Dept
VALUES(10,'ACCOUNTING','NEW YORK');
INSERT INTO Dept
VALUES(20,'RESEARCH','DALLAS');
INSERT INTO Dept
VALUES(30,'SALES','CHICAGO');
INSERT INTO Dept
VALUES(40,'OPERATIONS','BOSTON');
rem 1
SELECT model,speed,hd
FROM pc
WHERE price>1600 AND (hd = 10 OR hd = 20);
rem 2
SELECT model,speed megahertz,hd gigabytes
FROM pc
WHERE price>1600;
rem 3
SELECT DISTINCT  maker
FROM product p,pc
WHERE p.model = pc.model
ORDER BY maker;
rem 4
SELECT model,ram,screen
FROM laptop l
WHERE l.price > 2000 AND (screen >= 14 OR ram >= 64);
rem 5
SELECT maker,speed
FROM product p,laptop l
WHERE l.hd >= 1 AND p.model = l.model;
rem 6
SELECT p1.model
FROM pc p1,pc p2
WHERE p1.speed > p2.speed AND p2.model = 1001;
rem 7
SELECT p.model,price
FROM product p,pc
WHERE p.model = pc.model AND p.maker = 'A'
UNION
SELECT p.model,price
FROM product p,laptop l
WHERE p.model = l.model AND p.maker = 'A'
UNION
SELECT p.model,price
FROM product p,printer p2
WHERE p.model = p2.model AND p.maker = 'A';
rem 8
SELECT model,speed,price
FROM pc
WHERE price > 2000 AND speed > 100 
UNION
SELECT model,speed,price
FROM laptop
WHERE price > 2000 AND speed > 100;
rem 9
SELECT maker
FROM product p,pc
WHERE pc.price > 2000 AND pc.speed > 100 AND pc.model = p.model
INTERSECT
SELECT maker
FROM product p,laptop l
WHERE l.price > 2000 AND l.speed > 100 AND l.model = p.model;
rem 10
DROP TABLE  copy_dept;
CREATE TABLE copy_dept AS SELECT * FROM dept;
INSERT INTO copy_dept VALUES(50,'CHEKING','BOSTON');

SELECT dname,ename,sal
FROM emp e,copy_dept d
WHERE d.deptno = e.deptno(+) AND d.loc IN ('BOSTON','CHICAGO');
rem 11
SELECT maker
FROM product p,laptop l
WHERE p.model = l.model
MINUS
SELECT maker
FROM product p,pc
WHERE p.model = pc.model;
rem 12
SELECT hd, COUNT(hd) count
FROM pc
GROUP BY hd
HAVING COUNT(hd) > 1;
rem 13
SELECT DISTINCT p1.model
FROM pc p1,pc p2
WHERE p1.speed = p2.speed AND p1.ram = p2.ram
GROUP BY p1.model
HAVING COUNT(p1.model) > 1;