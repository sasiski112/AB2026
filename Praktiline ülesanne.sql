create database sh;
use sh;
create table Category(
id_category int identity(1,1) primary key,
category_name varchar(30) not null unique
);
create table Product(
id_product int identity(1,1) primary key,
id_category int,
foreign key (id_category) references Category(id_category),
name_product varchar(30) not null unique,
price varchar(30) not null check(price>0)
);
create table Sale(
id_product int,
foreign key (id_product) references Product(id_product),
idCustomer int identity(1,1) unique,
Count_pr varchar(30) not null check(count_pr>0),
Date_of_sale decimal(7,2) not null,
);
exec sp_help sale;
