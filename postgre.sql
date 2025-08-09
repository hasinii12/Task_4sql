DROP TABLE IF EXISTS books;
CREATE TABLE books 
(
    book_id             INT PRIMARY KEY,
    title               TEXT NOT NULL,
    author              TEXT NOT NULL,
    genre               TEXT NOT NULL,
    price               NUMERIC(8,2) NOT NULL,
    pages               INT NOT NULL,
    publication_year    INT NOT NULL CHECK (publication_year BETWEEN 1800 AND 2100),
    rating              NUMERIC(2,1),
    stock               INT NOT NULL,
    language            TEXT NOT NULL,
    format              TEXT NOT NULL CHECK (format IN ('Hardcover','Paperback','eBook')),
    publisher           TEXT,
    isbn                VARCHAR(13) UNIQUE,
    added_date          DATE NOT NULL
);
-- A. SELECT, FROM, WHERE, ORDER, LIMIT
--Select all columns for all books.
--Show only title , author , and 
--Find books priced over 40.
--Get books with price stock =0 (out of stock).
--Return the 10 most expensive books (title + price).
--Get the 5 oldest books by publication_year .
--Find books with rating as NULL (not rated yet).
--Find books with publisher not NULL
Select * from books;
Select title,author,price from books;
select title from books where price > 40;
select title from books where stock = 0;
select title,price from books order by price Desc limit 10;
select title,publication_year from books order by publication_year ASC limit 5;
select title from books where rating is null;
select title,publisher from books where publisher is not null;