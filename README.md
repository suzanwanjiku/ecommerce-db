
# E-commerce Store Database Management System

## Overview

This project implements a **relational database** for an **E-commerce Store**. It includes the design and creation of tables, relationships between them, and constraints such as `PRIMARY KEY`, `FOREIGN KEY`, `NOT NULL`, and `UNIQUE` for data integrity. This schema supports typical e-commerce functionalities such as customer management, product catalog, order processing, payments, and reviews.

## Features

* **Customer Management**: Store customer details including personal information and contact details.
* **Product Catalog**: Organize products into categories and manage their availability and pricing.
* **Orders & Payments**: Process orders and payments, with status tracking for each order.
* **Reviews**: Allow customers to review products.
* **Shopping Cart**: Manage the shopping cart before an order is placed.

## Schema Design

The database contains the following tables:

* `customers`: Stores customer data (name, email, address, etc.).
* `categories`: Stores product categories (e.g., "Electronics", "Clothing").
* `products`: Stores product details such as name, description, price, stock quantity, and category.
* `orders`: Tracks customer orders and their statuses.
* `order_items`: Manages the many-to-many relationship between orders and products.
* `payments`: Manages payments related to orders.
* `reviews`: Allows customers to leave reviews for products.
* `shopping_cart` and `cart_items`: Manages the customer's cart before they proceed to checkout.

## Getting Started

### Prerequisites

1. **MySQL Server**: You will need MySQL or a compatible relational database management system (RDBMS) installed on your local machine or on a server.
2. **SQL Client**: Use a MySQL client (e.g., MySQL Workbench, DBeaver, or command line interface) to run the SQL scripts.

### Installation

1. **Clone the repository**:

   ```bash
   git clone https://github.com/your-username/ecommerce-store-db.git
   cd ecommerce-store-db
   ```

2. **Create the Database**:

   * Open your MySQL client and connect to your database server.
   * Execute the `ecommerce_store.sql` script in your MySQL client. This will create the database and all the necessary tables.

   ```sql
   source ecommerce_store.sql;
   ```

3. **Verify**:
   After running the script, you can check the created tables by running:

   ```sql
   SHOW TABLES;
   ```

### Usage

#### Example Queries

1. **Add a New Customer**:

   ```sql
   INSERT INTO customers (first_name, last_name, email, phone, address) 
   VALUES ('John', 'Doe', 'john.doe@example.com', '1234567890', '1234 Elm Street');
   ```

2. **View All Products**:

   ```sql
   SELECT * FROM products;
   ```

3. **Create an Order**:

   ```sql
   INSERT INTO orders (customer_id, total_price) 
   VALUES (1, 299.99);
   ```

4. **Add Products to Order**:

   ```sql
   INSERT INTO order_items (order_id, product_id, quantity, unit_price) 
   VALUES (1, 101, 2, 149.99);
   ```

5. **Payment for an Order**:

   ```sql
   INSERT INTO payments (order_id, payment_method, amount, payment_status) 
   VALUES (1, 'Credit Card', 299.99, 'Completed');
   ```

6. **Add a Product Review**:

   ```sql
   INSERT INTO reviews (product_id, customer_id, rating, comment) 
   VALUES (101, 1, 5, 'Great product, very satisfied!');
   ```

### Relationship Diagrams

(Optional) Include an ERD (Entity-Relationship Diagram) to visualize the relationships between the tables. You can use a tool like [dbdiagram.io](https://dbdiagram.io/) or draw it manually.

## Database Schema Overview

The relational schema for the database includes the following entities and their relationships:

* **Customers to Orders**: One-to-many relationship.
* **Categories to Products**: One-to-many relationship.
* **Orders to Order Items**: One-to-many relationship.
* **Products to Reviews**: One-to-many relationship.
* **Orders to Payments**: One-to-one relationship (one order can have one payment).
* **Shopping Cart to Products**: Many-to-many relationship (handled by the `cart_items` table).

## Contributing

Feel free to open issues or create pull requests if you’d like to contribute improvements or updates to the schema. Here are some ideas for future enhancements:

* Add a `discounts` table for promotional codes.
* Implement a `wish_list` feature for customers to save products for later.
* Track inventory changes through `inventory_log` tables.

### Steps for Contributing:

1. Fork the repository.
2. Create a new branch.
3. Make changes and test them.
4. Submit a pull request with a description of what was changed.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

### Key Sections in the `README.md`:

1. **Overview**: Explains the project and its purpose.
2. **Features**: Describes the main features and entities in the database.
3. **Getting Started**: Details how to set up the database and run it.
4. **Usage**: Provides sample queries for interacting with the database.
5. **Database Schema Overview**: A high-level description of the relationships between tables.
6. **Contributing**: Invites others to contribute to the project, along with a guide on how to do so.
7. **License**: States the licensing terms for the project.

You can modify this `README.md` as necessary, depending on your project’s specific requirements and any additional features you add to the database system.
