/*

Cleaning data in SQL

Author: Sebastian Ortuno


Business requierements:
1. Is our hotel revenue growing by year?
We have two hotel types so it would be good to segment revenue by hotel type.

2. Should we increase our parking lot size? 
We want to understand if there is a trend is guest with personal cars.

3. What trends can we see in data ?
Focus on average daily rate and guests to explore seasonality.

*/

use projects; 

-- Before we start, Let's take a view of to our tables to have a better understanding about out data.

select * from dbo.['2018$'];
select * from dbo.['2019$'];
select * from dbo.['2020$'];
select * from dbo.market_segment$;
select * from dbo.meal_cost$;

/* What we are going to do, is to develop some SQL queries so we can get all of this data into one unified table that we are going 
to bring into Power BI before we start to visualize.*/


---------------------------------------------------------------------------------------------------------------
-- Data cleaning Process.
--1. Create a new column that contains all the days where the customer stayed at any hotel.

ALTER TABLE dbo.['2018$']
ADD Total_Stays INT;

UPDATE dbo.['2018$']
SET Total_Stays  = stays_in_week_nights + stays_in_weekend_nights;

-- 2019
ALTER TABLE dbo.['2019$']
ADD Total_Stays INT;

UPDATE dbo.['2019$']
SET Total_Stays  = stays_in_week_nights + stays_in_weekend_nights;

--2020  

ALTER TABLE dbo.['2020$']
ADD Total_Stays INT;

UPDATE dbo.['2020$']
SET Total_Stays  = stays_in_week_nights + stays_in_weekend_nights;

--2. Change the name of the tables to make it more readable and easy to work with in SSMS.

EXEC sp_rename N'dbo.[2018$]', N'Year_2018';
EXEC sp_rename N'dbo.[2019$]', N'Year_2019';
EXEC sp_rename N'dbo.[2020$]', N'Year_2020';


-----------------------------------------------------------------------------------------------------------------------------------------


-- 1. Is our hotel revenue growing by year?
-- We have two hotel types so it would be good to segment revenue by hotel type.



WITH Hotel_CTE AS( -- This first CTE Contains all the data from 2018 to 2020
SELECT * FROM dbo.['2018$']
UNION
SELECT * FROM dbo.['2019$']
UNION
SELECT * FROM dbo.['2020$'] 
),
MATHS_CTE AS( -- This CTE contains the Maths that we need to get our Revenue.
SELECT arrival_date_year as [Year],
	   hotel,
	   ROUND(SUM((Total_Stays)*adr),2) as Revenue
FROM Hotel_CTE
GROUP BY arrival_date_year, hotel
),
LAG_CTE AS( -- I decided to create this CTE that contains a windows function from the Past year's revenue.
SELECT [Year],
	   hotel,
	   Revenue,
	   LAG(Revenue)OVER(PARTITION BY hotel ORDER BY [Year]) AS Past_Year_Revenue
FROM MATHS_CTE
GROUP BY [Year], hotel, revenue)
SELECT "Year",
	   hotel,
	   Revenue,
	   Past_Year_Revenue,
	   Revenue-Past_Year_Revenue Growing_Revenue
FROM LAG_CTE;

--YEAR     HOTEL               Revenue           Past Year Revenue     Growing_Revenue?

-- 2018	   City Hotel	       1764667.57		
-- 2019	   City Hotel	       10755979.11	     1764667.57	            8991311.54
-- 2020	   City Hotel	       8018122.43	     10755979.11	        -2737856.68
-- 2018	   Resort Hotel	       3120849.49	          NULL	                  NULL
-- 2019	   Resort Hotel	       9432430.29	     3120849.49	            6311580.8
-- 2020	   Resort Hotel	       6266123.81	     9432430.29	            -3166306.48

-- Comments:

-- Analyzing the data we can observe that the revenue for both hotels increased in 2019 but had a significant drop in 2020.
-- In 2020 the world experienced the COVID-19 Pademic, which can be a factor of why the revenue from both hotels drop down that year.
-- City Hotel generates more revenue than Resort Hotel in 2019 and 2020.
-- Resort Hotel has a higher revenue in 2018.
-- In 2019, City Hotel generated a significant growing revenue of 8,991,311.54.
-- In 2019, Resort Hotel also experienced a growing revenue of 6,311,680.8.
-----------------------------------------------------------------------------------------------------------------------------------------

-- 2. Should we increase our parking lot size? 
-- We want to understand if there is a trend is guest with personal cars.

WITH Hotel_CTE AS( -- This first CTE Contains all the data from 2018 to 2020
SELECT * FROM dbo.['2018$']
UNION
SELECT * FROM dbo.['2019$']
UNION
SELECT * FROM dbo.['2020$'] 
)
SELECT arrival_date_year,
	   COUNT(*) As Total_Reservations,
	   SUM(required_car_parking_spaces) as Parking_Required,
	   ROUND((SUM(required_car_parking_spaces)/COUNT(*))*100,2) AS Parking_Needed_Percentage
	   
FROM Hotel_CTE
GROUP BY arrival_date_year;

--	Year					Total_Reservation      Parking_Required			Parking Needed_Percentage	
--	2018							13313					1331					10	
--	2019							55751					5154					9.24	
--	2020							31692					2207					6.96

-- Parking demand percentage is relatively low (under 10% each year).
-- There is a decreasing trend from 10% in 2018 to 6.96% in 2020.
-- This suggests that expanding the parking lot may not be necessary.


-----------------------------------------------------------------------------------------------------------------------------------------
--3. What trends can we see in the data? 
-- I focus ona verage daily rate and guests to explore	seasonality using reservation_status_date, net revenue(revenue * discount), hotel.

WITH Hotel_CTE AS ( -- I first create a CTE that contains the data of all the past three years in the company.
    	SELECT * FROM dbo.['2018$']
UNION
SELECT * FROM dbo.['2019$']
UNION
SELECT * FROM dbo.['2020$'] 
),
H_CTE AS (                -- This CTE contains the information needed using left join to join the discounts to our data.
    SELECT H.reservation_status_date,
		   H.hotel, 
		   SUM ((H.Total_Stays*H.adr)*ms.Discount) as Total_Revenue
	FROM Hotel_CTE AS H
	LEFT JOIN dbo.[market_segment$] AS ms
		ON H.market_segment = ms.market_segment
	GROUP BY H.hotel, H.reservation_status_date
	)
SELECT *                  -- Select all the information from CTEs and order by date.
FROM H_CTE
WHERE reservation_status_date>='2017-12-01'
ORDER BY reservation_status_date;




-- To have a better understanding from the trends, I would highly recommend to take a look to the dashboard I made.


-- Insights:

-- Revenue changes over time for both hotel types.
-- Resort Hotels (orange line) make more money in summer. People travel more for vacations.
-- City Hotels (blue line) make similar money every month. Business travel stays steady.
-- From 2018 to mid-2019, revenue goes up.
-- After that, it goes up and down.
-- In early 2020, both hotels make much less money. This is likely because of COVID-19.
-- Resort Hotels have bigger ups and downs than City Hotels. This is normal for vacation hotels.


-----------------------------------------------------------------------------------------------------------------------------------------
-- 4. Prepare data to import into POWER BI.


-- I will use the data from 2018-2019-2020, market segment and meal cost.

	WITH Hotel_CTE AS( 
	SELECT * FROM dbo.['2018$']
UNION
SELECT * FROM dbo.['2019$']
UNION
SELECT * FROM dbo.['2020$'] 
	)

	SELECT * 
	FROM Hotel_CTE AS hotels
	LEFT JOIN dbo.[market_segment$] AS ms
		ON hotels.market_segment = ms.market_segment
	LEFT JOIN dbo.[meal_cost$] AS mc
	ON hotels.meal=mc.meal;
