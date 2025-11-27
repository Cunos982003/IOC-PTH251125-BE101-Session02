create database SaleDB;
create schema sale;
set search_path to sale;
Create table sale.Customers
(
    customer_id serial primary key,
    first_name  varchar(50) NOT NULL,
    last_name   varchar(50) NOT NULL,
    email       varchar(30) NOT NULL UNIQUE,
    phone       char(10)
);

Create table sale.Products
(
    product_id     serial primary key,
    product_name   varchar(100)   NOT NULL,
    price          NUMERIC(10, 2) NOT NULL,
    stock_quantity int            NOT NULL
);

Create table sale.Orders
(
    order_id    serial primary key,
    customer_id int references sale.Customers(customer_id),
    order_date date
);

Create table sale.OrderItem
(
    order_item_id    serial primary key,
    order_id int references sale.Orders(order_id),
    product_id int references sale.Products(product_id),
    quantity int check ( quantity >= 1 )
);