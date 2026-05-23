DROP DATABASE IF EXISTS Smart_Clothing_Store_System;
CREATE DATABASE Smart_Clothing_Store_System;
USE Smart_Clothing_Store_System;
 
-- =====================================================
-- TABLES
-- =====================================================
 
CREATE TABLE customer(
  id int PRIMARY KEY AUTO_INCREMENT,
  c_name varchar(20) NOT NULL,
  phone char(10),
  city varchar(10),
  street varchar(20),
  state varchar(6),
  created_at date
);
 
CREATE TABLE employee(
  id int PRIMARY KEY AUTO_INCREMENT,
  first_name varchar(10),
  last_name varchar(10),
  phone char(10),
  email varchar(40),
  TheRole varchar(10),
  Id_number char(9),
  hire_date date,
  salary decimal(10,2),
  working_hours int
);
 
CREATE TABLE UserAccount(
  id int PRIMARY KEY AUTO_INCREMENT,
  employee_id int,
  FOREIGN KEY (employee_id) REFERENCES employee(id),
  username varchar(10),
  password char(10)
);
 
CREATE TABLE categorie(
  id int PRIMARY KEY AUTO_INCREMENT,
  c_name varchar(20)
);
 
CREATE TABLE product(
  id int PRIMARY KEY  AUTO_INCREMENT,
  p_name varchar(20),
  brand varchar(10),
  gender varchar(5),
  categorie_id int,
  FOREIGN KEY(categorie_id) REFERENCES categorie(id),
  description varchar(30)
 
);
 
CREATE TABLE supplier(
  id int PRIMARY KEY AUTO_INCREMENT,
  name varchar(20),
  phone char(10),
  email varchar(40),
  address varchar(100),
  created_at date
);
 
CREATE TABLE purchaseinvoice(
  id int PRIMARY KEY AUTO_INCREMENT,
  supplier_id int,
  FOREIGN KEY(supplier_id) REFERENCES supplier(id),
  get_date date,
  employee_id int,
  FOREIGN KEY(employee_id) REFERENCES employee(id),
  total_amount decimal(10,2)
);
 
CREATE TABLE purchaseItem(
  purchaselnvoice_id int,
  FOREIGN KEY(purchaselnvoice_id) REFERENCES purchaseinvoice(id),
  product_id int,
  FOREIGN KEY(product_id) REFERENCES product(id),
  quntity int,
  unit_price decimal(10,2),
  total_price decimal(10,2),
  PRIMARY KEY(purchaselnvoice_id, product_id)
);
 
CREATE TABLE productVariant(
  id int PRIMARY KEY AUTO_INCREMENT,
  color varchar(10),
  quntity int,
  product_id int,
  FOREIGN KEY(product_id) REFERENCES product(id),
  barcode char(20),
  size varchar(4),
  cost_price decimal(10,2),
  selling_price decimal(10,2),
  min_stok_level int
);
 
CREATE TABLE salesInvoice(
  id int PRIMARY KEY AUTO_INCREMENT,
  date_s date,
  customer_id int,
  FOREIGN KEY(customer_id) REFERENCES customer(id),
  employee_id int,
  FOREIGN KEY(employee_id) REFERENCES employee(id),
  discount decimal(5,2),
  totalamount decimal(10,2),
  payment_method varchar(20)
);
 
CREATE TABLE salesltem(
  salesInvoice_id int ,
  FOREIGN KEY(salesInvoice_id) REFERENCES salesInvoice(id),
  productVariant_id int,
  FOREIGN KEY(productVariant_id) REFERENCES productVariant(id),
  quntity int,
  unit_price decimal(10,2),
  total_price decimal(10,2),
  PRIMARY KEY(salesInvoice_id, productVariant_id)
);
 
-- =====================================================
-- 1. CATEGORIES (10)
-- =====================================================
INSERT INTO categorie VALUES
(1,'Shirts'),
(2,'Pants'),
(3,'Jackets'),
(4,'Shoes'),
(5,'T-Shirts'),
(6,'Dresses'),
(7,'Sportswear'),
(8,'Kids Wear'),
(9,'Accessories'),
(10,'Underwear');
 
-- =====================================================
-- 2. EMPLOYEES (7)
-- =====================================================
INSERT INTO employee VALUES
(1,'Khaled','Mansour','0521000001','khaled.m@store.com','Manager', '123456781','2020-03-01',12000.00,190),
(2,'Rana',  'Haddad', '0522000002','rana.h@store.com',  'Cashier', '123456782','2021-06-15', 6500.00,168),
(3,'Tariq', 'Saleh',  '0523000003','tariq.s@store.com', 'Cashier', '123456783','2022-01-10', 6200.00,168),
(4,'Nour',  'Faraj',  '0524000004','nour.f@store.com',  'Seller',  '123456784','2022-04-20', 5800.00,160),
(5,'Sami',  'Issa',   '0525000005','sami.i@store.com',  'Seller',  '123456785','2022-09-01', 5600.00,160),
(6,'Lina',  'Khoury', '0526000006','lina.k@store.com',  'Seller',  '123456786','2023-02-14', 5500.00,160),
(7,'Omar',  'Zidan',  '0527000007','omar.z@store.com',  'Seller',  '123456787','2023-07-01', 5400.00,160);
 
-- =====================================================
-- 3. USER ACCOUNTS
-- =====================================================
INSERT INTO UserAccount VALUES
(1,1,'k.mansour','Km@2020!!'),
(2,2,'r.haddad', 'Rh@2021!!'),
(3,3,'t.saleh',  'Ts@2022!!');
 
-- =====================================================
-- 4. SUPPLIERS (3)
-- =====================================================
INSERT INTO supplier VALUES
(1,'NovaTex Ltd',    '0531100001','info@novatex.com',    'Industrial Zone, Haifa, IL',  '2020-01-15'),
(2,'UrbanFabrics Co','0532200002','sales@urbanfab.com',  'Trade St 5, TelAviv, IL',     '2020-06-01'),
(3,'KidsSoft Group', '0533300003','contact@kidssoft.com','Shalom Blvd 12, Jerusalem, IL','2021-03-20');
 
-- =====================================================
-- 5. CUSTOMERS (15)
-- =====================================================
INSERT INTO customer VALUES
(1, 'Ali Hassan',   '0541100001','Haifa',    'Herzl 14',    'Regula','2023-01-05'),
(2, 'Sara Nasser',  '0541200002','TelAviv',  'Dizengoff 30','VIP',   '2023-02-10'),
(3, 'Moha Khalil',  '0541300003','Jerusalem','Jaffa 8',     'Regula','2023-03-15'),
(4, 'Dina Saad',    '0541400004','Haifa',    'Carmel 22',   'VIP',   '2023-04-01'),
(5, 'Yusuf Zaki',   '0541500005','Eilat',    'Coral 5',     'Regula','2023-04-20'),
(6, 'Maya Amin',    '0541600006','Ashdod',   'Sea Rd 11',   'Regula','2023-05-03'),
(7, 'Karim Faris',  '0541700007','Nazareth', 'Market 7',    'Regula','2023-06-18'),
(8, 'Hiba Moussa',  '0541800008','Haifa',    'Pine 3',      'VIP',   '2023-07-22'),
(9, 'Ziad Hamdan',  '0541900009','TelAviv',  'Rothschild 9','Regula','2023-08-14'),
(10,'Nadia Slim',   '0542000010','BeerSheva','Negev 6',     'Regula','2023-09-05'),
(11,'Fares Abboud', '0542100011','Acre',     'Old Port 2',  'VIP',   '2023-10-11'),
(12,'Rima Yousef',  '0542200012','Haifa',    'Cedar 8',     'Regula','2023-11-01'),
(13,'Amir Rashid',  '0542300013','Jerusalem','King David 4','Regula','2024-01-09'),
(14,'Tala Nassar',  '0542400014','TelAviv',  'Weizmann 17', 'VIP',   '2024-02-14'),
(15,'Bassem Nour',  '0542500015','Ashkelon', 'Beach 20',    'Regula','2024-03-30');
 
-- =====================================================
-- 6. PRODUCTS (20)
-- =====================================================
INSERT INTO product VALUES
(1, 'Oxford Shirt','Zara','M', 1,'100% cotton slim fit'),
(2, 'Linen Shirt', 'H&M','M', 1,'Light summer linen'),
(3, 'Silk Blouse', 'Mango','F',1,'Chiffon silk blouse'),
(4, 'Slim Jeans',  'Levis','M',2,'Blue denim slim cut'),
(5, 'Chino Pants', 'Zara','M', 2,'Beige casual chinos'),
(6, 'Wide Leg Pants','H&M','F',2,'Loose wide leg fit'),
(7, 'Denim Jacket','Levis','M',3,'Classic blue denim'),
(8, 'Winter Coat', 'Mango','F',3,'Wool blend long coat'),
(9, 'Running Shoes','Nike','M',4,'Breathable mesh upper'),
(10,'Formal Shoes','Clarks','M',4,'Black leather lace-up'),
(11,'Sandals',     'Birkenst','F',4,'Cork footbed sandals'),
(12,'Basic Tee',   'Nike','M', 5,'Cotton crew neck tee'),
(13,'Graphic Tee', 'H&M','M',  5,'Printed graphic front'),
(14,'Midi Dress',  'Mango','F',6,'Floral print midi'),
(15,'Casual Dress','Zara','F', 6,'Solid color shift'),
(16,'Gym Leggings','Nike','F', 7,'High waist stretch'),
(17,'Track Shorts','Adidas','M',7,'Moisture-wicking'),
(18,'Kids Hoodie', 'H&M','M',  8,'Soft fleece hoodie'),
(19,'Kids Jeans',  'Zara','M', 8,'Elastic waist denim'),
(20,'Leather Belt','Zara','M', 9,'Brown genuine leather');
 
-- =====================================================
-- 7. PRODUCT VARIANTS
-- =====================================================
INSERT INTO productVariant VALUES
(1, 'White', 5, 1, 'BC-P001-WM','M', 80.00,160.00,5),
(2, 'Blue',  20, 1, 'BC-P001-BL','L', 80.00,160.00,5),
(3, 'Beige', 18, 2, 'BC-P002-BM','M', 65.00,130.00,5),
(4, 'White', 15, 2, 'BC-P002-WL','L', 65.00,130.00,5),
(5, 'Black', 5, 3, 'BC-P003-BM','M', 90.00,180.00,5),
(6, 'Ivory', 15, 3, 'BC-P003-IS','S', 90.00,180.00,5),
(7, 'Blue',  3, 4, 'BC-P004-B3','32',120.00,240.00,8),
(8, 'Black', 25, 4, 'BC-P004-B4','34',120.00,240.00,8),
(9, 'Khaki', 22, 5, 'BC-P005-KM','M', 95.00,190.00,5),
(10,'Navy',  18, 5, 'BC-P005-NL','L', 95.00,190.00,5),
(11,'Black', 20, 6, 'BC-P006-BM','M', 85.00,170.00,5),
(12,'Camel', 15, 6, 'BC-P006-CL','L', 85.00,170.00,5),
(13,'Blue',  15, 7, 'BC-P007-BM','M',130.00,260.00,4),
(14,'Black', 12, 7, 'BC-P007-BL','L',130.00,260.00,4),
(15,'Grey',  10, 8, 'BC-P008-GM','M',200.00,400.00,3),
(16,'Beige', 8,  8, 'BC-P008-BL','L',200.00,400.00,3),
(17,'Black', 20, 9, 'BC-P009-B4','42',110.00,220.00,5),
(18,'White', 18, 9, 'BC-P009-W4','43',110.00,220.00,5),
(19,'Black', 12,10, 'BC-P010-B4','42',140.00,280.00,4),
(20,'Brown', 10,10, 'BC-P010-R4','43',140.00,280.00,4),
(21,'Brown', 18,11, 'BC-P011-B3','38',70.00, 140.00,5),
(22,'Black', 15,11, 'BC-P011-K4','40',70.00, 140.00,5),
(23,'White', 40,12, 'BC-P012-WM','M', 40.00, 80.00,10),
(24,'Black', 35,12, 'BC-P012-BL','L', 40.00, 80.00,10),
(25,'Grey',  30,13, 'BC-P013-GM','M', 45.00, 90.00,8),
(26,'White', 28,13, 'BC-P013-WL','L', 45.00, 90.00,8),
(27,'Floral',18,14, 'BC-P014-FS','S',110.00,220.00,4),
(28,'Floral',15,14, 'BC-P014-FM','M',110.00,220.00,4),
(29,'Red',   12,15, 'BC-P015-RS','S', 95.00,190.00,4),
(30,'Navy',  14,15, 'BC-P015-NM','M', 95.00,190.00,4),
(31,'Black', 25,16, 'BC-P016-BS','S', 75.00,150.00,6),
(32,'Grey',  20,16, 'BC-P016-GM','M', 75.00,150.00,6),
(33,'Black', 22,17, 'BC-P017-BM','M', 55.00,110.00,6),
(34,'Navy',  18,17, 'BC-P017-NL','L', 55.00,110.00,6),
(35,'Red',   20,18, 'BC-P018-RS','S', 60.00,120.00,5),
(36,'Blue',  18,18, 'BC-P018-BM','M', 60.00,120.00,5),
(37,'Blue',  22,19, 'BC-P019-BS','S', 70.00,140.00,5),
(38,'Black', 18,19, 'BC-P019-KM','M', 70.00,140.00,5),
(39,'Brown', 30,20, 'BC-P020-BO','One',45.00,90.00, 8),
(40,'Black', 25,20, 'BC-P020-KO','One',45.00,90.00, 8);
 
-- =====================================================
-- 8. PURCHASE INVOICES
-- =====================================================
INSERT INTO purchaseinvoice VALUES
(1,1,'2023-01-20',1,4200.00),
(2,2,'2023-04-10',1,3800.00),
(3,1,'2023-07-15',1,5100.00),
(4,3,'2023-09-05',1,2200.00),
(5,2,'2024-01-18',1,4600.00),
(6,1,'2024-04-22',1,5500.00);
 
-- =====================================================
-- 9. PURCHASE ITEMS
-- =====================================================
INSERT INTO purchaseItem VALUES
(1, 1, 30,80.00, 2400.00),
(1, 4, 15,120.00,1800.00),
(2, 9, 20,110.00,2200.00),
(2,12, 40,40.00, 1600.00),
(3, 8, 12,200.00,2400.00),
(3, 7, 15,130.00,1950.00),
(3, 5,  8,95.00,  760.00),
(4,18, 20,60.00, 1200.00),
(4,19, 15,70.00, 1050.00),
(5,14, 18,110.00,1980.00),
(5,16, 25,75.00, 1875.00),
(5,17, 20,55.00, 1100.00),
(6,20, 40,45.00, 1800.00),
(6, 2, 25,65.00, 1625.00),
(6, 3, 20,90.00, 1800.00);
 
-- =====================================================
-- 10. SALES INVOICES (20 invoices)
-- =====================================================
INSERT INTO salesInvoice VALUES
(1, '2023-03-05', 1, 2,  0.00, 320.00,'Cash'),
(2, '2023-03-18', 2, 3, 10.00, 432.00,'Credit Card'),
(3, '2023-04-02', 5, 2,  0.00, 220.00,'Cash'),
(4, '2023-05-14', 4, 2, 10.00, 360.00,'Credit Card'),
(5, '2023-06-20', 8, 3, 10.00, 198.00,'Credit Card'),
(6, '2023-07-09', 3, 4,  0.00, 240.00,'Cash'),
(7, '2023-08-01', 7, 5,  0.00, 160.00,'Cash'),
(8, '2023-09-12',11, 2, 10.00, 504.00,'Credit Card'),
(9, '2023-10-03', 9, 3,  0.00, 190.00,'Cash'),
(10,'2023-11-25',14, 2, 10.00, 396.00,'Credit Card'),
(11,'2024-01-07', 6, 2,  0.00, 270.00,'Cash'),
(12,'2024-02-14', 2, 3, 10.00, 288.00,'Credit Card'),
(13,'2024-03-03',13, 4,  0.00, 190.00,'Cash'),
(14,'2024-04-19', 4, 2, 10.00, 342.00,'Credit Card'),
(15,'2024-05-08',10, 5,  0.00, 220.00,'Cash'),
(16,'2024-06-22',15, 6,  0.00, 280.00,'Cash'),
(17,'2024-07-14', 8, 3, 10.00, 252.00,'Credit Card'),
(18,'2024-08-30',12, 7,  0.00, 160.00,'Cash'),
(19,'2024-10-11',14, 2, 10.00, 480.00,'Credit Card'),
(20,'2024-11-28', 1, 3,  0.00, 350.00,'Cash');
 
-- =====================================================
-- 11. SALES ITEMS
-- =====================================================
INSERT INTO salesltem VALUES
(1, 1, 1,160.00,160.00),
(1, 7, 1,240.00,240.00),
(2,15, 1,400.00,400.00),
(2,19, 1,280.00,280.00),
(3,23, 2,80.00, 160.00),
(3,39, 1,90.00,  90.00),
(4, 3, 1,130.00,130.00),
(4, 9, 1,190.00,190.00),
(5,31, 1,150.00,150.00),
(5,25, 1,90.00,  90.00),
(6,13, 1,260.00,260.00),
(7,33, 1,110.00,110.00),
(7,39, 1,90.00,  90.00),
(8,17, 1,220.00,220.00),
(8,27, 1,220.00,220.00),
(9,24, 1,80.00,  80.00),
(9,21, 1,140.00,140.00),
(10,29,1,190.00,190.00),
(10,32,1,150.00,150.00),
(11,19,1,280.00,280.00),
(12, 2,1,160.00,160.00),
(12,26,1,90.00,  90.00),
(13,22,1,140.00,140.00),
(13,40,1,90.00,  90.00),
(14,35,2,120.00,240.00),
(14,37,1,140.00,140.00),
(15,23,1,80.00,  80.00),
(15,24,1,80.00,  80.00),
(15,40,1,90.00,  90.00),
(16, 8,1,240.00,240.00),
(16,25,1,90.00,  90.00),
(17, 5,1,180.00,180.00),
(17,28,1,220.00,220.00),
(18,37,1,140.00,140.00),
(19,16,1,400.00,400.00),
(19,31,1,150.00,150.00),
(20,10,1,190.00,190.00),
(20,18,1,220.00,220.00);

-- =====================================================
-- USEFUL QUERIES
-- =====================================================



 -- 1عدد الموردين 
select count(id) as supplier from supplier;
-- 2 numper of castemer
select count(id) as customers from customer;
-- 3 numper of employees 
select count(id) as employees from employee;
-- 4 numper of products
select count(id) as products  from product;
-- 5 total salel
select (select sum(total_amount) from purchaseinvoice) - (select sum(totalamount) from salesInvoice) as profits;
-- 6 all nin stok products
SELECT p.id, p.p_name, pv.color, pv.size, pv.quntity
FROM product p
JOIN productVariant pv ON p.id = pv.product_id
where pv.quntity>=pv.min_stok_level ;
-- 7 all products
SELECT p.id, p.p_name, pv.color, pv.size, pv.quntity
FROM product p
JOIN productVariant pv ON p.id = pv.product_id;
-- 8 all emp
select* from  employee;
-- 9 all purchaseinvoice in a year
select* from  purchaseinvoice 
where get_date like '2023%';

-- 10 all salesInvoice for cuostmer
select payment_method,totalamount, discount,employee_id ,customer_id ,c.c_name 
 from  salesInvoice natural join salesInvoice si join customer c on c.id=si.customer_id natural join salesltem st 
where c.id like '2';

-- 11 all the purchaseinvoice
select* from  purchaseinvoice;
--  supplier
select* from  supplier;
--  14  تصفية حسب الجنس.
select p.p_name The_product,brand,gender,c.c_name,color, quntity,barcode,size ,cost_price ,selling_price,min_stok_level
from productVariant pv join product p on  p.id=pv.product_id join categorie c on c.id=p.categorie_id;
-- 15 the profit at a yere
select sum(totalamount) profits,'2023'
 from salesInvoice
where date_s like'2023%';

-- 16 المبيعات والإيرادات
select (select sum(total_amount) from purchaseinvoice) , (select sum(totalamount) from salesInvoice) as profits;

-- 17
with sub as(
 select productVariant_id,sum(total_price) total
 from salesltem 
 group by  productVariant_id ) ,
 max_total as( select  max(total) max_valu from sub
  )
  
select distinct pv.barcode, p_name product_name ,brand,gender,color, pv.quntity,size ,cost_price ,selling_price,min_stok_level,max_valu
from  
 product p join productVariant pv on p.id=pv.product_id 
 join salesltem  si on pv.id= si.productVariant_id join
 sub on sub.productVariant_id=pv.id right join max_total on sub.total=max_total.max_valu
where sub.productVariant_id=pv.id;
-- -- 18 updat salary
update employee
set  salary= salary+40
where id='6';
-- -- 19
update employee
set   TheRole ='Seller'
where id='4';


-- 20
INSERT INTO customer (c_name, phone, city, street, state, created_at)
VALUES ('salwa', '0541600016', 'Haifa', 'Herzl 20', 'Regula', '2024-05-01');
-- 21
INSERT INTO employee (first_name, last_name , phone, email, TheRole , Id_number,hire_date,salary,working_hours )
VALUES ('salwa',  'Haddad', '0528400002','rana.h@store.com',  'Cashier', '123457782','2023-04-15', 650.00,18);
-- 22
select uc.password ,uc.username ,e.id
from UserAccount uc join employee e on e.id=uc.employee_id;
-- only the maniger can see password 
-- where e.TheRole ='Mansour';

-- 23 فاتورة  للزبون 
INSERT INTO salesInvoice (date_s, customer_id, employee_id, discount, totalamount, payment_method)
VALUES ('2024-05-02', 2, 3, 10.00, 450.00, 'Credit Card');
-- 24 فاتورة المورد
INSERT INTO purchaseinvoice (supplier_id, get_date, employee_id, total_amount)
VALUES (1, '2024-05-01', 1, 1500.00);

-- -- 25
update employee
set  phone='0598767546'
where id='3';
 -- 26
 update employee
set   working_hours=working_hours+2
where id='4';
-- 27 أكثر المنتجات مبيعاً،
with sum_product as(
select distinct si.customer_id,sum(quntity) how_mutch_product_bye
from salesInvoice si  join salesltem st on si.id = st.salesInvoice_id
group by si.customer_id),
pc (value)as(
select max(how_mutch_product_bye) from sum_product
)
select distinct c.id customer_id,c.c_name customer_name, how_mutch_product_bye pist_coustmer
from customer c join salesInvoice si on c.id= si.customer_id natural join sum_product sp,pc
where  pc.value=how_mutch_product_bye
 ;


-- 28: المخزون المنخفض
SELECT p.p_name, pv.color, pv.size,pv.quntity  stock,pv.min_stok_level  minimum
FROM productVariant pv
JOIN product p ON pv.product_id = p.id
WHERE pv.quntity <= pv.min_stok_level
ORDER BY pv.quntity;

--  29 محددة، أداء الموظفين
select e.id employee_id , sum(si.employee_id ) total_sale
from employee e join salesInvoice si on si.employee_id =e.id
group by  e.id 
order by total_sale desc;

-- 30  product sales
 select  p.id product_id ,p.p_name product_name , sum(total_price) total
 from salesltem st   join productVariant pv on st.productVariant_id =pv.id join  product p on  pv.product_id=p.id
group  by   pv.id ,p.p_name 
order by total desc;

-- 31 العملاء غير النشطين
select distinct si.customer_id,sum(quntity) how_mutch_product_bye
from salesInvoice si  join salesltem st on si.id = st.salesInvoice_id
group by si.customer_id
order by how_mutch_product_bye;

-- 32 product profit  on sale
select pv.id productVariant_id,(pv.selling_price - pv.cost_price) profit_ber_unit
from salesltem st join productVariant pv on st.productVariant_id=pv.id;

-- 33 customer ber city
select c.c_name,c.phone,c.city,c.street
from customer c ,customer c1
where c.city=c1.city;

-- 34 customer having vip
select c_name coustmer_name,phone,city,street,state
from customer 
where state='VIP';

--  -- 35 show how mutch vip in eatch city
--  select c.city ,sum(c.id)
-- from customer c ,customer c1
-- where c.city=c1.city and c.street='VIP' and c1.street='VIP'
-- group by c.city;


-- 35 المشتريات والموردون
 select s.name supplier_name ,sum(pt.quntity) how_mutch_we_bay
 from supplier s join purchaseinvoice pi on s.id=pi.supplier_id 
 join  purchaseItem pt on pt.purchaselnvoice_id=pi.id
 group by s.name ;
 
 -- 36 how matche we sal from the supplier
  select s.name supplier_name ,sum(st.quntity) how_mutch_we_bay
 from supplier s join purchaseinvoice pi on s.id=pi.supplier_id 
 join  purchaseItem pt on pt.purchaselnvoice_id=pi.id 
 join product p on p.id=pt.product_id
join productVariant pv on pv.product_id=p.id
join  salesltem st  on st.productVariant_id=pv.id
join  salesInvoice si  on si.id = st.salesInvoice_id
 group by s.name ;
 
 -- 37 الرواتب حسب الدور
 select first_name ,salary /working_hours  ber_hour
 from employee
 where TheRole='Manager';
 
 -- 38 لديه حساب في النظام
 
  select e.id employee_id ,first_name, TheRole
 from employee e
 where e.id in (select employee_id from UserAccount);
 
 -- put the new employe  in the UserAccount then  you can ubdate the password ets 
 
 

 -- 39
 

delete from salesltem
where salesInvoice_id in (
    select id from salesInvoice where employee_id = 5
);

delete from salesInvoice
where employee_id = 5;


delete from employee
where id = 5;


 -- 40
 
   delete from supplier
 where id=5 ;
 
-- 41
delete from salesltem
where productVariant_id in (
    select id from productVariant where product_id = 5
);

delete from purchaseItem
where product_id = 5;


delete from productVariant
where product_id = 5;

  delete from product
 where id=5 ;
 

 
 
 

