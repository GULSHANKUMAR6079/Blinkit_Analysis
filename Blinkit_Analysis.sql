select * from blinkit_data

use blinkit;
select count(*) from blinkit_data

update  blinkit_data
set Item_Fat_Content=case
when Item_Fat_Content in ('LF','low fat') then 'Low Fat'
when Item_Fat_Content ='reg' then 'Regular'
else Item_Fat_Content  
End

select distinct(Item_Fat_Content) from blinkit_data

select SUM(Sales) as Total_Sales From blinkit_data
-- but i want my total sales in millions 
select CAST(SUM(Sales)/1000000 as decimal(10,2)) as Total_Sales From blinkit_data

select CONCAT(CAST(SUM(Sales)/1000000 as decimal(10,2)),'M') as Total_Sales From blinkit_data

select round(avg(Sales),2) as Avg_Sales from blinkit_data

select count(Item_Fat_Content) as Total_Count from blinkit_data

select CONCAT(CAST(SUM(Sales)/1000000 as decimal(10,2)),'M') as Total_Sales From blinkit_data
where Item_Fat_Content='Low Fat';

select CONCAT(CAST(SUM(Sales)/1000000 as decimal(10,2)),'M') as Total_Sales From blinkit_data
where Item_Fat_Content='Regular';


select distinct(Outlet_Establishment_Year) from blinkit_data

select CONCAT(CAST(SUM(Sales)/1000000 as decimal(10,2)),'M') as Total_Sales From blinkit_data
where Outlet_Establishment_Year=2011;

select CONCAT(CAST(SUM(Sales)/1000000 as decimal(10,2)),'M') as Total_Sales From blinkit_data
where Outlet_Establishment_Year=2012;
select CONCAT(CAST(SUM(Sales)/1000000 as decimal(10,2)),'M') as Total_Sales From blinkit_data
where Outlet_Establishment_Year=2014;
select CONCAT(CAST(SUM(Sales)/1000000 as decimal(10,2)),'M') as Total_Sales From blinkit_data
where Outlet_Establishment_Year=2015;
select CONCAT(CAST(SUM(Sales)/1000000 as decimal(10,2)),'M') as Total_Sales From blinkit_data
where Outlet_Establishment_Year=2016;
select CONCAT(CAST(SUM(Sales)/1000000 as decimal(10,2)),'M') as Total_Sales From blinkit_data
where Outlet_Establishment_Year=2017;
select CONCAT(CAST(SUM(Sales)/1000000 as decimal(10,2)),'M') as Total_Sales From blinkit_data
where Outlet_Establishment_Year=2018;
select CONCAT(CAST(SUM(Sales)/1000000 as decimal(10,2)),'M') as Total_Sales From blinkit_data
where Outlet_Establishment_Year=2020;
select CONCAT(CAST(SUM(Sales)/1000000 as decimal(10,2)),'M') as Total_Sales From blinkit_data
where Outlet_Establishment_Year=2022


SELECT 
  Outlet_Establishment_Year,
  CONCAT(CAST(SUM(Sales)/1000000 AS DECIMAL(10,2)), 'M') AS Total_Sales_Million
FROM blinkit_data
WHERE Outlet_Establishment_Year IN (2011, 2012, 2014, 2015, 2016, 2017, 2018, 2020, 2022)
GROUP BY Outlet_Establishment_Year
ORDER BY Outlet_Establishment_Year;


select round(avg(Rating),1) as Avg_Rating from blinkit_data

SELECT 
  Item_Fat_Content,
  CONCAT(CAST(SUM(Sales)/1000000 AS DECIMAL(10,2)), 'M') AS Total_Sales_Million
FROM blinkit_data
WHERE Item_Fat_Content IN ('Low Fat','Regular')
GROUP BY Item_Fat_Content
ORDER BY Item_Fat_Content;

SELECT 
  Item_Fat_Content,
  count(Item_Type) AS Total_Count
FROM blinkit_data
WHERE Item_Fat_Content IN ('Low Fat','Regular')
GROUP BY Item_Fat_Content
ORDER BY Item_Fat_Content;


SELECT 
  Item_Fat_Content,
  count(*) as Total_Count,
  concat(ROUND(sum(Sales)/1000000,2),'M')as Total_Sales,
  Round(Avg(Sales),2) AS Avg_Sales,
  Round(AVG(Rating),1) as Avg_Rating
FROM blinkit_data
GROUP BY Item_Fat_Content
ORDER BY Avg_Sales;



SELECT 
  Outlet_Establishment_Year,
  count(*) as Total_Count,
  concat(ROUND(sum(Sales)/1000000,2),'M')as Total_Sales,
  Round(Avg(Sales),2) AS Avg_Sales,
  Round(AVG(Rating),1) as Avg_Rating
FROM blinkit_data
WHERE Outlet_Establishment_Year IN (2011, 2012, 2014, 2015, 2016, 2017, 2018, 2020, 2022)
GROUP BY Outlet_Establishment_Year
ORDER BY Outlet_Establishment_Year;


SELECT Top 5
  Item_Type,
  count(*) as Total_Count,
  concat(ROUND(sum(Sales)/1000,2),'K')as Total_Sales,
  Round(Avg(Sales),2) AS Avg_Sales,
  Round(AVG(Rating),1) as Avg_Rating
FROM blinkit_data
GROUP BY Item_Type
ORDER BY Total_Count desc;

SELECT 
  Outlet_Location_Type,Item_Fat_Content,
  count(*) as Total_Count,
  concat(ROUND(sum(Sales)/1000,2),'K')as Total_Sales,
  Round(Avg(Sales),2) AS Avg_Sales,
  Round(AVG(Rating),1) as Avg_Rating
FROM blinkit_data
GROUP BY Outlet_Location_Type,Item_Fat_Content
ORDER BY Total_Sales desc;

SELECT
  Outlet_Location_Type,

  CONCAT(ROUND(SUM(CASE 
    WHEN Item_Fat_Content='Low Fat' THEN Sales 
    ELSE 0 END) / 1000, 2), 'K') AS Low_Fat_Sales,

  CONCAT(ROUND(SUM(CASE 
    WHEN Item_Fat_Content = 'regular' THEN Sales 
    ELSE 0 END) / 1000, 2), 'K') AS Regular_Sales

FROM blinkit_data
WHERE Outlet_Location_Type IN ('Tier 1', 'Tier 2', 'Tier 3')
GROUP BY Outlet_Location_Type
ORDER BY Outlet_Location_Type;



select * from blinkit_data
SELECT 
  Outlet_Establishment_Year,
  count(*) as Total_Count,
  concat(ROUND(sum(Sales)/1000,2),'K')as Total_Sales,
  Round(Avg(Sales),2) AS Avg_Sales,
  Round(AVG(Rating),1) as Avg_Rating
FROM blinkit_data
WHERE Outlet_Establishment_Year IN (2011, 2012, 2014, 2015, 2016, 2017, 2018, 2020, 2022)
GROUP BY Outlet_Establishment_Year
ORDER BY Outlet_Establishment_Year;



SELECT 
  Outlet_Size,
  count(*) as Total_Count,
  concat(ROUND(sum(Sales)/1000,2),'K')as Total_Sales,
  Round(Avg(Sales),2) AS Avg_Sales,
  Round(AVG(Rating),1) as Avg_Rating
FROM blinkit_data
GROUP BY Outlet_Size
ORDER BY Outlet_Size desc;

select * from blinkit_data

SELECT 
  Outlet_Type,
  count(*) as Total_Count,
  concat(ROUND(sum(Sales)/1000,2),'K')as Total_Sales,
  Round(Avg(Sales),2) AS Avg_Sales,
  Round(AVG(Rating),1) as Avg_Rating
FROM blinkit_data
GROUP BY Outlet_Type
ORDER BY Outlet_Type ;


SELECT 
  Outlet_Size,
  count(*) as Total_Count,
  concat(ROUND(sum(Sales)/1000,2),'K')as Total_Sales,
  Round(Avg(Sales),2) AS Avg_Sales,
  Round(AVG(Rating),1) as Avg_Rating,
  concat(ROUND(SUM(Sales)*100/sum(sum(Sales)) over(),2),'%') AS Total_Sales_Percentage
FROM blinkit_data
GROUP BY Outlet_Size
ORDER BY Total_Sales desc;


SELECT 
  Outlet_Type,
  count(*) as Total_Count,
  concat(ROUND(sum(Sales)/1000,2),'K')as Total_Sales,
  Round(Avg(Sales),2) AS Avg_Sales,
  Round(AVG(Rating),2) as Avg_Rating
FROM blinkit_data
GROUP BY Outlet_Type
ORDER BY Outlet_Type ;
