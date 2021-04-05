DROP TABLE magazine CASCADE constraints;
DROP TABLE book CASCADE constraints;
DROP TABLE journal CASCADE constraints;
DROP TABLE conference_preceding CASCADE constraints;
DROP TABLE edits CASCADE constraints;
DROP TABLE authors CASCADE constraints;

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
