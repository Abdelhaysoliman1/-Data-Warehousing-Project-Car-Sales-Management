CREATE DATABASE CarSalesManagement_snowFlake1;
USE CarSalesManagement_snowFlake1;

-- Create Car_Category Table with Additional Attributes
CREATE TABLE CarCategory (
    category_id INT PRIMARY KEY,
    category_name NVARCHAR(50) UNIQUE,
    description NVARCHAR(255),
    typical_usage NVARCHAR(100),
    fuel_type NVARCHAR(50)
);

-- Create Car_Manufacturer Table with Additional Attributes
CREATE TABLE CarManufacturer (
    manufacturer_id INT PRIMARY KEY,
    manufacturer_name NVARCHAR(50) UNIQUE,
    country NVARCHAR(50),
    founding_year INT,
    headquarters NVARCHAR(100),
    website NVARCHAR(100)
);

-- Create CityOfCustomer Table
CREATE TABLE CityOfCus (
    city_id INT PRIMARY KEY,
    city_name NVARCHAR(50) UNIQUE,
    state NVARCHAR(50),
    country NVARCHAR(50)
);

-- Create Customer Table with city_id attribute
CREATE TABLE Cus (
    customer_id INT PRIMARY KEY,
    first_name NVARCHAR(50),
    last_name NVARCHAR(50),
    gender NVARCHAR(10),
    age INT,
    email NVARCHAR(100),
    phone NVARCHAR(20),
    city_id INT,
    FOREIGN KEY (city_id) REFERENCES CityOfCus(city_id)
);

-- Create Car Table
CREATE TABLE Car (
    car_id INT PRIMARY KEY,
    category_id INT,
    manufacturer_id INT,
    model NVARCHAR(50),
    price DECIMAL(10, 2),
    year INT,
    color NVARCHAR(50),
    FOREIGN KEY (category_id) REFERENCES CarCategory(category_id),
    FOREIGN KEY (manufacturer_id) REFERENCES CarManufacturer(manufacturer_id)
);

-- Create Time Table
CREATE TABLE Time (
    time_id INT PRIMARY KEY,
    date DATE,
    day INT,
    month INT,
    quarter INT,
    year INT,
    day_of_week NVARCHAR(10)
);

-- Create Dealer Table
CREATE TABLE Dealer (
    dealer_id INT PRIMARY KEY,
    dealer_name NVARCHAR(100),
    location NVARCHAR(100),
    contact_number NVARCHAR(20)
);

-- Create Sales Table
CREATE TABLE Sales (
    sale_id INT PRIMARY KEY,
    car_id INT,
    customer_id INT,
    time_id INT,
    dealer_id INT,
    sales_amount DECIMAL(10, 2),
    quantity_sold INT,
    discount_applied DECIMAL(10, 2),
    FOREIGN KEY (car_id) REFERENCES Car(car_id),
    FOREIGN KEY (customer_id) REFERENCES Cus(customer_id),
    FOREIGN KEY (time_id) REFERENCES Time(time_id),
    FOREIGN KEY (dealer_id) REFERENCES Dealer(dealer_id)
);
