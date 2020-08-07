/*Create Database*/
CREATE DATABASE Minions
/*Create Tables*/
CREATE TABLE Minions(
    Id INT PRIMARY KEY IDENTITY,
    Name NVARCHAR(50) NOT NULL,
    Age TINYINT NULL
     
)

CREATE TABLE Towns(
    Id INT PRIMARY KEY IDENTITY,
    Name NVARCHAR(50) NOT NULL)

ALTER TABLE Minions
ADD TownID INT
ALTER TABLE Minions
ADD FOREIGN KEY (TownID) REFERENCES Towns(Id)

/*Insert Records in Both Tables*/

INSERT INTO Minions (Name, Age, TownID) VALUES
('Kevin', 22,1),
('Bob', 15,3),
('Steward',NULL,2)

INSERT INTO Towns (Name) VALUES
('Sofia'),
('Peter'),
('Victoria')


SELECT * FROM Minions
SELECT * FROM Towns

/*Truncate table Minions*/
DELETE FROM Minions
DELETE FROM Towns

/*Drop All Tables*/
DROP TABLE Minions
DROP TABLE Towns

/* Create Table People*/

CREATE TABLE People(
    Id INT PRIMARY KEY IDENTITY, 
    
    Name NVARCHAR(200) NOT NULL,
    Picture VARBINARY(MAX)
    CONSTRAINT CheckPicture2MB CHECK (DATALENGTH(Picture) <= 2097152),
    "Height in Meters"  DECIMAL(15,2) not null DEFAULT(0),
    "Weight in Kg" DECIMAL(15,2) not null DEFAULT(0),
     Gender varchar(max) NOT NULL CONSTRAINT chkcGender CHECK (Gender IN('m', 'f')),
	 
     Birthdate DATE,
	 Biography VARCHAR(max), 
	 )
	 INSERT INTO People VALUES
('Kevin',NULL, 10.0, 1.1, 'm','2012-06-18', NULL ),
('Bob',NULL, 1.55,35.0, 'f', '1994-12-12', NULL),
('Lara',NULL,2.55, 72.33, 'f','1965-06-29',NULL ),
('Knutt',NULL, 1.92,105, 'm','1974-04-16', NULL ),
('Mihaela',NULL, 1.65,57, 'f','2020-06-22',NULL)



/* Create Table Users*/

CREATE TABLE Users (
    Id INT PRIMARY KEY IDENTITY,
    Username VARCHAR(100) NOT NULL,
    Password VARCHAR(26),
	ProfilePicture VARBINARY(MAX)
    CONSTRAINT CheckPicture900KB CHECK (DATALENGTH(ProfilePicture) <= 900000),
    LastLoginTime DATETIME,
    /*IsDeleted BIT Default ('False')*/
	IsDeleted varchar(max) NOT NULL CONSTRAINT chkcDelete CHECK (IsDeleted IN('True', 'False'))
	)

INSERT INTO Users (Username, Password, ProfilePicture,LastLoginTime,IsDeleted) VALUES 
('Dmitri', 'password123', NULL, '2020-07-10', 'True'),
('George', 'password123', NULL, '2020-07-10', 'False'),
('Gina', 'paparazzi55', NULL, '2020-07-10', 'True'),
('Marsha', 'popuwindows', NULL, '2020-07-10', 'False'),
('Gregory', 'pinacollada88', NULL, '2020-07-10', 'False')

/*Change Primary Key*/

SELECT name  
FROM sys.key_constraints  
WHERE type = 'PK' AND OBJECT_NAME(parent_object_id) = N'Users'  
GO 

ALTER TABLE Users
DROP CONSTRAINT PK__Users__3214EC07CE598204;

ALTER TABLE Users 
   ADD CONSTRAINT PK_Users PRIMARY KEY (ID, Username);

/*Add Check Constraint*/
ALTER TABLE Users 

