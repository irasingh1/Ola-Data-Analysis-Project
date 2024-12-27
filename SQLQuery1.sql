

#1. Retrieve all successful bookings:
Create View Successful_Bookings As
SELECT * FROM bookings 
WHERE Booking_Status = 'Success';

Select * From Successful_Bookings;

#2. Find the average ride distance for each vehicle type:
ALTER TABLE bookings
ALTER COLUMN Ride_Distance FLOAT;

Create View ride_distance_for_each_vehicle As
SELECT Vehicle_Type, AVG(Ride_Distance) 
as avg_distance FROM bookings 
GROUP BY Vehicle_Type;

Select * from ride_distance_for_each_vehicle;

#3. Get the total number of cancelled rides by customers:
Create View canceled_rides_by_customers As
SELECT COUNT(*) AS canceled_count
FROM bookings
WHERE Booking_Status = 'canceled by Customer';
Select * from canceled_rides_by_customers;#4. List the top 5 customers who booked the highest number of rides:Create View top_5_customers AsSELECT TOP 5 Customer_ID, COUNT(Booking_ID) AS total_rides
FROM bookings
GROUP BY Customer_ID
ORDER BY total_rides DESC;

Select * from top_5_customers;


#5. Get the number of rides cancelled by drivers due to personal and car-related issues:

Create View Rides_canceled_by_drivers_P_C_Issues As
SELECT COUNT(*) As Rides_canceled_count
FROM bookings WHERE Canceled_Rides_by_Driver = 'Personal & Car related issue';
#6. Find the maximum and minimum driver ratings for Prime Sedan bookings:Create View Max_Min_Driver_Rating AsSELECT MAX(Driver_Ratings) as max_rating, MIN(Driver_Ratings) as min_rating FROM
bookings WHERE Vehicle_Type = 'Prime Sedan';

#7. Retrieve all rides where payment was made using UPI:
Create View UPI_Payment As
SELECT * FROM bookingsWHERE Payment_Method = 'UPI';#8. Find the average customer rating per vehicle type:CREATE VIEW AVG_Customer_Rating AS
SELECT Vehicle_Type, AVG(CAST(Customer_Rating AS FLOAT)) AS avg_customer_rating
FROM bookings
WHERE ISNUMERIC(Customer_Rating) = 1
GROUP BY Vehicle_Type;
#9. Calculate the total booking value of rides completed successfully:
Create View total_successful_ride_value As
SELECT SUM(Booking_Value) as total_successful_ride_value FROM bookings WHERE
Booking_Status = 'Success';#10. List all incomplete rides along with the reason:Create View Incomplete_Rides_Reason AsSELECT Booking_ID, Incomplete_Rides_Reason 
FROM bookings 
WHERE Incomplete_Rides ='Yes';


#1. Retrieve all successful bookings:
Select * From Successful_Bookings;

#2. Find the average ride distance for each vehicle type:
Select * from ride_distance_for_each_vehicle;

#3. Get the total number of cancelled rides by customers:
Select * from canceled_rides_by_customers;

#4. List the top 5 customers who booked the highest number of rides:
Select * from Top_5_Customers;

#5. Get the number of rides cancelled by drivers due to personal and car-related issues:
Select * from Rides_canceled_by_Drivers_P_C_Issues;

#6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
Select * from Max_Min_Driver_Rating;

#7. Retrieve all rides where payment was made using UPI:
Select * from UPI_Payment;

#8. Find the average customer rating per vehicle type:
Select * from AVG_Customer_Rating;

#9. Calculate the total booking value of rides completed successfully:
Select * from total_successful_ride_value;

#10. List all incomplete rides along with the reason:
Select * from Incomplete_Rides_Reason;