CREATE TABLE Product
(
Maker Varchar2(1),
Model NUMBER(4) PRIMARY KEY,
Type VARCHAR2(7)
);
CREATE TABLE Pc
(
Model NUMBER(4) PRIMARY KEY,
Speed NUMBER(4),
Ram NUMBER(3),
Hd NUMBER(2),
Price NUMBER(4)
);
CREATE TABLE Laptop
(
Model NUMBER(4) PRIMARY KEY,
Speed NUMBER(3),
Ram NUMBER(3),
Hd NUMBER(2),
Screen NUMBER(3,1),
Price NUMBER(4)
);
CREATE TABLE Printer
(
Model NUMBER(4) PRIMARY KEY,
Color Varchar2(5),
Type VARCHAR2(7),
Price NUMBER(4)
);
CREATE TABLE Dept
(
deptno NUMBER(2),
dname VARCHAR2(12),
Loc VARCHAR2(10)
);
