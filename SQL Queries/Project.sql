create database Final_Project;
use Final_Project;

select * from transportation_schedule;

-- Your SQL Task:
-- 1.	List all trips operated by 'MetroTrans'.
select trip_id, origin, destination, departure_time, operator from 
transportation_schedule  where operator =  'MetroTrans';
select *, trip_id, operator from transportation_schedule  where operator =  'MetroTrans';

-- 2.	Find the number of trips per operator.

select operator, count(trip_id) 
as Number_of_Trips 
from transportation_schedule 
group by operator;

-- 3.	Identify the most common route.
 SELECT route, bus_stop, COUNT(*) AS common_route
 FROM transportation_schedule 
 GROUP BY route, bus_stop
 ORDER BY common_route desC
LIMIT 1;

-- 4.	Get trips that originated from 'Abuja' and went to 'Lagos'.
SELECT trip_id, operator, origin, destination
FROM transportation_schedule 
WHERE origin = 'Abuja' AND destination = 'Lagos';

-- 5.	Find the earliest departure and latest arrival times per route.
SELECT route, MIN(departure_time) AS earliest_departure, 
MAX(arrival_time) AS latest_arrival
FROM transportation_schedule 
GROUP BY route;

-- 6.	Count how many trips occurred on each date.
 SELECT DATE(trip_date) AS trip_day, COUNT(*) AS trip_count
FROM transportation_schedule 
 GROUP BY trip_date
 ORDER BY trip_count DESC;
 
 alter table transportation_schedule modify trip_date date;
 update transportation_schedule set trip_date = str_to_date(trip_date, '%m/%d/%Y');
 set sql_safe_updates = 0;

-- 7.	Group trips by operator and show average departure time.
SELECT operator, round(avg(departure_time),2) AS average_departure
FROM transportation_schedule 
GROUP BY operator;

SELECT 
 operator,
 SEC_TO_TIME(round(AVG(TIME_TO_SEC(departure_time)))) AS avg_departure_time
 FROM transportation_schedule
GROUP BY operator
ORDER BY operator;

-- 8.	Use RANK() to rank operators by number of trips.

SELECT 
operator,
COUNT(*) AS  number_of_trips,
RANK() OVER (ORDER BY COUNT(*) DESC) AS rnk
FROM transportation_schedule
GROUP BY operator
ORDER BY rnk;

-- 9.	Identify trips where origin and destination are in the same state (you can modify schema).
 
 SELECT trip_id, route, operator, origin, destination_2
FROM transportation_schedule 
WHERE origin = destination_2;

alter table transportation_schedule add column destination_2 text;
update transportation_schedule set destination_2 = 'Abuja';



select * FROM transportation_schedule;

-- 10.	Find operators that serve more than 2 unique routes.

SELECT 
  operator, 
  COUNT(DISTINCT (route)) AS unique_routes
FROM transportation_schedule
GROUP BY operator
HAVING COUNT(DISTINCT (route)) > 2;


 SELECT Origin, Destination, count(distinct Origin) as Total_Origin, count(distinct destination) as Total_Des 
 FROM transportation_schedule group by Origin, Destination;

-- What are your Recommendations based on the Insights gotten?

