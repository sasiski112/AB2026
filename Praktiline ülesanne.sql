CREATE DATABASE shevelov
USE shevelov;

CREATE TABLE Type (
    type_code INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Category (
    idCategory INT PRIMARY KEY,
    Category_Name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Product (
    product_code INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    type_code INT NOT NULL,
    price DECIMAL(10,2) NOT NULL CHECK (price >= 0),
    FOREIGN KEY (type_code) REFERENCES Type(type_code)
);

CREATE TABLE Product_Category (
    idProduct INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    idCategory INT NOT NULL,
    Price DECIMAL(10,2) NOT NULL CHECK (Price >= 0),
    FOREIGN KEY (idCategory) REFERENCES Category(idCategory)
);

CREATE TABLE Sale (
    sales_code INT PRIMARY KEY,
    product_code INT NOT NULL,
    customer_code INT NOT NULL,
    number INT NOT NULL CHECK (number > 0),
    date DATE NOT NULL,
    FOREIGN KEY (product_code) REFERENCES Product(product_code)
);

CREATE TABLE Sale_Category (
    idSale INT PRIMARY KEY,
    idProduct INT NOT NULL,
    idCustomer INT NOT NULL,
    Count_pr INT NOT NULL CHECK (Count_pr > 0),
    Date_of_sale DATE NOT NULL,
    FOREIGN KEY (idProduct) REFERENCES Product_Category(idProduct)
);
