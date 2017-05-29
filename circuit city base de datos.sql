create database circuit_city;
use circuit_city;
CREATE TABLE item (
    item_id INT(10) AUTO_INCREMENT NOT NULL PRIMARY KEY,
    name VARCHAR(60) NOT NULL,
    cost DOUBLE NOT NULL
);
CREATE TABLE ord_det (
    order_id INT(10) AUTO_INCREMENT NOT NULL PRIMARY KEY,
    item_id INT(10) NOT NULL,
    item_count INT(10) NOT NULL,
    FOREIGN KEY (item_id)
        REFERENCES item (item_id)
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
CREATE TABLE ordex (
    orderid INT(10) AUTO_INCREMENT NOT NULL PRIMARY KEY,
    client_id INT(10) NOT NULL,
    FOREIGN KEY (client_id)
        REFERENCES client (client_id)
);