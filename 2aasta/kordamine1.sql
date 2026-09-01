create database kordamineIKT25;
use kordamineIKT25;
create table opilane(
opilaneId int primary key identity(1,1),
nimi varchar(50),
isikukood char(11) not null,
ryhmId int);

create table ryhm(
ryhmId int primary key identity(1,1),
ryhmNimi char(10) unique,
opilasteArv int);

--tabeli kustutamine
drop table ...;

--valisvõti - FK
alter table opilane add foreign key (ryhmId) references ryhm(ryhmId);

grant select to opilaneMatvii; --saab vaadata kõik tabelist
grant insert on opilane to opilaneMatvii; --saab losada ainult tabelisse opilane

deny delete to opilaneMatvii;


select * from opilane, ryhm
where opilane.ryhmId=ryhm.ryhmId;

delete from opilane;

insert into opilane values ('Nikita', '124521515', 1);
