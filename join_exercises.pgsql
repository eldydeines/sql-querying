--Eldy Deines 
--SQL Join Exercises
--Join the two tables so that every column and record 
--appears, regardless of if there is not an owner_id.

SELECT *
FROM owners
FULL JOIN vehicles
ON owners.id = vehicles.owner_id;

--Count the number of cars for each owner. 
--Display the owners first_name, last_name and 
--count of vehicles. The first_name 
--should be ordered in ascending order. 
SELECT first_name, last_name, count(vehicles.model) AS count_of_vehicles
FROM vehicles
LEFT JOIN owners
ON owners.id = vehicles.owner_id
GROUP BY first_name, last_name
ORDER BY first_name;

--Count the number of cars for each owner and display the average 
--price for each of the cars as integers.  Display the owner's first
--and last name, average price and count of vehicles. Order by first
--name descending. Only display results with more than one vehicle
--and an average price greater than 10000
SELECT first_name, last_name, Cast(AVG(price) as INTEGER), count(vehicles.model)
FROM vehicles
LEFT JOIN owners
ON owners.id = vehicles.owner_id
GROUP BY first_name, last_name
HAVING count(vehicles.model) > 1 AND AVG(price) > 10000
ORDER BY first_name desc;
    
