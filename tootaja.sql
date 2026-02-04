CREATE DATABASE matviiShevelov;
USE matviiShevelov;

--tabeli loomine
CREATE TABLE tootaja(
tootajaID int PRIMARY KEY identity(1,1),
eesnimi varchar(30),
perenimi varchar(30),
synniaeg date,
koormus decimal(5,2),
elukoht TEXT,
ebielus bit
)
select * from tootaja;
INSERT INTO tootaja(eesnimi, perenimi, synniaeg)
VALUES ('Mark', 'päev', '2025-10-13');
('Navalni', 'Zeleni', '2019-10-13');
('Leha', 'paren', '2021-10-13');
