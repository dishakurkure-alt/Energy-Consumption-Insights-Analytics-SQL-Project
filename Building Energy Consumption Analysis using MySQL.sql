-- Step 1: Create the database
CREATE DATABASE EnergyAnalysis;

-- Step 2: Use the database
USE EnergyAnalysis;

-- Step 3: Create the main table
CREATE TABLE EnergyConsumption (
    id INT PRIMARY KEY,
    Timestamp DATETIME,
    Temperature FLOAT,
    Humidity FLOAT,
    SquareFootage FLOAT,
    Occupancy INT,
    HVACUsage VARCHAR(5),
    LightingUsage VARCHAR(5),
    RenewableEnergy FLOAT,
    DayOfWeek VARCHAR(10),
    Holiday VARCHAR(5),
    EnergyConsumption FLOAT
);
select*from EnergyConsumption;

-- Queries : 1. Average Energy Consumption by Day of Week
SELECT DayOfWeek, ROUND(AVG(EnergyConsumption), 2) AS AvgConsumption
FROM EnergyConsumption
GROUP BY DayOfWeek
ORDER BY AvgConsumption DESC;

#2.Total Energy Consumption on Holidays vs Non-Holidays

SELECT Holiday, SUM(EnergyConsumption) AS TotalConsumption
FROM EnergyConsumption
GROUP BY Holiday;

#3. Average Consumption when HVAC is ON vs OFF

SELECT HVACUsage, ROUND(AVG(EnergyConsumption), 2) AS AvgConsumption
FROM EnergyConsumption
GROUP BY HVACUsage;

#4. Peak Energy Hours
SELECT HOUR(Timestamp) AS HourOfDay, ROUND(AVG(EnergyConsumption), 2) AS AvgConsumption
FROM EnergyConsumption
GROUP BY HourOfDay
ORDER BY AvgConsumption DESC
LIMIT 5;


#5 Buildings with High Renewable Contribution
SELECT *, 
       ROUND((RenewableEnergy / EnergyConsumption) * 100, 2) AS RenewablePercentage
FROM EnergyConsumption
WHERE (RenewableEnergy / EnergyConsumption) > 0.3
ORDER BY RenewablePercentage DESC
LIMIT 10;
Select * from energyconsumption
order by Temperature ASC;