create database trigerMatvii
use trigerMatvii
--tabel linnad
create table linnad(
linnId int primary key identity(1,1),
linnanimi varchar(50) unique,
rahvaarv int not null);
--tabel logi
create table logi(
Id int primary key identity(1,1),
kuupaev datetime,
andmed text);
--insert triger
create trigger linnalisamine
on linnad
for insert
as
insert into logi(kuupaev, andmed)
select
getdate(), inserted.linnanimi
from inserted;
--kontrollimiseks tuleb lisada uus linn tabelisse linnad
insert into linnad (linnanimi, rahvaarv)
values ('Narva', 600000);
select * from linnad;
select * from logi;

--kustutame triger
drop trigger linnalisamine

create trigger linnalisamine
on linnad
for insert
as
insert into logi(kuupaev, andmed)
select
getdate(),
concat('lisatud linn: ', inserted.linnanimi, 
' | rahvaarv: ', inserted.rahvaarv, ' | id: ', inserted.linnId)
from inserted;

--delete trigger
create trigger linnakustutamine
on linnad
for insert
as
insert into logi(kuupaev, andmed)
select
getdate(),
concat('Kustutatud linn: ', deleted.linnanimi, 
' | rahvaarv: ', deleted.rahvaarv, ' | id: ', deleted.linnId)
from deleted;

delete from linnad where linnId=1;
select * from linnad;
select * from logi;

--update trigger
create trigger linnauuendamine
on linnad
for insert
as
insert into logi(kuupaev, andmed)
select
getdate(),
concat('Vana linna andmed: ', d.linnanimi, 
' | rahvaarv: ', d.rahvaarv, ' | id: ', d.linnId,
'Uued linna andmed: ', i.linnanimi, 
' | rahvaarv: ', i.rahvaarv, ' | id: ', i.linnId,)
from deleted d inner join inserted i
on d.linnId=i.linnId;

--kontrollimiseks uuendamine linna andmed
select * from linnad;
UPDATE linnad set linnanimi ='Tapa uus', rahvaarv=25
where linnId=2;
select * from linnad;
select * from logi;

-- LISAME KASUTAJA NIMI LOGI TABELISSE

ALTER TABLE logi add kasutaja varchar(40);
