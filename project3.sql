DROP TABLE PUBLISHER CASCADE CONSTRAINTS;
DROP TABLE LIBRARYITEM CASCADE CONSTRAINTS;
DROP TABLE BORROWER CASCADE CONSTRAINTS;
DROP TABLE RESERVES CASCADE CONSTRAINTS;
DROP TABLE magazine CASCADE constraints;
DROP TABLE book CASCADE constraints;
DROP TABLE journal CASCADE constraints;
DROP TABLE conference_preceding CASCADE constraints;
DROP TABLE edits CASCADE constraints;
DROP TABLE authors CASCADE constraints;

CREATE TABLE PUBLISHER(
    PID NUMBER(3) PRIMARY KEY,
    PUBLISHER_NAME VARCHAR2(20) NOT NULL,
    URL_ VARCHAR2(100)
);

CREATE TABLE BORROWER(
    BID NUMBER (3) PRIMARY KEY,
    BORROWER_NAME VARCHAR2 (20),
    BORROW_DURATION NUMBER (3),
    BORROWER_TYPE VARCHAR2 (10),
    ADDRESS VARCHAR2 (100)
);

CREATE TABLE LIBRARYITEM(
    IDNUMBER NUMBER(3) PRIMARY KEY,
    TITLE VARCHAR2(20),
    PID NUMBER(3),
    BID NUMBER(3),
    RETURNDATE DATE,
    CHECKDATE DATE,
    FOREIGN KEY (PID) REFERENCES PUBLISHER(PID),
    FOREIGN KEY (BID) REFERENCES BORROWER(BID)
);
CREATE TABLE RESERVES(
    BID NUMBER(3),
    IDNUMBER NUMBER(3),
    ORDER_NUM VARCHAR2(100),
    FOREIGN KEY (BID) REFERENCES BORROWER(BID),
    FOREIGN KEY (IDNUMBER) REFERENCES LIBRARYITEM(IDNUMBER),
    UNIQUE (BID, IDNUMBER)
);

CREATE TABLE magazine (
    midn NUMBER(2) PRIMARY KEY,
    publication_date DATE,
    magazine_type VARCHAR(20)
);

CREATE TABLE book (
    bidn NUMBER(2) PRIMARY KEY
);

CREATE TABLE journal (
    jidn NUMBER(2) PRIMARY KEY,
    vol NUMBER(2),
    numbr NUMBER(2)
);

CREATE TABLE conference_preceding (
    cidn NUMBER(2) PRIMARY KEY,
    conference_date DATE,
    location VARCHAR(20)
);

CREATE TABLE edits (
    cidn NUMBER(2) PRIMARY KEY,
    author_name VARCHAR(30)
);

CREATE TABLE authors (
    bidn NUMBER(2) PRIMARY KEY,
    author_name VARCHAR(20)
);

INSERT INTO PUBLISHER
VALUES(1, 'publisher1', 'www.pub1.com');

INSERT INTO PUBLISHER
VALUES(2, 'publisher2', 'www.pub2.com');

INSERT INTO PUBLISHER
VALUES(3, 'publisher3', 'www.pub3.com');

 INSERT INTO BORROWER
VALUES(1, 'Megan', 1, 'Student', '710 Kingsley St. Normal, IL 61761');

INSERT INTO BORROWER
VALUES(2, 'Minglu', 2, 'Student', '123 S. Fell St. Normal, IL 61761');

INSERT INTO BORROWER
VALUES(3, 'Will', 3, 'Faculty', '543 S. School St. Normal, IL 61761');

INSERT INTO LIBRARYITEM
VALUES(1, 'SCI', 1, 1, DATE '2021-3-1', DATE '2021-2-1');

INSERT INTO LIBRARYITEM
VALUES(2, 'SCIENCE', 2, 2, DATE '2021-3-2', DATE '2021-2-2');

INSERT INTO LIBRARYITEM
VALUES(3, 'IEEE', 3, 3, DATE '2021-3-3', DATE '2021-2-3');

INSERT INTO RESERVES
VALUES(1, 1, 'Will, Megan');

INSERT INTO RESERVES
VALUES(2, 2, 'Minglu, Will');

INSERT INTO RESERVES
VALUES(3, 3, 'Will, Megan, Minglu');

INSERT INTO magazine VALUES (1, DATE '2021-03-01', 'SCI');
INSERT INTO magazine VALUES (2, DATE '2021-03-01', 'SCI');
INSERT INTO magazine VALUES (3, DATE '2021-03-01', 'SCI');
INSERT INTO book VALUES (1);
INSERT INTO book VALUES (2);
INSERT INTO book VALUES (3);
INSERT INTO journal VALUES (1, 1, 1);
INSERT INTO journal VALUES (2, 3, 3);
INSERT INTO journal VALUES (3, 8, 4);
INSERT INTO conference_preceding VALUES (1, DATE '2021-03-01', 'UTAH');
INSERT INTO conference_preceding VALUES (2, DATE '2021-04-01', 'UTAH');
INSERT INTO conference_preceding VALUES (3, DATE '2021-01-01', 'UTAH');
INSERT INTO edits VALUES (1, 'Will');
INSERT INTO edits VALUES (2, 'Minglu');
INSERT INTO edits VALUES (3, 'Megan');
INSERT INTO authors VALUES (1, 'Will');
INSERT INTO authors VALUES (2, 'Minglu');
INSERT INTO authors VALUES (3, 'Megan');

SELECT *
FROM BORROWER;

SELECT *
FROM RESERVES;

SELECT * FROM magazine;
SELECT * FROM book;
SELECT * FROM journal;
SELECT * FROM conference_preceding;
SELECT * FROM edits;
SELECT * FROM authors;

-- vvvv BROKEN vvvv
--SELECT B.BID, BORROWER_NAME, BORROW_DURATION, ADDRESS, BORROWER_TYPE 
--FROM BORROWER B JOIN LIBRARYITEM L ON B.BID=L.BID 
--WHERE COUNT(L.BID) = 1 
--GROUP BY B.BID 
--ORDER BY B.BID; 

--SELECT BORROWER_NAME, ADDRESS 
--FROM BORROWER B JOIN LIBRARYITEM L ON B.BID=L.BID 
--WHERE L.TITLE='Database Processing'
--GROUP BY B.BID 
--ORDER BY B.BID; 

-- ^^^^^^^^^^^^^^^^

SELECT URL_, PUBLISHER_NAME 
FROM PUBLISHER P JOIN LIBRARYITEM L ON P.PID=L.PID 
WHERE L.TITLE='COMPUPTER'; 
