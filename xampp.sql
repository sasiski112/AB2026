CREATE DATABASE shevelov;
USE shevelov;

CREATE TABLE Type (
    type_code INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    PRIMARY KEY (type_code),
    UNIQUE KEY (name)
);

CREATE TABLE Category (
    idCategory INT NOT NULL,
    Category_Name VARCHAR(100) NOT NULL,
    PRIMARY KEY (idCategory),
    UNIQUE KEY (Category_Name)
);

CREATE TABLE Product (
    product_code INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    type_code INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (product_code),
    FOREIGN KEY (type_code) REFERENCES Type(type_code)
);

CREATE TABLE Product_Category (
    idProduct INT NOT NULL,
    Name VARCHAR(100) NOT NULL,
    idCategory INT NOT NULL,
    Price DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (idProduct),
    FOREIGN KEY (idCategory) REFERENCES Category(idCategory)
);

CREATE TABLE Sale (
    sales_code INT NOT NULL,
    product_code INT NOT NULL,
    customer_code INT NOT NULL,
    number INT NOT NULL,
    date DATE NOT NULL,
    PRIMARY KEY (sales_code),
    FOREIGN KEY (product_code) REFERENCES Product(product_code)
);

CREATE TABLE Sale_Category (
    idSale INT NOT NULL,
    idProduct INT NOT NULL,
    idCustomer INT NOT NULL,
    Count_pr INT NOT NULL,
    Date_of_sale DATE NOT NULL,
    PRIMARY KEY (idSale),
    FOREIGN KEY (idProduct) REFERENCES Product_Category(idProduct)
);

ALTER TABLE Product MODIFY price DECIMAL(12,2) NOT NULL;

ALTER TABLE Sale ADD COLUMN Units VARCHAR(20);

ALTER TABLE Type DROP INDEX name;
