CREATE DATABASE EarthquakeDB;
USE EarthquakeDB;

CREATE TABLE Earthquake (
    ID INT PRIMARY KEY,
    Date DATE,
    Magnitude FLOAT,
    Epicenter VARCHAR(100),
    Depth FLOAT
);

CREATE TABLE Damage (
    DamageID INT PRIMARY KEY,
    EarthquakeID INT,
    BuildingsAffected INT,
    CostEstimate FLOAT,
    Deaths INT,
    FOREIGN KEY (EarthquakeID) REFERENCES Earthquake(ID)
);

CREATE TABLE AnimalsAffected (
    AnimalID INT PRIMARY KEY,
    EarthquakeID INT,
    Species VARCHAR(100),
    NumberAffected INT,
    FOREIGN KEY (EarthquakeID) REFERENCES Earthquake(ID)
);

CREATE TABLE Locations (
    LocationID INT PRIMARY KEY,
    Country VARCHAR(100),
    State VARCHAR(100),
    City VARCHAR(100)
);

#link earthquake with locations
ALTER TABLE Earthquake ADD LocationID INT;
ALTER TABLE Earthquake ADD FOREIGN KEY (LocationID) REFERENCES Locations(LocationID);

CREATE TABLE RescueEfforts (
    RescueID INT PRIMARY KEY,
    EarthquakeID INT,
    AgencyName VARCHAR(100),
    Volunteers INT,
    Cost FLOAT,
    FOREIGN KEY (EarthquakeID) REFERENCES Earthquake(ID)
);

#DATA INSERTION
INSERT INTO Earthquake (ID, Date, Magnitude, Epicenter, Depth, LocationID) VALUES
    (1, '2024-11-10', 6.8, 'California', 10.5, 1),
    (2, '2024-11-15', 7.2, 'Mumbai', 15.0, 2),
    (3, '2024-10-05', 5.5, 'Tokyo', 30.0, 3),
    (4, '2024-09-25', 6.0, 'Mexico City', 25.5, 4);

INSERT INTO Locations (LocationID, Country, State, City) VALUES
    (1, 'USA', 'California', 'Los Angeles'),
    (2, 'India', 'Maharashtra', 'Mumbai'),
    (3, 'Japan', 'Tokyo', 'Tokyo'),
    (4, 'Mexico', 'Mexico City', 'Mexico City');


INSERT INTO AnimalsAffected (AnimalID, EarthquakeID, Species, NumberAffected) VALUES
    (1, 1, 'Cattle', 50),
    (2, 1, 'Deer', 30),
    (3, 2, 'Cows', 100),
    (4, 2, 'Buffaloes', 75),
    (5, 3, 'Birds', 200),
    (6, 4, 'Dogs', 20),
    (7, 4, 'Cats', 10);

INSERT INTO RescueEfforts (RescueID, EarthquakeID, AgencyName, Volunteers, Cost) VALUES
    (1, 1, 'Red Cross', 200, 500000.00),
    (2, 2, 'National Disaster Team', 300, 1000000.00),
    (3, 3, 'Animal Welfare Group', 100, 200000.00),
    (4, 4, 'Mexico Relief', 400, 1500000.00);
    
INSERT INTO Damage (DamageID, EarthquakeID, BuildingsAffected, CostEstimate, Deaths) VALUES
    (1, 1, 150, 2000000.00, 10),
    (2, 2, 300, 5000000.00, 50),
    (3, 3, 100, 1000000.00, 5),
    (4, 4, 400, 7000000.00, 70);
    
#QUERIES
#view all earthquakes
SELECT * FROM locations;
select * from Earthquake; 
select * from AnimalsAffected;
select * from Damage; 
select * from rescueefforts; 

#Get details of damage for a specific earthquake
SELECT * FROM Damage WHERE EarthquakeID = 1;

#Join Earthquake and Locations to display location details
SELECT E.ID, E.Date, E.Magnitude, E.Epicenter, L.Country, L.State, L.City
FROM Earthquake E
INNER JOIN Locations L ON E.LocationID = L.LocationID;

#Retrieve Rescue Efforts for a Specific Earthquake
SELECT RE.RescueID, RE.AgencyName, RE.Volunteers, RE.Cost
FROM RescueEfforts RE
WHERE RE.EarthquakeID = 1;

#Count Animals Affected by Each Earthquake
SELECT E.ID AS EarthquakeID, SUM(AA.NumberAffected) AS TotalAnimalsAffected
FROM Earthquake E
INNER JOIN AnimalsAffected AA ON E.ID = AA.EarthquakeID
GROUP BY E.ID;

# Calculate Total Damage Cost for All Earthquakes
SELECT SUM(D.CostEstimate) AS TotalDamageCost
FROM Damage D;

#Earthquakes with Magnitude Greater Than 5
SELECT * FROM Earthquake WHERE Magnitude > 5;

#Rescue Efforts Sorted by Cost
SELECT * FROM RescueEfforts ORDER BY Cost DESC;

#View All Earthquakes and Their Damage, Even Without Recorded Damage
SELECT E.ID, E.Date, E.Magnitude, D.BuildingsAffected, D.CostEstimate
FROM Earthquake E
LEFT JOIN Damage D ON E.ID = D.EarthquakeID;










