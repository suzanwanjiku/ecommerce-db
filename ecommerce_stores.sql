-- Create the database
CREATE DATABASE ecommerce_store;
USE ecommerce_store;

-- Create Customers table
CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY, 
    first_name VARCHAR(100) NOT NULL, 
    last_name VARCHAR(100) NOT NULL, 
    email VARCHAR(255) UNIQUE NOT NULL, 
    phone VARCHAR(15) NOT NULL, 
    address TEXT, 
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create Categories table (for categorizing products)
CREATE TABLE categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY, 
    category_name VARCHAR(100) UNIQUE NOT NULL
);

-- Create Products table
CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY, 
    product_name VARCHAR(255) NOT NULL, 
    description TEXT, 
    price DECIMAL(10, 2) NOT NULL, 
    stock_quantity INT NOT NULL, 
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

-- Create Orders table
CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY, 
    customer_id INT NOT NULL, 
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
    total_price DECIMAL(10, 2) NOT NULL, 
    status ENUM('Pending', 'Shipped', 'Delivered', 'Cancelled') DEFAULT 'Pending',
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Create Order Items table (to handle many-to-many relationship between orders and products)
CREATE TABLE order_items (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY, 
    order_id INT NOT NULL, 
    product_id INT NOT NULL, 
    quantity INT NOT NULL, 
    unit_price DECIMAL(10, 2) NOT NULL, 
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Create Payments table
CREATE TABLE payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY, 
    order_id INT NOT NULL, 
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
    payment_method ENUM('Credit Card', 'PayPal', 'Bank Transfer') NOT NULL, 
    amount DECIMAL(10, 2) NOT NULL, 
    payment_status ENUM('Pending', 'Completed', 'Failed') DEFAULT 'Pending',
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

-- Create Reviews table
CREATE TABLE reviews (
    review_id INT AUTO_INCREMENT PRIMARY KEY, 
    product_id INT NOT NULL, 
    customer_id INT NOT NULL, 
    rating INT CHECK(rating BETWEEN 1 AND 5), 
    comment TEXT, 
    review_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
    FOREIGN KEY (product_id) REFERENCES products(product_id),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Create Shopping Cart table (optional, for managing user's cart before order)
CREATE TABLE shopping_cart (
    cart_id INT AUTO_INCREMENT PRIMARY KEY, 
    customer_id INT NOT NULL, 
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Create Cart Items table (to manage many-to-many relationship between shopping cart and products)
CREATE TABLE cart_items (
    cart_item_id INT AUTO_INCREMENT PRIMARY KEY, 
    cart_id INT NOT NULL, 
    product_id INT NOT NULL, 
    quantity INT NOT NULL, 
    FOREIGN KEY (cart_id) REFERENCES shopping_cart(cart_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Add indices to frequently queried fields
CREATE INDEX idx_customer_email ON customers(email);
CREATE INDEX idx_order_customer ON orders(customer_id);
CREATE INDEX idx_order_date ON orders(order_date);
CREATE INDEX idx_product_category ON products(category_id);

