alter session set nls_date_format='DD/MM/YYYY';

rem 1

DROP TABLE Students;

CREATE TABLE Students

(

Id NUMBER(6),

LastName VARCHAR2(20),

FirstName VARCHAR2(10),

Address VARCHAR2(10),

BirthDay DATE,

GroupId NUMBER(3)

);

rem 2

INSERT INTO Students VALUES (101, 'Solin', 'Dan', 'BeerSheva ', '01/02/1985', 11);

rem 3

ALTER TABLE Students ADD AvgMark NUMBER(5,2) DEFAULT 0;

rem 4

INSERT INTO  Students VALUES (102, 'Tal' ,'Ruti', 'Tel-Aviv', '10/07/1988', 12,  70 );

INSERT INTO  Students VALUES (103, 'Kohen', 'Yosi' , 'Dimona' , '01/08/1987', 11, 80);

INSERT INTO  Students VALUES (104, 'Toys' , 'Vered', 'Tel-Aviv', '15/09/1988', 12, 90);

rem 5

ALTER TABLE Students MODIFY Address VARCHAR2(15);

rem 6

DROP TABLE Students2;

CREATE TABLE Students2

AS SELECT *

FROM Students;

rem 7

DELETE FROM Students 

WHERE birthday = '10/07/1988'; 

rem 8

UPDATE Students2

SET GroupId =10

WHERE GroupId = 11;

rem 9

RENAME Students2 TO Students_new;

rem 10
DROP TABLE Students_new;

