create database circuit_city;
use circuit_city;
CREATE TABLE item (
    item_id INT(10) AUTO_INCREMENT NOT NULL PRIMARY KEY,
    name VARCHAR(60) NOT NULL,
    cost DOUBLE NOT NULL
);
CREATE TABLE ord_det (
    order_det_id INT(10) AUTO_INCREMENT NOT NULL PRIMARY KEY,
    order_id INT(10) NOT NULL,
    item_id INT(10) NOT NULL,
    item_count INT(10) NOT NULL,
    FOREIGN KEY (item_id)
        REFERENCES item (item_id),
    FOREIGN KEY (order_id)
        REFERENCES orderx (orderid)
);
create table client(
client_id int(10) auto_increment not null primary key,
name varchar(60) not null,
company varchar(60) not null
);
CREATE TABLE credit_client (
    id_credit_client INT(10) AUTO_INCREMENT NOT NULL PRIMARY KEY,
    client_id INT(10) NOT NULL,
    credit DOUBLE NOT NULL,
    FOREIGN KEY (client_id)
        REFERENCES client (client_id)
);
CREATE TABLE orderx (
    orderid INT(10) AUTO_INCREMENT NOT NULL PRIMARY KEY,
    client_id INT(10) NOT NULL,
    FOREIGN KEY (client_id)
        REFERENCES client (client_id)
);
insert into item(name,cost)values
('Monitor X8','200.50'),
('Monitor X2','399.50'),
('Monitor S3','454.50'),
('Hard Drive 15G','80.99'),
('Hard Drive 80G','280.00'),
('Printer U9','550.50'),
('CRDOM','39.50'),
('Cd Burne','99.78'),
('RAM 255M','54.50'),
('RAM 512M','80.99'),
('Keyboard','20.00'),
('Mouse','15.68'),
('USB drive','15.68');
insert into client(name,company)values
('Smith, Tony','Microsoft'),
('Smith, Julie','IBM'),
('Fry, Kevin','IBM'),
('Flana, Fran','Microsoft'),
('Belleza, Ana','Canon'),
('DiTore, Mike','Microsoft'),
('Ferry, Jim','HP'),
('Lynch, Tim','DELL'),
('Frunch, Ken','Pacific Bell');
insert into credit_client(client_id,credit)values
(1,'1000.00'),
(2,'3000.00'),
(3,'400.00'),
(4,'500.00'),
(5,'7000.00'),
(6,'8000.00'),
(9,'90.00');
insert into orderx(client_id)values
(1),(9),(6),(2),(9),(2);
insert into ord_det(order_id,item_id,item_count)values
(1,1,4),
(1,5,5),
(2,6,1),
(2,7,3),
(2,10,2),
(3,3,5),
(3,4,2),
(3,11,4),
(3,12,12),
(4,8,5),
(5,4,2),
(5,5,2),
(6,3,2),
(6,13,10);
SELECT 
    SUM(cost), AVG(cost), MIN(cost), MAX(cost)
FROM
    item;
SELECT 
    a.order_id, b.name, b.cost, a.item_count, b.cost
FROM
    ord_det a,
    item b
WHERE
    a.item_id = b.item_id AND a.order_id = 3;
SELECT 
    MAX(b.cost) AS expensive, MIN(b.cost) AS chip
FROM
    ord_det a,
    item b
WHERE
    a.item_id = b.item_id AND a.order_id = 3;


SELECT 
    COUNT(*) AS order_2002
FROM
    ord_det
WHERE
    order_id = 3;
select count(order_id)as order_c,
count(all order_id)as ord_all,
count(distinct order_id)as ord_dist
from ord_det;
