create database matviiPrac
use matviiPrac
CREATE TABLE firma( 
    firmaID INT NOT NULL PRIMARY KEY identity, 
    firmanimi VARCHAR(30), 
    aadress VARCHAR(30), 
    telefon VARCHAR(13) 
);
create table praktikajuhendaja (
    juhendajaID int not null primary key identity,
    eesnimi varchar(30),
    perenimi varchar(30),
    synniaeg date,
    telefon varchar(13)
);
CREATE TABLE praktikabaas (
    praktikabaasID INT NOT NULL PRIMARY KEY identity,
    firmaID INT,
    tingimused VARCHAR(100),
    programm VARCHAR(50),
    juhendajaID INT,

    FOREIGN KEY (firmaID) REFERENCES firma(firmaID),
    FOREIGN KEY (juhendajaID) REFERENCES praktikajuhendaja(juhendajaID)
);
insert into firma (firmanimi, aadress, telefon)
values ('Maheevka', 'Tatarskaja 4', '075 8231'),
('Yashkino', 'Rimska 12', '8814 8244'),
('McDonalds', 'Laagri tee 13', '7843 7993'),
('KFC', 'Narva tee 56', '5674 1117'),
('Hrust team', 'Pireskaya 3', '123 7576');

insert into praktikajuhendaja (eesnimi, perenimi, synniaeg, telefon)
values ('Anton', 'Zymak', '2009-09-12', '5295 2955'),
('Timifej', 'Stoljarov', '1999-10-05', '5283 1344'),
('Mihkel', 'Unt', '2001-11-20', '5791 4382'),
('Andrii', 'Stechkin', '2018-03-15', '5838 1213'),
('Volodimir', 'Zelenski', '1982-07-01', '5793 1444');
insert into praktikabaas (firmaID, tingimused, programm, juhendajaID) 
values (1, 'Remote', 'Java', 1),
(2, 'Office', 'Python', 2),
(3, 'Hybrid', 'C++', 3),
(1, 'Office', 'JavaScript', 2),
(4, 'Remote', 'Python', 1),
(5, 'Hybrid', 'Java', 4);
select * from firma
select * from praktikajuhendaja
select * from praktikabaas

--4
--näitab kõik firmad, mis juntuvad 'a' 
select * from firma
where firmanimi like '%a%';
--Kombineerib tabeleid ja sorteerib tulemuse ettevõtte nime järgi
select * from praktikabaas pb
join firma f on f.firmaID = pb.firmaID
order by f.firmanimi;
--näitab praktikakohtade arv iga ettevõtte kohta
select f.firmanimi, count(pb.praktikabaasID) as kogus
from firma f
join praktikabaas pb on f.firmaID = pb.firmaID
group by f.firmanimi;
--Näitab septembris, oktoobris või novembris sündinud praktikajuhendajad
select * from praktikajuhendaja
where month(synniaeg) in (9, 10, 11);
--5
--Näitab praktikajuhendajad nimesid ja nende praktikakohtade arvu
select j.eesnimi, j.perenimi, count(pb.praktikabaasID) as praktikate_arv
from praktikajuhendaja j
left join praktikabaas pb 
on j.juhendajaID = pb.juhendajaID
group by j.juhendajaID, j.eesnimi, j.perenimi;

alter table praktikajuhendaja
add palk decimal(10,2);

update praktikajuhendaja set palk = 1200 where juhendajaID = 1;
update praktikajuhendaja set palk = 1500 where juhendajaID = 2;
update praktikajuhendaja set palk = 1300 where juhendajaID = 3;
update praktikajuhendaja set palk = 1400 where juhendajaID = 4;
update praktikajuhendaja set palk = 1600 where juhendajaID = 5;

--6
create view vaade_ettevotted as
select f.firmanimi, count(pb.praktikabaasID) as kogus
from firma f
join praktikabaas pb on f.firmaID = pb.firmaID
group by f.firmanimi;

create view vaade_sugis as
select *
from praktikajuhendaja
where month(synniaeg) in (9, 10, 11);

select * from vaade_ettevotted;
select * from vaade_sugis;

--7
create procedure lisa_firma
    @nimi varchar(50),
    @aadress varchar(100),
    @telefon varchar(20)
as
begin
    insert into firma (firmanimi, aadress, telefon)
    values (@nimi, @aadress, @telefon);
end;
exec lisa_firma 'Casino Olimpic', 'Tallinn', '5455 5253';

create procedure lisa_veerg
as
begin
    alter table praktikajuhendaja
    add email varchar(50);
end;
exec lisa_veerg;

create procedure keskmine_palk
as
begin
    select avg(palk) as keskmine_palk
    from praktikajuhendaja;
end;
exec keskmine_palk;

create function fnComputeAge(@DOB datetime)
returns nvarchar(50)
as begin
	declare @tempdate datetime, @years int, @months int, @days int
		select @tempdate = @DOB

		select @years = datediff(year, @tempdate, getdate()) - case when (month(@DOB) > month(GETDATE())) or (MONTH(@DOB)
		= month (getdate()) and day(@DOB) > DAY(getdate())) then 1 else 0 end
		select @tempdate = dateadd(year, @years, @tempdate)

		select @months = datediff(month, @tempdate, getdate()) - case when day(@DOB) > day(getdate()) then 1 else 0 end
		select @tempdate = dateadd(MONTH, @months, @tempdate)

		select @days = datediff(day, @tempdate, getdate())

	declare @Age nvarchar(50)
		set @Age = cast(@years as nvarchar(4)) + ' Years ' + cast(@months as nvarchar(2)) + 
		' Months ' + cast(@days as nvarchar(2)) + ' Days old'
	return @Age
end
select juhendajaID, eesnimi, synniaeg, dbo.fnComputeAge(synniaeg) 
as Age from praktikajuhendaja

create function dbo.CalculateAge(@DOB date)
returns int
as begin
declare @Age int

set @Age = DATEDIFF(YEAR, @DOB, GETDATE()) -
	case
		when (MONTH(@DOB) > MONTH(getdate())) or
			 (MONTH(@DOB) > MONTH(GETDATE()) and DAY(@DOB) > day(GETDATE()))
		then 1
		else 0
		end
	return @Age
end

select juhendajaID, dbo.CalculateAge(synniaeg) as Age from praktikajuhendaja
where dbo.CalculateAge(synniaeg) > 36
