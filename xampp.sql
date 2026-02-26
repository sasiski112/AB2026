CREATE DATABASE IF NOT EXISTS ule1;
USE ule1;

DROP TABLE IF EXISTS Muuk;
DROP TABLE IF EXISTS Kaup;
DROP TABLE IF EXISTS Liik;

CREATE TABLE Liik (
    liigi_kood INT NOT NULL AUTO_INCREMENT,
    nimetus VARCHAR(50) NOT NULL,
    kirjeldus VARCHAR(100),
    PRIMARY KEY (liigi_kood)
) ENGINE=InnoDB;

INSERT INTO Liik (nimetus, kirjeldus)
VALUES 
('Toit', 'Toiduained ja maiustused'),
('Joogid', 'Erinevad joogid'),
('Tehnika', 'Elektroonika ja seadmed'),
('Raamatud', 'Trükised ja e-raamatud');

CREATE TABLE Kaup (
    kauba_kood INT NOT NULL AUTO_INCREMENT,
    nimetus VARCHAR(50) NOT NULL,
    liigi_kood INT NOT NULL,
    hind DECIMAL(10,2) NOT NULL,
    laos INT NOT NULL DEFAULT 0,
    PRIMARY KEY (kauba_kood),
    FOREIGN KEY (liigi_kood) REFERENCES Liik(liigi_kood)
) ENGINE=InnoDB;

INSERT INTO Kaup (nimetus, liigi_kood, hind, laos)
VALUES 
('Leib Vollkorn', 1, 1.50, 50),
('Õunamahl', 2, 2.30, 30),
('Sülearvuti', 3, 1200.00, 10),
('Kriminaalromaan', 4, 15.99, 20);

CREATE TABLE Muuk (
    muugi_kood INT NOT NULL AUTO_INCREMENT,
    kauba_kood INT NOT NULL,
    ostja_kood INT NOT NULL,
    arv INT NOT NULL,
    kuupaev DATE NOT NULL DEFAULT CURRENT_DATE,
    uhik VARCHAR(20) NOT NULL DEFAULT 'tk',
    PRIMARY KEY (muugi_kood),
    FOREIGN KEY (kauba_kood) REFERENCES Kaup(kauba_kood)
) ENGINE=InnoDB;

INSERT INTO Muuk (kauba_kood, ostja_kood, arv, kuupaev)
VALUES
(1, 201, 3, '2025-01-15'),
(2, 202, 2, '2025-01-16'),
(3, 203, 1, '2025-01-17'),
(4, 204, 5, '2025-01-18');

SELECT * FROM Liik;
SELECT * FROM Kaup;
SELECT * FROM Muuk;
