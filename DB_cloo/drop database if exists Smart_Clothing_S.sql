drop database if exists Smart_Clothing_Store_System;

create database Smart_Clothing_Store_System;
USE Smart_Clothing_Store_System;

create table customer(
id char(5) primary key,
c_name varchar(20) not null,
phone char(10) ,
city varchar(10),
street varchar(20),
state varchar(6),
created_at date
);


create table employee(
id char(4) primary key,
first_name varchar(10),
last_name varchar(10),
phone char(10),
email varchar(40),
TheRole varchar(10),
Id_number char(9),
hire_date  date,
salary decimal(10,2),
working_hours  int
);


create table UserAccount(
id char(4) primary key,
employee_id char(4),
 foreign key (employee_id) references employee(id),
 username varchar(10),
 password char(10));
 
 create  table categorie(
 id char(4)primary key,
 c_name varchar(20)
 );

create table product(
id char(4) primary key,
p_name varchar(20),
brand varchar(10),
gender varchar(5),
categorie_id char(4),
foreign key(categorie_id) references categorie(id),
description varchar(30),
p_type varchar(10)

);
--------------------------
create table  supplier(
id char(6) primary key,
name varchar(20),
phone char(10),
email varchar(40),
address varchar(100),
created_at date
);
-- -------------bay bill
create table purchaseinvoice(
id char(5) primary key,
supplier_id char(6),
foreign key(supplier_id) references supplier(id),
get_date date,
employee_id char(4),
foreign key (employee_id) references employee(id),
total_amount  decimal(10,2)
);
create table purchaseItem(
purchaselnvoice_id char(5),
foreign key (purchaselnvoice_id) references purchaseinvoice(id),
product_id char(4),
foreign key (product_id) references product(id),
quntity int,
unit_price int,
total_price int,
primary key (purchaselnvoice_id, product_id)
);
create table purchaseVariant(
id char(5) primary key,
color varchar(10),
quntity int,
product_id char(4),
foreign key(product_id) references product(id),
barcode char(20),
size varchar(4),
cost_price int,
selling_price int,
min_stok_level int

);
create table salesInvoice(
id char(4) primary key, 
date_s date,
customer_id char(5),
 foreign key(customer_id) references  customer(id),
 employee_id char(4),
 foreign key (employee_id) references employee(id),
 discount decimal(5,2),
 totalamount decimal(10,2),
 payment_method varchar(20)
);
create table salesltem(
salesInvoice_id char(4),
foreign key(salesInvoice_id) references salesInvoice(id),
purchaseVariant_id char(4),
foreign key (purchaseVariant_id) references purchaseVariant(id),
quntity int,
unit_price int,
total_price int,
primary key (salesInvoice_id, purchaseVariant_id) 
);

