create database HotelDB;
create schema hotel;
CREATE TABLE hotel.RoomTypes
(
   room_type_id SERIAL PRIMARY KEY,
    type_name VARCHAR(50) NOT NULL UNIQUE,
   price_per_night NUMERIC(10,2) CHECK (price_per_night > 0),
   max_capacity INT CHECK (max_capacity > 0)
);
CREATE TABLE hotel.Rooms
(
    room_id SERIAL PRIMARY KEY,
    room_number VARCHAR(10) NOT NULL UNIQUE,
    room_type_id INT references hotel.RoomTypes(room_type_id),
    status VARCHAR(20) CHECK (status IN ('Available','Occupied','Maintenance'))
);

CREATE TABLE hotel.Customers
(
    customer_id serial primary key,
    full_name varchar(100) NOT NULL,
    email varchar(100) NOT NULL unique,
    phone VARCHAR(15) NOT NULL
);

CREATE TABLE  hotel.Bookings
(
    booking_id serial primary key,
    customer_id int references hotel.Customers(customer_id),
    room_id int references  hotel.Rooms(room_id),
    check_in DATE NOT NULL,
    check_out DATE NOT NULL,
    status VARCHAR(20) CHECK (status IN ('Pending','Confirmed','Cancelled'))
);
CREATE TABLE  hotel.Payments
(
    payment_id serial primary key,
    booking_id int references  hotel.Bookings(booking_id),
    amount NUMERIC(10,2) CHECK (amount >= 0),
    payment_date DATE NOT NULL,
    method VARCHAR(20) CHECK (method IN ('Credit Card','Cash','Bank Transfer'))
);
