CREATE DATABASE veebipoodSHEVELOV;
USE veebipoodSHEVELOV;

CREATE TABLE categories (
    category_id int identity(1,1) PRIMARY KEY,
    category_name varchar(30) unique
);

CREATE TABLE brands (
    brand_id int identity(1,1) PRIMARY KEY,
    brand_name varchar(30) unique
);

CREATE TABLE products (
    product_id int identity(1,1) PRIMARY KEY,
    product_name varchar(50),
    brand_id int,
    category_id int,
    model_year int,
    list_price int,
    FOREIGN KEY (brand_id) REFERENCES brands(brand_id),
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

CREATE TABLE customers (
    customer_id int identity(1,1) PRIMARY KEY,
    first_name varchar(50),
    last_name varchar(50),
    phone char(20),
    email varchar(100),
    street varchar(100),
    city varchar(50),
    state_ varchar(50),
    zip_code char(10)
);
CREATE TABLE stores (
    store_id int identity(1,1) PRIMARY KEY,
    store_name int,
    phone char(20),
    email varchar(100),
    street varchar(100),
    city varchar(50),
    state_ varchar(50),
    zip_code char(10)
);

CREATE TABLE stocks (
    store_id int,
    product_id int,
    quantity int,
    PRIMARY KEY (store_id, product_id),
    FOREIGN KEY (store_id) REFERENCES stores(store_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

CREATE TABLE staffs (
    staff_id int identity(1,1) PRIMARY KEY,
    first_name varchar(50),
    last_name varchar(50),
    email varchar(100),
    phone char(20),
    active int,
    store_id int,
    manager_id int,
    FOREIGN KEY (store_id) REFERENCES stores(store_id),
    FOREIGN KEY (manager_id) REFERENCES staffs(staff_id)
);

CREATE TABLE orders (
    order_id int identity(1,1) PRIMARY KEY,
    customer_id int,
    order_status int,
    order_date char(10),
    required_date char(10),
    shipped_date char(10),
    store_id int,
    staff_id int,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (store_id) REFERENCES stores(store_id),
    FOREIGN KEY (staff_id) REFERENCES staffs(staff_id)
);

CREATE TABLE order_items (
    order_id int,
    item_id int,
    product_id int,
    quantity int,
    list_price int,
    discount int,
    PRIMARY KEY (order_id, item_id),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO categories (category_name)
VALUES
('T-särk'),
('Mantel'),
('Pusa'),
('Pintsak');
SELECT * FROM categories;


INSERT INTO brands (brand_name)
VALUES
('Adidas'),
('Nike'),
('Puma'),
('Cooper');

INSERT INTO products (product_name, brand_id, category_id, model_year, list_price)
VALUES
('Adidas T-särk', 1, 1, 2024, 30),
('Nike Pusa', 2, 3, 2023, 50),
('Puma Mantel', 3, 2, 2024, 120);

INSERT INTO customers (first_name, last_name, phone, email, city)
VALUES
('Ivan', 'Petrov', '555-111', 'ivan@mail.ee', 'Tallinn'),
('Anna', 'Sidorova', '555-222', 'anna@mail.ee', 'Tartu');

INSERT INTO stores (store_name, city)
VALUES
('Megamoda', 'Tallinn'),
('Mir Modi', 'Tartu');

INSERT INTO stocks (store_id, product_id, quantity)
VALUES
(1, 1, 20),
(1, 2, 15),
(2, 3, 10);

INSERT INTO staffs (first_name, last_name, email, phone, active, store_id, manager_id)
VALUES
('Marko', 'Tamm', 'marko@shop.ee', '555-333', 1, 1, null),
('Laura', 'Kask', 'laura@shop.ee', '555-444', 1, 2, null);

INSERT INTO orders (customer_id, order_status, order_date, required_date, shipped_date, store_id, staff_id)
VALUES
(1, 1, '2025-02-01', '2025-02-05', '2025-02-03', 1, 1),
(2, 1, '2025-02-02', '2025-02-06', '2025-02-04', 2, 2);

INSERT INTO order_items (order_id, item_id, product_id, quantity, list_price, discount)
VALUES
(1, 1, 1, 2, 30, 10),
(1, 2, 2, 1, 50, 0),
(2, 1, 3, 1, 120, 15);
SELECT * FROM brands;
SELECT * FROM products;
SELECT * FROM customers;
SELECT * FROM stores;
SELECT * FROM stocks;
SELECT * FROM staffs;
SELECT * FROM orders;
SELECT * FROM order_items;


