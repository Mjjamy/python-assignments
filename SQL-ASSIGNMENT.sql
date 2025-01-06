###SQL BASICS ASSIGNMENT

#1. Create a table called employees with the following structure?
#emp_id (integer, should not be NULL and should be a primary key)Q
#emp_name (text, should not be NULL)Q
#age (integer, should have a check constraint to ensure the age is at least 18)Q
#email (text, should be unique for each employee)Q
#salary (decimal, with a default value of 30,000).

#Write the SQL query to create the above table with all constraints.
CREATE TABLE employees (
    emp_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    emp_name TEXT NOT NULL,
    age INT NOT NULL CHECK (age >= 18),
    email TEXT NOT NULL,
    salary DECIMAL(10, 2) DEFAULT 30000.00,
    UNIQUE (email(255))
);

#2- Explain the purpose of constraints and how they help maintain data integrity in a database. Provide
#examples of common types of constraints.
#Ans- Purpose of Constraints:
#Constraints in a database are rules applied to table columns to ensure data accuracy, consistency, and reliability.

#Common Types of Constraints:
#Primary Key:
#Ensures each row in a table is unique and has a valid identifier.
#Example: emp_id in an employees table.

#Unique:
#Prevents duplicate values in a column.
#Example: Employee email addresses must be unique.

#Not Null:
#Ensures a column cannot have NULL values.
#Example: Employee names cannot be left blank.

#Check:
#Validates data based on a specific condition.
#Example: age >= 18 ensures only valid age values are entered.

#Default:
#Assigns a default value if no value is provided.
#Example: salary DEFAULT 30000 ensures a min salary is recorded

#3-Why would you apply the NOT NULL constraint to a column? Can a primary key contain NULL values? Justify
#your answer.
#ANS-NOT NULL Constraint: Ensures a column always has a value, preventing missing or incomplete data.
# For example, an employee name must not be empty.

#Primary Key and NULL: A primary key cannot contain NULL values because it uniquely identifies each row, and NULL means unknown,
# which would break uniqueness and reliability.

#4-. Explain the steps and SQL commands used to add or remove constraints on an existing table. Provide an
#example for both adding and removing a constraint
#ANS-Adding a Constraint: Use the ALTER TABLE command to modify the table and add a constraint.
#Example: Add a NOT NULL constraint to the age column:
ALTER TABLE employees MODIFY age INT NOT NULL;

#Removing a Constraint: Use the ALTER TABLE command to drop the constraint.
#Example: Remove the UNIQUE constraint from the email column
ALTER TABLE employees DROP INDEX email;

#5- Explain the consequences of attempting to insert, update, or delete data in a way that violates constraints.
#Provide an example of an error message that might occur when violating a constraint.
#ANS-Insert/Update Violation: The database rejects the operation, ensuring data integrity.
#Example: Trying to insert a NULL value in a NOT NULL column results in an error.

#Delete Violation: If a record is linked through a FOREIGN KEY,
 #deleting it causes an error unless cascading rules are defined.

#Example Error Message:
#Trying to insert a duplicate value in a UNIQUE column:
#ERROR 1062: Duplicate entry 'example@example.com' for key 'email'

#6- You created a products table without constraints as follows:

CREATE TABLE products (

    product_id INT,

    product_name VARCHAR(50),

    price DECIMAL(10, 2));
#Now, you realise that?
#: The product_id should be a primary key
#: The price should have a default value of 50.00

#ANS-ADD product_id as primary key
ALTER TABLE products 
ADD PRIMARY KEY (product_id);

#. Add Default Value for price:
ALTER TABLE products 
ALTER COLUMN price set default 50.00;

#7-Write a mysql query to fetch the student_name and class_name for each student using an INNER JOIN
SELECT Students.student_name, Classes.class_name
FROM Students
INNER JOIN Classes
ON Students.class_id = Classes.class_id;

#8-Write a query that shows all order_id, customer_name, and product_name, ensuring that all products are
#listed even if they are not associated with an order 

#Hint: (use INNER JOIN and LEFT JOIN)
SELECT Orders.order_id, Customers.customer_name, Products.product_name
FROM Products
LEFT JOIN Orders 
ON Products.order_id = Orders.order_id
LEFT JOIN Customers 
ON Orders.customer_id = Customers.customer_id;

#9-Write a query to find the total sales amount for each product using an INNER JOIN and the SUM() function.
SELECT Products.product_name, SUM(Sales.amount) AS total_sales
FROM Sales INNER JOIN Products
ON Sales.product_id = Products.product_id
GROUP BY Products.product_name;

#10-Write a query to display the order_id, customer_name, and the quantity of products ordered by each
#customer using an INNER JOIN between all three tables.

###SQL COMMANDS
#1-Identify the primary keys and foreign keys in maven movies db. Discuss the differences
#ANS-
#comparison
#Primary Key (PK)	
#Uniquely identifies each record in a table.	
#Must be unique and cannot contain NULL values.
#Does not depend on other tables.	

#Foreign Key (FK)
#Links one table to another .
#Can have duplicate and NULL values.
#Always references a primary key in another table

#2-- List all details of actors
#ANS-
SELECT * FROM actor;

#3-List all customer information from DB.
#ans-
SELECT *from customer;

#4--List different countries.
#ans-
SELECT* from country;

#5-Display all active customers.
SELECT *FROM customer
WHERE active = 1;

#6-List of all rental IDs for customer with ID 1
select* from rental;
SELECT rental_id
FROM rental
WHERE customer_id = 1;

#7-Display all the films whose rental duration is greater than 5 .
SELECT * FROM film
WHERE rental_duration > 5;

#8-List the total number of films whose replacement cost is greater than $15 and less than $20.
SELECT *FROM film
WHERE replacement_cost > 15 AND replacement_cost < 20;

#9- Display the count of unique first names of actors
select* from actor;
SELECT COUNT(DISTINCT first_name) AS un_1stname
FROM actor;

#10-- Display the first 10 records from the customer table 
SELECT * FROM customer
LIMIT 10;

#11-Display the first 3 records from the customer table whose first name starts with ‘b’.
SELECT * FROM customer
WHERE first_name LIKE 'b%'
LIMIT 3;

#12--Display the names of the first 5 movies which are rated as ‘G’.
select * from film;
SELECT * FROM film
WHERE rating = 'G'
LIMIT 5;

#13-Find all customers whose first name starts with "a
SELECT * FROM customer
WHERE first_name LIKE 'a%';

#14-- Find all customers whose first name ends with "a".
SELECT * FROM customer
WHERE first_name LIKE '%a';

#15-Display the list of first 4 cities which start and end with ‘a’ 
SELECT * FROM city
WHERE city LIKE 'a%a'
LIMIT 4;

#16- Find all customers whose first name have "NI" in any position.
SELECT * FROM customer
WHERE first_name LIKE '%NI%';

#17- Find all customers whose first name have "r" in the second position 
SELECT * FROM customer
WHERE first_name LIKE '_r%';

#18- Find all customers whose first name starts with "a" and are at least 5 characters in length
SELECT * FROM customer
WHERE first_name LIKE 'a%' AND CHAR_LENGTH(first_name) >= 5;

#19-Find all customers whose first name starts with "a" and ends with "o".
SELECT * FROM customer
WHERE first_name LIKE 'a%o';

#20-Get the films with pg and pg-13 rating using IN operator
SELECT * FROM film
WHERE rating IN ('PG', 'PG-13');

#21-Get the films with length between 50 to 100 using between operator
SELECT *FROM film
WHERE length BETWEEN 50 AND 100;

#22- Get the top 50 actors using limit operator
SELECT * FROM actor
LIMIT 50;

#23- Get the distinct film ids from inventory table
select* from inventory;
SELECT DISTINCT film_id
FROM inventory;

###BASIC AGGREGATE FUNCTIONS
#1-Retrieve the total number of rentals made in the Sakila database.
#Hint: Use the COUNT() function.
use mavenmovies;
SELECT COUNT(rental_id) AS total_rentals
FROM rental;

#2-Find the average rental duration (in days) of movies rented from the Sakila database.
#Hint: Utilize the AVG() function
select *from film;
SELECT AVG(rental_duration) AS avg_rentdur
FROM film;

#3-Display the first name and last name of customers in uppercase.
#Hint: Use the UPPER () function.
SELECT UPPER(first_name) AS fname_uppercase, 
UPPER(last_name) AS lname_uppercase
FROM customer;

#4-Extract the month from the rental date and display it alongside the rental ID.
#Hint: Employ the MONTH() function.
select* from rental;
SELECT rental_id, MONTH(rental_date) AS rental_month
FROM rental;

#5-Retrieve the count of rentals for each customer (display customer ID and the count of rentals).
#Hint: Use COUNT () in conjunction with GROUP BY.
select* from rental;
SELECT customer_id, COUNT(rental_id) AS rental_count
FROM rental
GROUP BY customer_id;

#6-Find the total revenue generated by each store.
#Hint: Combine SUM() and GROUP BY
select * from payment;
SELECT staff_id, SUM(amount) AS total_revenue
FROM payment
GROUP BY staff_id;

#7-Determine the total number of rentals for each category of movies.
#Hint: JOIN film_category, film, and rental tables, then use cOUNT () and GROUP BY.
select*from category;
select*from film_category;
select*from inventory;
select*from rental;
SELECT c.name AS category_name, COUNT(r.rental_id) AS total_rentals
FROM category c
JOIN film_category fc ON c.category_id = fc.category_id
JOIN inventory i ON fc.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY c.name;

#8-Find the average rental rate of movies in each language.
#Hint: JOIN film and language tables, then use AVG () and GROUP BY.
select * from language;
select* from film;
SELECT l.name AS language_name, AVG(f.rental_rate) AS avgrental_rate
FROM film f
JOIN language l ON f.language_id = l.language_id
GROUP BY l.name;

###JOINS
#9-Display the title of the movie, customer s first name, and last name who rented it.
#Hint: Use JOIN between the film, inventory, rental, and customer tables.
select*from film;
select*from customer;
select *from rental;
select* from inventory;

SELECT f.title AS movie_title, 
c.first_name AS customer_first_name, 
c.last_name AS customer_last_name
FROM rental r
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
JOIN customer c ON r.customer_id = c.customer_id;

#10-Retrieve the names of all actors who have appeared in the film "Gone with the Wind."
#Hint: Use JOIN between the film actor, film, and actor tables.
select* from actor;
select*from film_actor;
select* from film;

SELECT a.first_name, a.last_name
FROM actor a
JOIN film_actor fa ON a.actor_id = fa.actor_id
JOIN film f ON fa.film_id = f.film_id
WHERE f.title = 'Gone with the Wind';

#11-Retrieve the customer names along with the total amount they've spent on rentals.
#Hint: JOIN customer, payment, and rental tables, then use SUM() and GROUP BY.
select* from customer;
select*from payment;
select* from rental;

SELECT c.first_name AS customer_first_name, 
c.last_name AS customer_last_name, 
SUM(p.amount) AS total_spent

FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name;

#12-List the titles of movies rented by each customer in a particular city (e.g., 'London').
#Hint: JOIN customer, address, city, rental, inventory, and film tables, then use GROUP BY
select*from customer;
select*from address;
select* from city;
select*from rental;
select*from inventory;
select*from film;
SELECT c.first_name AS customer_first_name, 
       c.last_name AS customer_last_name, 
       ci.city AS customer_city, 
       f.title AS movie_title
       
FROM customer c 
JOIN address a ON c.address_id = a.address_id
JOIN city ci ON a.city_id = ci.city_id
JOIN rental r ON c.customer_id = r.customer_id
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
WHERE ci.city = 'London'
GROUP BY c.customer_id, f.title;

###ADVANCED JOINS AND GROUP BY
#13-Display the top 5 rented movies along with the number of times they've been rented.
#Hint: JOIN film, inventory, and rental tables, then use COUNT () and GROUP BY, and limit the results.

select*from film;
select*from inventory;
select*from rental;

SELECT f.title AS movie_title, 
COUNT(r.rental_id) AS times_rented
FROM film f

JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY f.title
ORDER BY times_rented DESC
LIMIT 5;

#14-Determine the customers who have rented movies from both stores (store ID 1 and store ID 2).
#Hint: Use JOINS with rental, inventory, and customer tables and consider COUNT() and GROUP BY.

###WINDOWS FUNCTION
#1- Rank the customers based on the total amount they've spent on rentals.
select* from customer;
select* from payment;
SELECT c.customer_id, c.first_name, c.last_name, 
SUM(p.amount) AS total_spent,
RANK() OVER (ORDER BY SUM(p.amount) DESC) AS customer_rank
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY total_spent DESC;

#2- Calculate the cumulative revenue generated by each film over time.
select*from film;
select*from inventory;
select* from rental;
select* from payment;

SELECT f.title AS film_title,p.payment_date,
SUM(p.amount) OVER (PARTITION BY f.film_id ORDER BY p.payment_date) AS cumulative_revenue
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
JOIN payment p ON r.rental_id = p.rental_id
ORDER BY f.title, p.payment_date;

#3- Determine the average rental duration for each film, considering films with similar lengths
select* from film;
select* from inventory;
select* from rental;

SELECT f.length AS film_length, f.title AS film_title, 
AVG(r.rental_duration) AS avg_rental_duration
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY f.length, f.title
ORDER BY f.length, f.title;

#4-Identify the top 3 films in each category based on their rental counts.

#5 Calculate the difference in rental counts between each customer's total rentals and the average rentals
#across all customers.

#6- Find the monthly revenue trend for the entire rental store over time
SELECT YEAR(payment_date) AS year, 
MONTH(payment_date) AS month, 
SUM(amount) AS total_revenue
FROM payment
GROUP BY YEAR(payment_date), MONTH(payment_date)
ORDER BY year, month;

#7- Identify the customers whose total spending on rentals falls within the top 20% of all customers

#8-Calculate the running total of rentals per category, ordered by rental count

#9- Find the films that have been rented less than the average rental count for their respective categories.

#10- Identify the top 5 months with the highest revenue and display the revenue generated in each month

SELECT YEAR(payment_date) AS year, 
MONTH(payment_date) AS month, 
SUM(amount) AS total_revenue
FROM payment
GROUP BY year, month
ORDER BY total_revenue DESC
LIMIT 5;


























































