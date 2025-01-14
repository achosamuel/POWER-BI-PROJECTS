/*
Data cleaning stepss
1. Remove unnecessary columns
2. Extract the youtubers name
3. rename column
*/

CREATE VIEW Top_Youtubers_View AS
SELECT CAST(SUBSTRING(NOMBRE,1,CHARINDEX('@',NOMBRE)-1) as varchar(100)) AS Chanel_Name,
	total_views,
	total_subscribers,
	total_videos
FROM TOP_youtubers

select* from Top_Youtubers_View

/*
#Data quality tests

1. The data needs to be 100 records of Youtubes Channels (row count test)
2.The Data needs 4 fields (column count test)
3.The channel name column must be string format, and the other columns must be numerical data types (data type check)
4.Each record must be unique in the dataset (duplicate count check)

Row count - 100
Column count - 4

Data type

Channel_name = VARCHAR
Total_views = interger
total subscribers = interger
total_videos = interger

Duplicate count = 0
*/

--Count rows check
select COUNT(*) as Row_count
from top_youtubers_view

--Column count check 
SELECT COUNT(*) as column_count 
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'top_youtubers_view'

-- Date type
SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'top_youtubers_view'

-- Duplicate
SELECT Chanel_name,
	Count(*) as Duplicate_count
FROM top_youtubers_view
GROUP BY Chanel_name
HAVING Count(*) > 1