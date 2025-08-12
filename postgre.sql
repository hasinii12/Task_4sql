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
--Compute the total value of the current stock, based on price and quantity available.
select sum(price*stock) as total_value from books

--Categorize books into price bands such as “Budgetˮ, “Standardˮ, or “Premiumˮ based on pricing rules

Select title, price,
case when price < 20 then 'Budget'
when price between 20 and 50 then 'Standard'
else'Premium'
end as category
from books

--Classify books as “Out of Stockˮ, “Low Stockˮ, or “In Stockˮ based on available quantity
select distinct publication_year from books
Select title, stock,
case when stock = 0 then 'Out of Stock'
when stock <67 then 'Low Stock'
else 'In Stock'
end as books_available
from books

--Group books into “Classicˮ, “Oldˮ, “Recentˮ, or “Newˮ categories depending on publication year
--first knowing years present
select distinct publication_year from books

select title,publication_year,
case when publication_year between 1900 and 1970 then 'Classic'
when publication_year between 1971 and 1990 then 'old'
when publication_year between 1991 and 2020 then 'Recent'
else 'New'
end as group_books
from books
