-- CREATE DATABASE ola;
USE ola;

select * from ola_data;
alter table ola_data
rename column `ï»¿Date` to `Date`;
show create table ola_data;


-- 1. Retrieve all successful bookings:
select * from ola_data
where Booking_Status = 'success';

-- 2. Find the average ride distance for each vehicle type:
select Vehicle_Type, round(avg(Ride_Distance),2) as AVG_Ride_Distance
from ola_data
group by Vehicle_Type
order by 2;

-- 3. Get the total number of cancelled rides by customers:
select count(*) AS Cancelled_Rides
from ola_data
where Booking_Status = 'Canceled by Customer';

-- 4. List the top 5 customers who booked the highest number of rides:
select Customer_ID, count(Booking_ID)
from ola_data
group by 1
order by 2 desc
limit 5;

-- 5. Get the number of rides cancelled by drivers due to personal and car-related issues:
select count(*) AS cancelled_by_drivers
from ola_data AS cancelled_by_drivers
where Canceled_Rides_by_Driver = 'Personal & Car related issue';

-- 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
select min(Driver_Ratings) as Min_Rating, max(Driver_Ratings) as Max_Rating 
from ola_data
where Vehicle_Type = 'Prime Sedan';

-- 7. Retrieve all rides where payment was made using UPI
select * from ola_data
where Payment_Method = 'UPI';

-- 8. Find the average customer rating per vehicle type:
select Vehicle_Type, round(avg(Customer_Rating),2) as AVG_Customer_Rating
from ola_data
group by Vehicle_Type
order by 2;

-- 9. Calculate the total booking value of rides completed successfully:
select sum(Booking_Value) AS Total_Booking_Value
from ola_data
where Booking_Status = 'success';

-- 10. List all incomplete rides along with the reason:
select Booking_ID as Cancelled_Booked_id, Incomplete_Rides_Reason As Reason
from ola_data
where Incomplete_Rides = 'Yes';