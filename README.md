# Transportation-Schedule
This project presents a comprehensive Transportation Schedule Data Analysis performed using SQL and Power BI. The dashboard visualizes key performance insights across multiple bus operators, routes, stops, and travel times to support operational efficiency and decision-making.

# Transportation Schedule Data Analysis Insight

This project analyzes transportation trip data to uncover insights into operator performance, trip frequency, route coverage, and scheduling patterns using **SQL** and **Power BI**.

## Project Overview

The goal of this project was to analyze a transportation schedule dataset containing information about bus trips, operators, routes, and departure times.

Using **SQL** (MySQL) and **Power BI**, the analysis answers key business questions such as:

* Which operator handles the most trips?
* What are the earliest and latest trip times?
* Which routes are most common?
* How do operators rank by performance metrics like number of trips or route coverage?

---

## Tools & Technologies

* **SQL (MySQL Workbench)** – For data querying and transformation.
* **Power BI** – For visualization and dashboard creation.
* **Excel/CSV** – For dataset preparation.

---

## 🗂️ SQL Analysis Tasks

The SQL script (`Project.sql`) contains the following analytical queries:

1. **List all trips operated by MetroTrans**

   ```sql
   SELECT trip_id, origin, destination, departure_time, operator
   FROM transportation_schedule
   WHERE operator = 'MetroTrans';
   ```

2. **Find the number of trips per operator**

   ```sql
   SELECT operator, COUNT(trip_id) AS Number_of_Trips
   FROM transportation_schedule
   GROUP BY operator;
   ```

3. **Identify the most common route**

   ```sql
   SELECT route, bus_stop, COUNT(*) AS common_route
   FROM transportation_schedule
   GROUP BY route, bus_stop
   ORDER BY common_route DESC
   LIMIT 1;
   ```

4. **Get trips from Abuja to Lagos**

   ```sql
   SELECT trip_id, operator, origin, destination
   FROM transportation_schedule
   WHERE origin = 'Abuja' AND destination = 'Lagos';
   ```

5. **Find earliest departure and latest arrival times per route**

   ```sql
   SELECT route, MIN(departure_time) AS earliest_departure,
          MAX(arrival_time) AS latest_arrival
   FROM transportation_schedule
   GROUP BY route;
   ```

6. **Count how many trips occurred on each date**

   ```sql
   SELECT DATE(trip_date) AS trip_day, COUNT(*) AS trip_count
   FROM transportation_schedule
   GROUP BY trip_date
   ORDER BY trip_count DESC;
   ```

7. **Average departure time per operator**

   ```sql
   SELECT operator,
          SEC_TO_TIME(ROUND(AVG(TIME_TO_SEC(departure_time)))) AS avg_departure_time
   FROM transportation_schedule
   GROUP BY operator;
   ```

8. **Rank operators by number of trips**

   ```sql
   SELECT operator, COUNT(*) AS number_of_trips,
          RANK() OVER (ORDER BY COUNT(*) DESC) AS rnk
   FROM transportation_schedule
   GROUP BY operator;
   ```

9. **Identify trips with the same origin and destination**

   ```sql
   SELECT trip_id, route, operator, origin, destination_2
   FROM transportation_schedule
   WHERE origin = destination_2;
   ```

10. **Find operators with more than two unique routes**

    ```sql
    SELECT operator, COUNT(DISTINCT(route)) AS unique_routes
    FROM transportation_schedule
    GROUP BY operator
    HAVING COUNT(DISTINCT(route)) > 2;
    ```

---

## Power BI Dashboard Insights

The Power BI dashboard visualizes results from the SQL queries, providing interactive insights such as:

* **Total Trips:** 200
* **Operators Analyzed:** 4
* **Unique Routes:** 16
* **Top Operator by Trips:** MetroTrans
* **Average Departure Time per Operator**
* **Earliest & Latest Trips per Route**
* **Trips by Bus Stop & Route**
* **Operator Ranking (by Trip Count & Coverage)**

---

## Recommendations

* **Optimize Scheduling:** Routes with late arrivals can be reviewed for time adjustments.
* **Balance Operator Load:** MetroTrans operates the most trips — consider redistributing to maintain efficiency.
* **Expand Coverage:** Operators with fewer unique routes (like CityRide) can explore underserved routes.
* **Peak Time Analysis:** Further analysis can identify high-demand time slots for route optimization.

---

## Files Included

| File           | Description                                          |
| -------------- | ---------------------------------------------------- |
| `Project.sql`  | SQL script containing all queries used for analysis. |
| `Power BI.png` | Screenshot of the Power BI dashboard visualization.  |
| `README.md`    | Documentation explaining the entire project.         |

---

## How to Use

1. Import the dataset into **MySQL Workbench**.
2. Run `Project.sql` to execute all analytical queries.
3. Export results (if needed) to **Power BI**.
4. Build or explore the dashboard to visualize insights.

---

## 👨‍💻 Author

**Nene Perpetual Okogo**
📧okogonene11@gmail.com
Data Analyst — Excel | SQL | Power BI | Python | Tableau
📍 Abuja, Nigeria
