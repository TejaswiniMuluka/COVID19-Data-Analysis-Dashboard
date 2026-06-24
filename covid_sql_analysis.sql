USE covid_analysis;

LOAD DATA LOCAL INFILE
'C:/Users/tejas/OneDrive/COVID19_Data_Analysis/data/cleaned_covid_data.csv'
INTO TABLE covid_data
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

SELECT COUNT(*) 
FROM covid_data;

USE covid_analysis;

LOAD DATA LOCAL INFILE
'C:/Users/tejas/OneDrive/COVID19_Data_Analysis/data/cleaned_covid_data.csv'
INTO TABLE covid_data
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;


SELECT COUNT(*) 
FROM covid_data;

#1️⃣ Total COVID Summary
SELECT 
SUM(Confirmed) AS Total_Cases,
SUM(Deaths) AS Total_Deaths,
SUM(Recovered) AS Total_Recovered
FROM covid_data;

#2️⃣ Top 10 affected countries
SELECT
Country,
Confirmed
FROM covid_data
ORDER BY Confirmed DESC
LIMIT 10;


#3️⃣ Region analysis
SELECT
WHO_Region,
SUM(Confirmed) AS Total_Cases
FROM covid_data
GROUP BY WHO_Region
ORDER BY Total_Cases DESC;

#4️⃣ Highest Death Rate Countries
SELECT
Country,
Death_Rate
FROM covid_data
ORDER BY Death_Rate DESC
LIMIT 10;

#5️⃣ Highest Recovery Rate Countries
SELECT
Country,
Recovery_Rate
FROM covid_data
ORDER BY Recovery_Rate DESC
LIMIT 10;

#6️⃣ Active Cases by Country
SELECT
Country,
Active
FROM covid_data
ORDER BY Active DESC
LIMIT 10;

#7️⃣ New Cases Analysis
SELECT
Country,
New_Cases
FROM covid_data
ORDER BY New_Cases DESC
LIMIT 10;

#8️⃣ Average Recovery Rate by WHO Region
SELECT
WHO_Region,
AVG(Recovery_Rate) AS Avg_Recovery_Rate
FROM covid_data
GROUP BY WHO_Region;

#9️⃣ Countries with Low Death Rate
SELECT
Country,
Death_Rate
FROM covid_data
WHERE Death_Rate < 2
ORDER BY Death_Rate;

#🔟 Weekly Growth Analysis
SELECT
Country,
week_percentage_increase
FROM covid_data
ORDER BY week_percentage_increase DESC
LIMIT 10;