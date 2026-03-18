create database viewShevelov
use viewShevelov

CREATE TABLE laps(
    lapsID INT NOT NULL PRIMARY KEY identity,
    nimi VARCHAR(40) NOT NULL,
    pikkus SMALLINT,
    synniaasta INT NULL,
    synnilinn VARCHAR(15)
);
CREATE TABLE loom(
    loomID INT NOT NULL PRIMARY KEY identity,
    nimi VARCHAR(40) NOT NULL,
    kaal SMALLINT,
    lapsID INT,
    FOREIGN KEY (lapsID) REFERENCES laps(lapsID)
);
insert into laps(nimi, pikkus, synniaasta, synnilinn)
values ('Matvii', 150, 2005, 'Tallinn'),
('Andrei', 155, 2005, 'Tallinn'),
('Maks', 160, 2005, 'Tallinn'),
('Ilja', 150, 2007, 'Tallinn'),
('Damian', 145, 2015, 'Tartu');
select * from laps;
insert into loom (nimi, kaal, lapsID)
values ('koer Musa', 5, 1), ('kass Muu', 5, 1),
('hamster Ron', 1, 2), ('jänes Lill', 2, 2), ('siil Viliam', 1, 1);
select * from loom;
select * from laps;

--select lause 2 seotud tabelite pöhjal
select l.nimi, lm.nimi from laps l inner join loom lm
on l.lapsID=lm.lapsID;
--salvestame päring view abil
create view sisestatud_lapsiloomad as 
select l.nimi as lapsNimi, lm.nimi as loomNimi 
from laps l inner join loom lm 
on l.lapsID=lm.lapsID;

--kasutame salvestud view
select * from sisestatud_lapsiloomad;

--21.
create view lapsedIlmaLoomata as
SELECT lp.nimi AS lapsenimi, 
       l.nimi AS loomanimi, 
       l.kaal, 
       lp.synnilinn
FROM laps AS lp LEFT JOIN loom AS l
ON l.lapsID = lp.lapsID;
--kasutame salveststud view
select * from lapsedIlmaLoomata;
select lapsenimi, loomanimi from lapsedIlmaLoomata;

--24.
CREATE TABLE varjupaik(
    varjupaikID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    koht VARCHAR(50) NOT NULL,
    firma VARCHAR(30)
);
--25.
ALTER TABLE loom 
ADD varjupaikID INT;
--26.
ALTER TABLE loom 
ADD CONSTRAINT fk_varjupaik
FOREIGN KEY (varjupaikID) REFERENCES varjupaik(varjupaikID);
--27.
INSERT INTO varjupaik(koht, firma)
VALUES ('Paljassaare', 'Varjupaikade MTÜ');
--Kontrollime tabelit:

SELECT * FROM varjupaik;
--28.
UPDATE loom 
SET varjupaikID = 1;
--Kontrollime tulemust:
SELECT * FROM loom;
--loome view mis kasutab 3 tabelit
create view lapseloomadVarjupaigas as
SELECT lp.nimi AS lapsenimi, 
       l.nimi AS loomanimi, 
       v.koht
FROM laps AS lp, loom AS l, varjupaik AS v
WHERE l.lapsID = lp.lapsID 
AND l.varjupaikID = v.varjupaikID;
--kasutame salveststud view
select * from lapseloomadVarjupaigas
--dbo -- database object

--view kus on ainult kassid
create view kassid as 
select * from loom
where nimi like 'kass%'

--view kus lapsed alla 16 aastat
create view lapsedalla16 as	
select nimi, synniaasta, (2026-synniaasta) as vanus from laps
where synniaasta >= 2008;

--view mis arvutab keskmine loomakaal
create view keskmineKaal as
select AVG(kaal) as keskmineKaal from loom 
select * from keskmineKaal

--view kus lapsi olemas rohkem kui 1 loom
insert into loom (nimi, kaal, lapsID)
values ('koer nusya', 20, 1);
select * from sisestatud_lapsiloomad;
create view lalala as
select la.nimi as LapsNimi, count(lm.nimi) as CountLoom
from laps la inner join loom lm
on la.lapsID=lm.lapsID
group by la.nimi 
having COUNT(lm.nimi) > 1;
select * from lalala

--kas võib teha update view?
--ja mida ta muudab?
create view loomad as 
select nimi, kaal from loom;
select * from loom;
select * from loomad;
--surendame kaal 100% võrra
update loomad set kaal = kaal * 2;

