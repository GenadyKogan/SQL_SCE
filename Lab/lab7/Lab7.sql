DROP TABLE Author;
DROP TABLE Publ;
DROP TABLE Books;
DROP TABLE AuBook;
rem #a,b
CREATE TABLE Author(
    AuId varchar(9) PRIMARY KEY,  
    AuthName VARCHAR2(20) NOT NULL,
    born DATE,
    died DATE,
    CONSTRAINT boen_check CHECK(born<=died)
);
/*CREATE TABLE Books(
    ISBN VARCHAR2(20),
    title VARCHAR2(20) UNIQUE,
    pages NUMBER (3,0) CONSTRAINT check_pages CHECK(pages >0),
    pubid VARCHAR2(20),
    price NUMBER (6,3) CONSTRAINT check_price CHECK(price>0),
    CONSTRAINT primary_key PRIMARY KEY(ISBN),
    CONSTRAINT foreign_key FOREIGN KEY(pubid) REFERENCES publ(pubid)
);*/
CREATE TABLE Publ(
    pubid VARCHAR2(20),
    pubname VARCHAR2(20) UNIQUE,
    address VARCHAR(50) DEFAULT 'unknown',
    CONSTRAINT primary_key_Publ PRIMARY KEY(pubid)
);
CREATE TABLE Books(
    ISBN VARCHAR2(20) PRIMARY KEY,
    title VARCHAR2(20) UNIQUE,
    pages NUMBER (3,0) CONSTRAINT check_pages CHECK(pages >0),
    pubid VARCHAR2(20),
    price NUMBER (6,3) CONSTRAINT check_price CHECK(price>0),
    CONSTRAINT foreign_key FOREIGN KEY(pubid) REFERENCES publ(pubid)
);

CREATE TABLE AuBook(
    Auid VARCHAR(9),
    ISBN VARCHAR(20),
    CONSTRAINT primary_key_AuBook PRIMARY KEY(Auid),
    CONSTRAINT foreign_key_AuBook FOREIGN KEY(ISBN) REFERENCES Books(ISBN)
);
rem 2
ALTER TABLE product ADD CONSTRAIN type_check CHECK (TYPE IN('pc','laptop','printer'));
rem 3
ALTER TABLE PC ADD CONSTRAINT priec_check CHECK(speed >= 1200 or(speed < 1200 and price<=1500));
rem 4
ALTER TABLE laptop ADD CONSTRAINT screen_check CHECK ((screen >= 15 or (size<15 and (hd>=20 or price<2000))));
