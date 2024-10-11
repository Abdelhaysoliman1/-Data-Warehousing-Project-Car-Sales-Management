-- Create Database
CREATE DATABASE CarSalesManagement;
USE CarSalesManagement;

-- Create Dimension Tables
CREATE TABLE Car (
    car_id INT PRIMARY KEY,
    model NVARCHAR(50),
    manufacturer NVARCHAR(50),
    category NVARCHAR(50),
    price DECIMAL(10, 2),
    year INT,
    color NVARCHAR(50)
);

CREATE TABLE Customer (
    customer_id INT PRIMARY KEY,
    first_name NVARCHAR(50),
    last_name NVARCHAR(50),
    gender NVARCHAR(10),
    age INT,
    email NVARCHAR(100),
    phone NVARCHAR(20)
);

CREATE TABLE Time (
    time_id INT PRIMARY KEY,
    date DATE,
    day INT,
    month INT,
    quarter INT,
    year INT,
    day_of_week NVARCHAR(10)
);

CREATE TABLE Dealer (
    dealer_id INT PRIMARY KEY,
    dealer_name NVARCHAR(100),
    location NVARCHAR(100),
    contact_number NVARCHAR(20)
);

-- Create Facts Table name is selas
CREATE TABLE sss (
    sale_id INT PRIMARY KEY,
    car_id INT,
    customer_id INT,
    time_id INT,
	dealer_id INT,
    sales_amount DECIMAL(10, 2),
    quantity_sold INT,
    discount_applied DECIMAL(10, 2),
    FOREIGN KEY (car_id) REFERENCES Car(car_id),
	FOREIGN KEY (dealer_id) REFERENCES Dealer(dealer_id),
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
    FOREIGN KEY (time_id) REFERENCES Time(time_id)
);

-- Insert Data into Dimension Tables

-- Inserting 20 records into Car table
INSERT INTO Car VALUES
(1, 'Toyota Camry', 'Toyota', 'Sedan', 25000.00, 2022, 'Red'),
(2, 'Honda Accord', 'Honda', 'Sedan', 27000.00, 2022, 'Blue'),
(3, 'Ford Mustang', 'Ford', 'Sports Car', 35000.00, 2022, 'Yellow'),
(4, 'Chevrolet Silverado', 'Chevrolet', 'Truck', 40000.00, 2022, 'Black'),
(5, 'BMW 3 Series', 'BMW', 'Luxury Car', 45000.00, 2022, 'White'),
(6, 'Mercedes-Benz E-Class', 'Mercedes-Benz', 'Luxury Car', 55000.00, 2022, 'Silver'),
(7, 'Toyota RAV4', 'Toyota', 'SUV', 32000.00, 2022, 'Green'),
(8, 'Honda CR-V', 'Honda', 'SUV', 34000.00, 2022, 'Gray'),
(9, 'Jeep Wrangler', 'Jeep', 'SUV', 38000.00, 2022, 'Orange'),
(10, 'Ford F-150', 'Ford', 'Truck', 42000.00, 2022, 'Red'),
(11, 'Nissan Altima', 'Nissan', 'Sedan', 26000.00, 2022, 'Blue'),
(12, 'Chevrolet Equinox', 'Chevrolet', 'SUV', 33000.00, 2022, 'Black'),
(13, 'Hyundai Elantra', 'Hyundai', 'Sedan', 24000.00, 2022, 'Silver'),
(14, 'Volkswagen Jetta', 'Volkswagen', 'Sedan', 28000.00, 2022, 'Red'),
(15, 'Audi A4', 'Audi', 'Luxury Car', 50000.00, 2022, 'Blue'),
(16, 'Lexus RX', 'Lexus', 'SUV', 48000.00, 2022, 'White'),
(17, 'Tesla Model 3', 'Tesla', 'Electric Car', 60000.00, 2022, 'Black'),
(18, 'Subaru Outback', 'Subaru', 'SUV', 36000.00, 2022, 'Green'),
(19, 'Mazda CX-5', 'Mazda', 'SUV', 31000.00, 2022, 'Red'),
(20, 'Kia Forte', 'Kia', 'Sedan', 23000.00, 2022, 'White');

-- Inserting 20 records into Customer table
INSERT INTO Customer VALUES
(1, 'John', 'Doe', 'Male', 35, 'john.doe@example.com', '123-456-7890'),
(2, 'Jane', 'Smith', 'Female', 28, 'jane.smith@example.com', '987-654-3210'),
(3, 'Michael', 'Johnson', 'Male', 45, 'michael.johnson@example.com', '111-222-3333'),
(4, 'Emily', 'Brown', 'Female', 30, 'emily.brown@example.com', '444-555-6666'),
(5, 'David', 'Miller', 'Male', 40, 'david.miller@example.com', '777-888-9999'),
(6, 'Jennifer', 'Wilson', 'Female', 32, 'jennifer.wilson@example.com', '333-444-5555'),
(7, 'Robert', 'Martinez', 'Male', 38, 'robert.martinez@example.com', '666-777-8888'),
(8, 'Michelle', 'Anderson', 'Female', 29, 'michelle.anderson@example.com', '888-999-0000'),
(9, 'William', 'Taylor', 'Male', 50, 'william.taylor@example.com', '222-333-4444'),
(10, 'Jessica', 'Thomas', 'Female', 27, 'jessica.thomas@example.com', '555-444-3333'),
(11, 'Christopher', 'Lee', 'Male', 33, 'christopher.lee@example.com', '999-888-7777'),
(12, 'Amanda', 'White', 'Female', 36, 'amanda.white@example.com', '111-222-3333'),
(13, 'Daniel', 'Clark', 'Male', 41, 'daniel.clark@example.com', '444-555-6666'),
(14, 'Sarah', 'Hall', 'Female', 31, 'sarah.hall@example.com', '777-888-9999'),
(15, 'Matthew', 'Lewis', 'Male', 37, 'matthew.lewis@example.com', '333-444-5555'),
(16, 'Ashley', 'Young', 'Female', 26, 'ashley.young@example.com', '888-999-0000'),
(17, 'Andrew', 'Harris', 'Male', 43, 'andrew.harris@example.com', '222-333-4444'),
(18, 'Lauren', 'King', 'Female', 34, 'lauren.king@example.com', '555-666-7777'),
(19, 'James', 'Evans', 'Male', 39, 'james.evans@example.com', '999-000-1111'),
(20, 'Stephanie', 'Thompson', 'Female', 28, 'stephanie.thompson@example.com', '111-222-3333');

-- Inserting 20 records into Time table
INSERT INTO Time VALUES
(1, '2022-01-01', 1, 1, 1, 2022, 'Saturday'),
(2, '2022-01-02', 2, 1, 1, 2022, 'Sunday'),
(3, '2022-01-03', 3, 1, 1, 2022, 'Monday'),
(4, '2022-01-04', 4, 1, 1, 2022, 'Tuesday'),
(5, '2022-01-05', 5, 1, 1, 2022, 'Wednesday'),
(6, '2022-01-06', 6, 1, 1, 2022, 'Thursday'),
(7, '2022-01-07', 7, 1, 1, 2022, 'Friday'),
(8, '2022-01-08', 8, 1, 1, 2022, 'Saturday'),
(9, '2022-01-09', 9, 1, 1, 2022, 'Sunday'),
(10, '2022-01-10', 10, 1, 1, 2022, 'Monday'),
(11, '2022-01-11', 11, 1, 1, 2022, 'Tuesday'),
(12, '2022-01-12', 12, 1, 1, 2022, 'Wednesday'),
(13, '2022-01-13', 13, 1, 1, 2022, 'Thursday'),
(14, '2022-01-14', 14, 1, 1, 2022, 'Friday'),
(15, '2022-01-15', 15, 1, 1, 2022, 'Saturday'),
(16, '2022-01-16', 16, 1, 1, 2022, 'Sunday'),
(17, '2022-01-17', 17, 1, 1, 2022, 'Monday'),
(18, '2022-01-18', 18, 1, 1, 2022, 'Tuesday'),
(19, '2022-01-19', 19, 1, 1, 2022, 'Wednesday'),
(20, '2022-01-20', 20, 1, 1, 2022, 'Thursday');

-- Inserting 20 records into Dealer table
INSERT INTO Dealer VALUES
(1, 'ABC Motors', '123 Main St, Anytown', '111-222-3333'),
(2, 'XYZ Autos', '456 Elm St, Othertown', '444-555-6666'),
(3, 'PQR Motors', '789 Oak St, Another Town', '777-888-9999'),
(4, 'LMN Autos', '101 Pine St, Yet Another Town', '222-333-4444'),
(5, 'GHI Motors', '567 Maple St, Another Town', '555-666-7777'),
(6, 'JKL Autos', '890 Cedar St, Another Town', '888-999-0000'),
(7, 'MNO Motors', '121 Walnut St, Yet Another Town', '333-444-5555'),
(8, 'DEF Autos', '343 Cherry St, Another Town', '666-777-8888'),
(9, 'QRS Motors', '565 Pine St, Another Town', '999-000-1111'),
(10, 'UVW Autos', '787 Elm St, Another Town', '111-222-3333'),
(11, 'STU Motors', '909 Oak St, Another Town', '444-555-6666'),
(12, 'WXY Autos', '121 Cedar St, Another Town', '777-888-9999'),
(13, 'NOV Motors', '343 Walnut St, Another Town', '222-333-4444'),
(14, 'FEB Autos', '565 Maple St, Another Town', '555-666-7777'),
(15, 'APR Motors', '787 Pine St, Another Town', '888-999-0000'),
(16, 'JUL Autos', '909 Elm St, Another Town', '333-444-5555'),
(17, 'DEC Motors', '121 Cherry St, Another Town', '666-777-8888'),
(18, 'MAY Autos', '343 Cedar St, Another Town', '999-000-1111'),
(19, 'SEP Motors', '565 Walnut St, Another Town','959-010-1122'),
(20, 'OCT Autos', '787 Maple St, Another Town', '111-222-3333');

-- Inserting 20 records into Sales table
INSERT INTO sss VALUES
(1, 1, 1, 1, 25000.00, 1, 0),
(2, 2, 2, 2, 27000.00, 1, 0),
(3, 3, 3, 3, 35000.00, 1, 0),
(4, 4, 4, 4, 40000.00, 1, 0),
(5, 5, 5, 5, 45000.00, 1, 0),
(6, 6, 6, 6, 55000.00, 1, 0),
(7, 7, 7, 7, 32000.00, 1, 0),
(8, 8, 8, 8, 34000.00, 1, 0),
(9, 9, 9, 9, 38000.00, 1, 0),
(10, 10, 10, 10, 42000.00, 1, 0),
(11, 11, 11, 11, 26000.00, 1, 0),
(12, 12, 12, 12, 33000.00, 1, 0),
(13, 13, 13, 13, 24000.00, 1, 0),
(14, 14, 14, 14, 28000.00, 1, 0),
(15, 15, 15, 15, 50000.00, 1, 0),
(16, 16, 16, 16, 48000.00, 1, 0),
(17, 17, 17, 17, 60000.00, 1, 0),
(18, 18, 18, 18, 36000.00, 1, 0),
(19, 19, 19, 19, 31000.00, 1, 0),
(20, 20, 20, 20, 23000.00, 1, 0);




--Aggregation Functions


--1. Total Sales Amount by Car Model
SELECT 
    C.model, 
    SUM(S.sales_amount) AS total_sales_amount
FROM 
    sss S
JOIN 
    Car C ON S.car_id = C.car_id
GROUP BY 
    C.model;

	--2. Average Sales Amount by Dealer
	SELECT 
    D.dealer_name, 
    AVG(S.sales_amount) AS average_sales_amount
FROM 
    sss S
JOIN 
    Dealer D ON S.dealer_id = D.dealer_id
GROUP BY 
    D.dealer_name;


--	3. Number of Cars Sold by Category

	SELECT 
    C.category, 
    COUNT(S.sale_id) AS total_cars_sold
FROM 
    sss S
JOIN 
    Car C ON S.car_id = C.car_id
GROUP BY 
    C.category;

	--Joins


--	1. List of Sales with Customer and Dealer Information

SELECT 
    S.sale_id, 
    C.first_name AS customer_first_name, 
    C.last_name AS customer_last_name, 
    D.dealer_name, 
    S.sales_amount, 
    S.quantity_sold, 
    S.discount_applied
FROM 
    sss S
JOIN 
    Customer C ON S.customer_id = C.customer_id
JOIN 
    Dealer D ON S.dealer_id = D.dealer_id;


	--2. Sales Details with Car and Time Information

SELECT 
    S.sale_id, 
    C.model, 
    T.date, 
    S.sales_amount, 
    S.quantity_sold, 
    S.discount_applied
FROM 
    Sales S
JOIN 
    Car C ON S.car_id = C.car_id
JOIN 
    Time T ON S.time_id = T.time_id;




	--Union

--1. Union of Two Sets of Car Models (e.g., Cars Sold by Two Different Dealers)

SELECT 
    model
FROM 
    Car
WHERE 
    car_id IN (SELECT car_id FROM sss WHERE dealer_id = 1)
UNION
SELECT 
    model
FROM 
    Car
WHERE 
    car_id IN (SELECT car_id FROM sss WHERE dealer_id = 2);


