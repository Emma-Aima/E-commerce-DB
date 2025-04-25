/* -- This SQL script creates a database schema for a simple user management system.
-- It includes tables for users, roles, permissions, and logs. */

/* Product Category Table */
-- Disable foreign key checks to allow table creation in any order
CREATE TABLE Product_category (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL,
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);

-- Insert statements for 12 Sample Items
INSERT INTO Product_category (category_name) VALUES
    ('Electronics'),
    ('Clothing'),
    ('Home & Kitchen'),
    ('Books'),
    ('Sports & Outdoors'),
    ('Beauty & Personal Care'),
    ('Toys & Games'),
    ('Automotive'),
    ('Health & Household'),
    ('Pet Supplies'),
    ('Office Products'),
    ('Grocery & Gourmet Food');

-- These 12 product categories are what is sold in our e-commerce stores
-- These product category consists of a lot of items, with different sizes, weight, color,
-- prices, image urls, brand mame, etc.

/* Product Image Table */
CREATE TABLE Product_image (
    image_id INT AUTO_INCREMENT PRIMARY KEY,
    image_url VARCHAR(255) -- Added VARCHAR(255) for image_url
);

-- Insert statements for 12 Image URLs
INSERT INTO Product_image (image_url) VALUES
    ('https://plus.unsplash.com/premium_photo-1679079456083-9f288e224e96?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8ZWxlY3Ryb25pY3N8ZW58MHx8MHx8fDA%3D'),
    ('https://plus.unsplash.com/premium_photo-1664202526047-405824c633e7?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8Y2xvdGhpbmd8ZW58MHx8MHx8fDA%3D'),
    ('https://images.unsplash.com/photo-1733431769311-f33ee6f83d15?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8aG9tZSUyMGtpdGNoZW58ZW58MHx8MHx8fDA%3D'),
    ('https://images.unsplash.com/photo-1643250048998-7ffa83ae2c63?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTR8fGJvb2tzfGVufDB8fDB8fHww'),
    ('https://plus.unsplash.com/premium_photo-1682435576307-a71fec9529be?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8c3BvcnRzJTIwb3V0ZG9vcnMlMjBraXR8ZW58MHx8MHx8fDA%3D'),
    ('https://images.unsplash.com/photo-1652706299340-e8a346491541?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8YmVhdXR5JTIwa2l0fGVufDB8fDB8fHww'),
    ('https://images.unsplash.com/photo-1637728226029-e590a9a16c4b?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8dG95cyUyMGFuZCUyMGdhbWVzfGVufDB8fDB8fHww'),
    ('https://cdn.pixabay.com/photo/2024/02/24/13/02/ai-generated-8593983_640.jpg'),
    ('https://cdn.pixabay.com/photo/2015/07/30/14/36/hypertension-867855_640.jpg'),
    ('https://www.istockphoto.com/photo/a-young-man-and-his-pup-at-the-pet-shop-gm1892103156-553938122?utm_source=pixabay&utm_medium=affiliate&utm_campaign=sponsored_image&utm_content=srp_topbanner_media&utm_term=pet+supplies'),
    ('https://cdn.pixabay.com/photo/2015/09/09/19/56/office-932926_640.jpg'),
    ('https://cdn.pixabay.com/photo/2016/03/02/20/13/grocery-1232944_640.jpg');

-- This table consists of product_image urls available in the e-commerce store.

/* Brand Table*/
CREATE TABLE Brand (
    brand_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    FOREIGN KEY (product_id) REFERENCES Product(product_id),
    FOREIGN KEY (color_name) REFERENCES Color(color_name)
);

--Insert statements for 12 Brand (Product) Names
INSERT INTO Brand (product_name) VALUES
    ('Samsung'),  -- Electronics
    ('Nike'),     -- Clothing
    ('KitchenAid'), -- Home & Kitchen
    ('Penguin'),   -- Books
    ('Adidas'),    -- Sports & Outdoors
    ('Cetaphil'),  -- Beauty & Personal Care
    ('Hasbro'),     -- Toys & Games
    ('Toyota'),    -- Automotive
    ('Johnson & Johnson'), -- Health & Household
    ('Purina'),    -- Pet Supplies
    ('OfficeMax'),  -- Office Products
    ('Nestlé');    -- Grocery & Gourmet Food

-- This brand table covers the different products available at the e-commerce store.

/* Product Table */
CREATE TABLE Product (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    base_price DECIMAL(10, 2) NOT NULL,
    category_id INT NOT NULL,
    brand_id INT,
    validation_id INT,
    FOREIGN KEY (category_id) REFERENCES Product_category(category_id), 
    FOREIGN KEY (brand_id) REFERENCES Brand(brand_id),
    FOREIGN KEY (validation_id) REFERENCES Product_item(validation_id)
);

-- Insert statements for 12 Products in the E-commerce Store
INSERT INTO Product (name, description, base_price, category_id, brand_id) VALUES
    ('Samsung Galaxy S23', 'Latest Android smartphone', 999.99, 1, 1),  -- Electronics, Samsung
    ('Nike Air Max 270', 'Men''s running shoes', 150.00, 2, 2),      -- Clothing, Nike
    ('KitchenAid Stand Mixer', 'Professional series mixer', 399.00, 3, 3), -- Home & Kitchen, KitchenAid
    ('The Great Gatsby', 'Classic American novel', 15.99, 4, 4),      -- Books, Penguin
    ('Adidas Ultraboost 22', 'Women''s running shoes', 180.00, 5, 5),    -- Sports & Outdoors, Adidas
    ('Cetaphil Gentle Skin Cleanser', 'For sensitive skin', 7.99, 6, 6),    -- Beauty & Personal Care, Cetaphil (assuming Cetaphil is the brand)
    ('Hasbro Monopoly', 'Classic board game', 25.00, 7, 7),            -- Toys & Games, Hasbro
    ('Toyota Camry', 'Mid-size sedan', 25000.00, 8, 8),                  -- Automotive, Toyota
    ('Johnson & Johnson Band-Aids', 'Adhesive bandages', 3.49, 9, 9),    -- Health & Household, Johnson & Johnson
    ('Purina Pro Plan Dog Food', 'High-protein formula', 45.00, 10, 10),    -- Pet Supplies, Purina
    ('OfficeMax Multipurpose Paper', '8.5 x 11, 500 sheets', 12.99, 11, 11), -- Office Products, OfficeMax
    ('Nestlé Toll House Chocolate Chips', 'For baking', 4.99, 12, 12);    -- Grocery & Gourmet Food, Nestlé

/* Product Item Table */
CREATE TABLE Product_item (
    validation_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    color_id INT NOT NULL,
    size_id INT NOT NULL,
    FOREIGN KEY (image_id) REFERENCES Product_image(image_id),
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);

-- Insert statements for 12 Product Items in the E-commerce Store
INSERT INTO Product_item (product_id, color_id, size_id, image_id) VALUES
    (1, 1, 1, 1),  -- Samsung Galaxy S23, Color 1, Size 1, Image 1
    (1, 2, 1, 2),  -- Samsung Galaxy S23, Color 2, Size 1, Image 1
    (2, 3, 2, 3),  -- Nike Air Max 270, Color 3, Size 2, Image 2
    (2, 3, 3, 4),  -- Nike Air Max 270, Color 3, Size 3, Image 3
    (3, 4, 1, 5),  -- KitchenAid Stand Mixer, Color 4, Size 1, Image 3 (assuming size here is capacity)
    (4, 5, 1, 6),  -- The Great Gatsby, Color 5, Size 1, Image 4 (assuming size is format e.g., Hardcover)
    (5, 6, 2, 7),  -- Adidas Ultraboost 22, Color 6, Size 2, Image 5
    (5, 6, 3, 8),  -- Adidas Ultraboost 22, Color 6, Size 3, Image 5
    (6, 7, 1, 9),  -- Cetaphil Gentle Skin Cleanser, Color 7, Size 1, Image 6 (assuming size is volume)
    (7, 8, 1, 10), -- Hasbro Monopoly, Color 8, Size 1, Image 7 (assuming size is the set type)
    (8, 9, 1, 11), -- Toyota Camry, Color 9, Size 1, Image 8 (assuming size is trim level)
    (9, 10, 1, 12), -- Johnson & Johnson Band-Aids, Color 10, Size 1, Image 9 (assuming size is count)
    (10, 11, 3, 13), -- Purina Pro Plan Dog Food, Color 11, size 3,Image 10 (assuming size is the largest size in kg)
    (11, 12, 1, 14), -- OfficeMax Multipurpose Paper, Color 12, Size 1, Image 11 (assuming size is the most common)
    (12, 13, 2, 15); -- Nestlé Toll House Chocolate Chips, Color 13, Size 2, Image 12 (assuming size is medium kg)

/* Color Table */
CREATE TABLE Color (
    color_id INT AUTO_INCREMENT PRIMARY KEY,
    color_name VARCHAR(255),
    FOREIGN KEY (brand_id) REFERENCES Brand(brand_id),
    FOREIGN KEY (variation_id) REFERENCES Product_variation(variation_id)
);

-- Insert statements for 12 Colors in the Product Items
INSERT INTO Color (color_name) VALUES
    ('Red'),
    ('Blue'),
    ('Green'),
    ('Black'),
    ('White'),
    ('Yellow'),
    ('Purple'),
    ('Orange'),
    ('Pink'),
    ('Gray'),
    ('Brown'),
    ('Teal');

/* Product Variation Table */
CREATE TABLE Product_variation (
    variation_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    color_id INT NOT NULL,
    size_id INT NOT NULL,
    image_id INT,
    FOREIGN KEY (product_attribute_id) REFERENCES Product_attribute(product_attribute_id),
    FOREIGN KEY (color_id) REFERENCES Color(color_id),
    FOREIGN KEY (size_category_id) REFERENCES Size_category(size_category_id),
    FOREIGN KEY (image_id) REFERENCES Product_image(image_id),
    -- Add any other relevant attributes
    sku VARCHAR(255),       -- Stock Keeping Unit
    quantity INT,           -- Available quantity in stock
    price DECIMAL(10, 2)    -- Price of this specific variation
);

-- Insert statements for 12 Product Variation Items in the E-commerce Store
INSERT INTO Product_variation (product_id, color_id, size_id, image_id, sku, quantity, price) VALUES
    (1, 1, 1, 1, 'SGS23-C1-S1', 100, 999.99),  -- Samsung Galaxy S23, Color 1, Size 1
    (1, 2, 1, 2, 'SGS23-C2-S1', 50, 999.99),   -- Samsung Galaxy S23, Color 2, Size 1
    (2, 3, 2, 3, 'NAM270-C3-S2', 75, 150.00),  -- Nike Air Max 270, Color 3, Size 2
    (2, 3, 3, 4, 'NAM270-C3-S3', 60, 155.00),  -- Nike Air Max 270, Color 3, Size 3
    (3, 4, 1, 5, 'KSM-C4-SZ1', 30, 349.00),    -- KitchenAid Stand Mixer, Color 4, Size 1
    (4, 5, 1, 6, 'TGG-C5-HC', 120, 15.50),     -- The Great Gatsby, Color 5, Hardcover
    (5, 6, 2, 7, 'AU22-C6-S2', 90, 180.00),   -- Adidas Ultraboost 22, Color 6, Size 2
    (5, 6, 3, 8, 'AU22-C6-S3', 80, 185.00),   -- Adidas Ultraboost 22, Color 6, Size 3
    (6, 7, 1, 9, 'CGS-C7-VL1', 200, 12.75),    -- Cetaphil Gentle Skin Cleanser, Color 7, Volume 1
    (7, 8, 1, 10, 'HM-C8-ST1', 45, 25.99),     -- Hasbro Monopoly, Color 8, Set Type 1
    (8, 9, 1, 11, 'TC-C9-TR1', 25, 28000.00),  -- Toyota Camry, Color 9, Trim Level 1
    (9, 10, 1, 12, 'JJB-C10-CT1', 300, 4.99);   -- Johnson & Johnson Band-Aids, Color 10, Count 1

-- Inserting the additional items as requested
INSERT INTO Product_variation (product_id, color_id, size_id, image_id, sku, quantity, price) VALUES
    (10, 11, 3, 13, 'PPP-C11-SZ3', 40, 55.00),  -- Purina Pro Plan Dog Food, Color 11, Size 3
    (11, 12, 1, 14, 'OMP-C12-SZ1', 150, 8.25),  -- OfficeMax Multipurpose Paper, Color 12, Size 1
    (12, 13, 2, 15, 'NTH-C13-SZ2', 100, 6.50);  -- Nestlé Toll House Chocolate Chips, Color 13, Size 2

/* Create the Produc Attribute Table */
CREATE TABLE Product_attribute (
    attribute_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    attribute_name VARCHAR(255) NOT NULL,
    attribute_value VARCHAR(255) NOT NULL,
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);

-- Insert statements for sample data into the product_attribute table
INSERT INTO Product_attribute (product_id, attribute_name, attribute_value) VALUES
    (1, 'Brand', 'Samsung'),
    (1, 'Model', 'Galaxy S23'),
    (1, 'Storage', '256GB'),
    (1, 'RAM', '8GB'),
    (2, 'Brand', 'Nike'),
    (2, 'Style', 'Air Max 270'),
    (2, 'Closure', 'Lace-up'),
    (3, 'Brand', 'KitchenAid'),
    (3, 'Capacity', '5 Quart'),
    (3, 'Color', 'Various'),
    (4, 'Author', 'F. Scott Fitzgerald'),
    (4, 'Genre', 'Classic Literature'),
    (4, 'ISBN', '978-0743273565'),
    (5, 'Brand', 'Adidas'),
    (5, 'Model', 'Ultraboost 22'),
    (5, 'Cushioning', 'Boost'),
    (6, 'Brand', 'Cetaphil'),
    (6, 'Skin Type', 'Sensitive'),
    (6, 'Formulation', 'Lotion'),
    (7, 'Brand', 'Hasbro'),
    (7, 'Players', '2-8'),
    (7, 'Ages', '8+'),
    (8, 'Brand', 'Toyota'),
    (8, 'Model', 'Camry'),
    (8, 'Year', '2023'),
    (9, 'Brand', 'Johnson & Johnson'),
    (9, 'Type', 'Adhesive Bandages'),
    (9, 'Sterile', 'Yes'),
    (10, 'Brand', 'Purina'),
    (10, 'Type', 'Pro Plan'),
    (10, 'Life Stage', 'Adult'),
    (11, 'Brand', 'OfficeMax'),
    (11, 'Paper Size', '8.5 x 11 inches'),
    (11, 'Paper Weight', '20 lb'),
    (12, 'Brand', 'Nestlé'),
    (12, 'Type', 'Semi-Sweet'),
    (12, 'Weight', '12 oz');

/* Attribute Category Table */
-- Create the attribute_category table
CREATE TABLE Attribute_category (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(255) NOT NULL UNIQUE
    FOREIGN KEY (product_attribute_id) REFERENCES Product_attribute(product_attribute_id)
);

-- Insert data into the attribute_category table
-- Data is derived from the attribute_name column in the product_attribute table
INSERT INTO Attribute_category (category_name) VALUES
    ('Brand'),
    ('Model'),
    ('Storage'),
    ('RAM'),
    ('Style'),
    ('Closure'),
    ('Capacity'),
    ('Color'),
    ('Author'),
    ('Genre'),
    ('ISBN'),
    ('Cushioning'),
    ('Skin Type'),
    ('Formulation'),
    ('Players'),
    ('Ages'),
    ('Year'),
    ('Type'),
    ('Sterile'),
    ('Life Stage'),
    ('Paper Size'),
    ('Paper Weight'),
    ('Weight');

/* Size Category Table */ 
-- Create the size_category table
CREATE TABLE Size_category (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(255) NOT NULL UNIQUE
);

-- Insert data into the size_category table
-- Data is derived from the size_id column and product information
INSERT INTO Size_category (category_name) VALUES
    ('Phone Storage'),       -- For products like Samsung Galaxy S23 (e.g., 256GB, 512GB)
    ('Shoe Size'),           -- For products like Nike Air Max 270, Adidas Ultraboost 22
    ('Capacity'),            -- For products like KitchenAid Stand Mixer (e.g., Quart)
    ('Format'),              -- For products like Books (e.g., Hardcover, Paperback)
    ('Volume'),            -- For products like Cetaphil Cleanser (e.g., ml, oz)
    ('Set Type'),        --For products like Hasbro Monopoly
    ('Trim Level'),        -- For products like Toyota Camry
    ('Count'),             -- For products like Johnson & Johnson Band-Aids
    ('Weight'),          --For products like Purina Pro Plan Dog Food, Nestle Chocolate Chips
    ('Paper Size');      -- For products like OfficeMax Multipurpose Paper

/* Size Option Table */
-- Create the size_option table
CREATE TABLE Size_option (
    option_id INT AUTO_INCREMENT PRIMARY KEY,
    category_id INT NOT NULL,
    option_name VARCHAR(255) NOT NULL,
    FOREIGN KEY (category_id) REFERENCES Size_category(category_id)
);

-- Insert data into the size_option table
-- Data is derived from the product information
INSERT INTO Size_option (category_id, option_name) VALUES
    (1, '256GB'),       -- Phone Storage
    (1, '512GB'),
    (2, '7'),           -- Shoe Size
    (2, '8'),
    (2, '9'),
    (3, '5 Quart'),       -- Capacity
    (3, '6 Quart'),
    (4, 'Hardcover'),    -- Format
    (4, 'Paperback'),
    (5, '100ml'),       -- Volume
    (5, '200ml'),
    (6, 'Standard'),       --Set Type
    (7, 'LE'),       --Trim Level
    (7, 'XLE'),
    (8, '30'),             -- Count
    (8, '50'),
    (9, '1kg'),          -- Weight
    (9, '2kg'),
    (10, '8.5 x 11 inches');       -- Paper Size

/* Attribute Type Table */
-- Create the attribute_type table
CREATE TABLE Attribute_type (
    type_id INT AUTO_INCREMENT PRIMARY KEY,
    type_name VARCHAR(255) NOT NULL UNIQUE
);

-- Insert data into the attribute_type table
-- Data is derived from the attribute_name column in the product_attribute table
INSERT INTO Attribute_type (type_name) VALUES
    ('Brand'),
    ('Model'),
    ('Storage'),
    ('RAM'),
    ('Style'),
    ('Closure'),
    ('Capacity'),
    ('Color'),
    ('Author'),
    ('Genre'),
    ('ISBN'),
    ('Cushioning'),
    ('Skin Type'),
    ('Formulation'),
    ('Players'),
    ('Ages'),
    ('Year'),
    ('Type'),
    ('Sterile'),
    ('Life Stage'),
    ('Paper Size'),
    ('Paper Weight'),
    ('Weight');

