create database selectShevelov;
use selectShevelov;
create table Telefon (
	telefonID INT primary key,
	tootja VARCHAR(50) not null,
	telefonMODEL VARCHAR(50),
	hind money,
	v_aasta int,
	oSysteem VARCHAR(10)
);
select * from telefon;

alter table Telefon alter column oSysteem varchar(30);
insert into Telefon (telefonID, tootja, telefonMODEL, hind, v_aasta, oSysteem) values (1, 'verykool', 'verykool i115', 3.99, 2011, 'Feature phone');
insert into Telefon (telefonID, tootja, telefonMODEL, hind, v_aasta, oSysteem) values (2, 'alcatel', 'alcatel OT-106', 3.99, 2009, 'Feature phone');
insert into Telefon (telefonID, tootja, telefonMODEL, hind, v_aasta, oSysteem) values (3, 'alcatel', 'alcatel Pixi 4 (3.5)', 2.49, 2016, 'Android 5.1');
insert into Telefon (telefonID, tootja, telefonMODEL, hind, v_aasta, oSysteem) values (4, 'Asus', 'Asus Zenwatch 2 WI501Q', 99.99, 2015, 'Android Wear OS 2.1');
insert into Telefon (telefonID, tootja, telefonMODEL, hind, v_aasta, oSysteem) values (5, 'Ulefone', 'Ulefone Armor 7E', 69.99, 2020, 'Android 9.0');
insert into Telefon (telefonID, tootja, telefonMODEL, hind, v_aasta, oSysteem) values (6, 'BLU', 'BLU Gol', 8.99, 2010, 'Feature phone');
insert into Telefon (telefonID, tootja, telefonMODEL, hind, v_aasta, oSysteem) values (7, 'HTC', 'HTC Desire 516 dual sim', 4.19, 2014, 'Android 4.2.2, Sense UI 5.1');
insert into Telefon (telefonID, tootja, telefonMODEL, hind, v_aasta, oSysteem) values (8, 'Icemobile', 'Icemobile G3', 5.99, 2014, 'Android 4.2.2');
insert into Telefon (telefonID, tootja, telefonMODEL, hind, v_aasta, oSysteem) values (9, 'Samsung', 'Samsung Galaxy S II I777', 3.89, 2011, 'Android 2.3.4');
insert into Telefon (telefonID, tootja, telefonMODEL, hind, v_aasta, oSysteem) values (10, 'Tecno', 'Tecno Camon 11 Pro', 24.99, 2018, 'Android 8.1');
insert into Telefon (telefonID, tootja, telefonMODEL, hind, v_aasta, oSysteem) values (11, 'Samsung', 'Samsung A727', 3.99, 2007, 'Feature phone');
insert into Telefon (telefonID, tootja, telefonMODEL, hind, v_aasta, oSysteem) values (12, 'Kyocera', 'Kyocera Brigadier', 34.99, 2014, 'Android 4.4.2');
insert into Telefon (telefonID, tootja, telefonMODEL, hind, v_aasta, oSysteem) values (13, 'alcatel', 'alcatel 3v (2019)', 79.99, 2019, 'Android 9.0');
insert into Telefon (telefonID, tootja, telefonMODEL, hind, v_aasta, oSysteem) values (14, 'alcatel', 'alcatel OT-V570', 5.99, 2008, 'Feature phone');
insert into Telefon (telefonID, tootja, telefonMODEL, hind, v_aasta, oSysteem) values (15, 'Samsung', 'Samsung A110', 9.99, 2000, 'Feature phone');
insert into Telefon (telefonID, tootja, telefonMODEL, hind, v_aasta, oSysteem) values (16, 'Gionee', 'Gionee F205', 29.99, 2018, 'Android 7.1, Amigo 5');
insert into Telefon (telefonID, tootja, telefonMODEL, hind, v_aasta, oSysteem) values (17, 'Motorola', 'Motorola M3888', 19.99, 1999, 'Feature phone');
insert into Telefon (telefonID, tootja, telefonMODEL, hind, v_aasta, oSysteem) values (18, 'HTC', 'HTC Desire 400 dual sim', 3.99, 2012, 'Android OS, Sense UI');
insert into Telefon (telefonID, tootja, telefonMODEL, hind, v_aasta, oSysteem) values (19, 'Oppo', 'Oppo F17 Pro', 29.99, 2020, 'Android 10, ColorOS 7.2');
insert into Telefon (telefonID, tootja, telefonMODEL, hind, v_aasta, oSysteem) values (20, 'Yezz', 'Yezz Epic T7ED', 59.99, 2013, 'Android 4.2');
insert into Telefon (telefonID, tootja, telefonMODEL, hind, v_aasta, oSysteem) values (21, 'Nokia', 'Nokia 220', 4.99, 2014, 'Feature phone');
insert into Telefon (telefonID, tootja, telefonMODEL, hind, v_aasta, oSysteem) values (22, 'BLU', 'BLU Touch Book 7.0 Plus', 24.99, 2012, 'Android 4.0');
insert into Telefon (telefonID, tootja, telefonMODEL, hind, v_aasta, oSysteem) values (23, 'Nokia', 'Nokia 2330 classic', 4.99, 2009, 'Feature phone');
insert into Telefon (telefonID, tootja, telefonMODEL, hind, v_aasta, oSysteem) values (24, 'Philips', 'Philips Xenium 9@9w', 3.29, 2007, 'Feature phone');
insert into Telefon (telefonID, tootja, telefonMODEL, hind, v_aasta, oSysteem) values (25, 'LG', 'LG G Pad II 8.0 LTE', 3.49, 2015, 'Android 5.0.2');


select tootja, telefonMODEL as mudel from telefon;
--sorteerimine
-- ASC kasvas järjekorras
select tootja, telefonMODEL as mudel, hind
from telefon
order by hind;
--DESC kahanevas järjekorra
select tootja, telefonMODEL as mudel, hind
from telefon
order by hind desc;

--võrdlemine <, >, =, >=, <=
select telefonMODEL, hind 
from Telefon
where hind >35 --hind suurem kui 35
ORDER by hind;
--sama päring ilma between
select telefonMODEL, hind 
from Telefon
where hind >=10 and hind <=25 --hind suurem kui 35
order by hind;

--leia mudelid vahemikus 10-15 euro
select telefonMODEL, hind 
from Telefon
where hind between 10 and 25
order by hind;

-- disctint ?! näitab ainult üks kordus
select distinct oSysteem from Telefon;

--võrdlemine tekstiga LIKE
select tootja, telefonMODEL from telefon
where tootja like 'alcatel';
--in kuvab vastavus loetelus - соответствие перечислению
select tootja, telefonMODEL 
from telefon
where tootja in ('alcatel', 'Samsung', 'Nokia');

--päring ilma in
select tootja, telefonMODEL from telefon
where tootja like 'alcatel' or tootja like 'Samsung' or tootja like 'Nokia';

--leia mudelid mis algavad S tähega
select tootja, telefonMODEL 
from telefon
where telefonMODEL like 'S%';
--sisaldab s täht '%s%'

--agregaat-funktsioonid: AVG, MAX, MIN, SUM, COUNT
select avg(v_aasta) as keskmineAasta
from telefon;
-- telefonide üldkogus
select count(*) as üldKogus
from telefon;
--keeruline variant funktsiooniga
--telefonide üldkogus iga tootja kohta
select tootja, count(*) as üldkogus
from Telefon
group by tootja;
-- top 6
select top 6 tootja, hind
from Telefon
order by hind desc

select top 6 tootja, hind
from Telefon
order by tootja
