# E-commerce-DB

DOCUMENTATION OF FIELD SPECIALIZATIONS AND TABLE RELATIONSHIPS
Entities and Attributes:
1. Customers
- CustomerID (PK)
- Name
- Email
- Password
- Address
2. Products
- ProductID (PK)
- ProductName
- Description
- Price
- Quantity
- CategoryID (FK)
- SellerID (FK)
3. Orders
- OrderID (PK)
- CustomerID (FK)
- OrderDate
- Total
- Status
4. OrderItems
- OrderItemID (PK)
- OrderID (FK)
- ProductID (FK)
- Quantity
- Subtotal
5. Payments
- PaymentID (PK)
- OrderID (FK)
- PaymentMethod
- PaymentDate
- Amount
6. Shipping
- ShippingID (PK)
- OrderID (FK)
- ShippingAddress
- ShippingDate
- EstimatedDeliveryDate
7. Categories
- CategoryID (PK)
- CategoryName
8. Sellers
- SellerID (PK)
- SellerName
- Email

Relationships:
1. Customers → Orders (one-to-many)
2. Orders → OrderItems (one-to-many)
3. Products → OrderItems (many-to-many)
4. Categories → Products (one-to-many)
5. Sellers → Products (one-to-many)
6. Orders → Payments (one-to-one)
7. Orders → Shipping (one-to-one)
   
Customers
- has many Orders
- Orders
- belongs to one Customer
- has many OrderItems
- has one Payment
- has one Shipping
- Products
- belongs to one Category
- belongs to one Seller
- has many OrderItems
- OrderItems
- belongs to one Order
- belongs to one Product
- Payments
- belongs to one Order
- Shipping
- belongs to one Order
- Categories
- has many Products
- Sellers
- has many Products
  
Validation:
1. Each customer can place multiple orders.
2. Each order is associated with one customer.
3. Each order can have multiple order items.
4. Each product can be part of multiple order items.
5. Each category can have multiple products.
6. Each seller can have multiple products

# SQL Commands Summary

* **Product_category**: This table stores the categories of products sold in the e-commerce store (e.g., Electronics, Clothing).
* **Product_image**: This table stores the URLs of images associated with products.
* **Brand**: This table stores the brands of the products.  It includes foreign keys referencing the Product and Color tables.
* **Product**: This table stores detailed information about each product, including its name, description, base price, and category.  It establishes relationships with the Product_category, Brand, and Product_item tables.
* **Product_item**: This table represents a specific instance of a product, linking it to a color, size, and image.  It includes foreign keys referencing the Product_image, Product, Color, and Size tables.
* **Color**: This table stores color names.
* **Product**: This table stores general product information.
* **Product_variation**: This table stores specific variations of a product (e.g., different colors or sizes).
* **Product_attribute**: This table stores attributes of a product.
* **attribute_category**: This table stores categories of attributes.
* **size_category**: This table stores categories of sizes.
* **size_option**: this table stores size options.
* **attribute_type**: This table stores types of attributes.

## Table Details
1. Product Category Table
CREATE TABLE Product_category (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL
);

2. Product Image Table
CREATE TABLE Product_image (
    image_id INT AUTO_INCREMENT PRIMARY KEY,
    image_url VARCHAR(255)
);

3. Brand Table
CREATE TABLE Brand (
    brand_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    FOREIGN KEY (product_id) REFERENCES Product(product_id),
    FOREIGN KEY (color_name) REFERENCES Color(color_name)
);

4. Products Table
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

5. Product Item Table
CREATE TABLE Product_item (
    validation_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    color_id INT NOT NULL,
    size_id INT NOT NULL,
    image_id INT,
    FOREIGN KEY (image_id) REFERENCES Product_image(image_id),
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);

6. Color Table 
CREATE TABLE Color (
    color_id INT AUTO_INCREMENT PRIMARY KEY,
    color_name VARCHAR(50)
);

7. Product Variation Table
CREATE TABLE product_variation (
    variation_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    color_id INT NOT NULL,
    size_id INT NOT NULL,
    image_id INT,
    FOREIGN KEY (product_id) REFERENCES Product(product_id),
    FOREIGN KEY (color_id) REFERENCES Color(color_id),
    FOREIGN KEY (size_id) REFERENCES Size(size_id),
    FOREIGN KEY (image_id) REFERENCES Product_image(image_id),
    -- Add any other relevant attributes
    sku VARCHAR(255),       -- Stock Keeping Unit
    quantity INT,           -- Available quantity in stock
    price DECIMAL(10, 2)    -- Price of this specific variation
);

8. Product Attribute Table
CREATE TABLE product_attribute (
    attribute_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    attribute_name VARCHAR(255) NOT NULL,
    attribute_value VARCHAR(255) NOT NULL,
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);

9. Attribute Category Table
CREATE TABLE attribute_category (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(255) NOT NULL UNIQUE
);

10. Size Category Table
CREATE TABLE size_category (
category_id INT AUTO_INCREMENT PRIMARY KEY,
category_name VARCHAR(255) NOT NULL UNIQUE
);

11. Size Option Table
CREATE TABLE size_option (
    option_id INT AUTO_INCREMENT PRIMARY KEY,
    category_id INT NOT NULL,
    option_name VARCHAR(255) NOT NULL,
    FOREIGN KEY (category_id) REFERENCES size_category(category_id)
);

12. Attriute Type Table
CREATE TABLE attribute_type (
    type_id INT AUTO_INCREMENT PRIMARY KEY,
    type_name VARCHAR(255) NOT NULL UNIQUE
);

TEAM COLLABORATORS ON THIS PROJECT/GROUP ASSIGNMENT
1. IKENNA - 
2. SAM JUWON - 
3. DANIEL OHACHOR -
4. KEMOI BRIAN -
5. ILEOGBEN EMMANUELLA AIMALOHI - emmanuellaileogben@gmail.com
