CREATE DATABASE shevelov
USE shevelov;

CREATE TABLE Liik (
    liigi_kood INT IDENTITY(1,1) NOT NULL,
    nimetus VARCHAR(50) NOT NULL,
    kirjeldus VARCHAR(100) NULL,
    CONSTRAINT PK_Liik PRIMARY KEY (liigi_kood)
);

INSERT INTO Liik (nimetus, kirjeldus)
VALUES 
('Toit', 'Toiduained ja maiustused'),
('Joogid', 'Erinevad joogid'),
('Tehnika', 'Elektroonika ja seadmed'),
('Raamatud', 'Trükised ja e-raamatud');

CREATE TABLE Kaup (
    kauba_kood INT IDENTITY(1,1) NOT NULL,
    nimetus VARCHAR(50) NOT NULL,
    liigi_kood INT NOT NULL,
    hind DECIMAL(10,2) NOT NULL,
    laos INT DEFAULT 0,
    CONSTRAINT PK_Kaup PRIMARY KEY (kauba_kood),
    CONSTRAINT FK_Kaup_Liik FOREIGN KEY (liigi_kood) REFERENCES Liik(liigi_kood),
    CONSTRAINT CHK_Kaup_hind CHECK (hind >= 0),
    CONSTRAINT CHK_Kaup_laos CHECK (laos >= 0)
);

INSERT INTO Kaup (nimetus, liigi_kood, hind, laos)
VALUES 
('Leib Vollkorn', 1, 1.50, 50),
('Õunamahl', 2, 2.30, 30),
('Sülearvuti', 3, 1200.00, 10),
('Kriminaalromaan', 4, 15.99, 20);

CREATE TABLE Muuk (
    muugi_kood INT IDENTITY(1,1) NOT NULL,
    kauba_kood INT NOT NULL,
    ostja_kood INT NOT NULL,
    arv INT NOT NULL,
    kuupaev DATE DEFAULT GETDATE(),
    uhik VARCHAR(20) DEFAULT 'tk',
    CONSTRAINT PK_Muuk PRIMARY KEY (muugi_kood),
    CONSTRAINT FK_Muuk_Kaup FOREIGN KEY (kauba_kood) REFERENCES Kaup(kauba_kood),
    CONSTRAINT CHK_Muuk_arv CHECK (arv > 0)
);

INSERT INTO Muuk (kauba_kood, ostja_kood, arv, kuupaev)
VALUES
(1, 201, 3, '2025-01-15'),
(2, 202, 2, '2025-01-16'),
(3, 203, 1, '2025-01-17'),
(4, 204, 5, '2025-01-18');

SELECT * FROM Liik;
SELECT * FROM Kaup;
SELECT * FROM Muuk;
