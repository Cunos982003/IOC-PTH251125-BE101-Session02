create table librarydb;
create schema library;
set search_path to library;
Create table Books(
    book_id bigserial primary key,
    title varchar(100) NOT NULL ,
    author varchar(50) NOT NULL ,
    published_year int,
    price NUMERIC(10,2)
)

SELECT datname FROM pg_database;

SELECT schema_name
FROM information_schema.schemata;

SELECT column_name, data_type, is_nullable
FROM information_schema.columns
WHERE table_name = 'books';