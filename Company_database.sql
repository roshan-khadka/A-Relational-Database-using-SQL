-- First creating tables and defining relationship.

CREATE TABLE Employee(
  emp_id INT PRIMARY KEY,
  first_name VARCHAR(40),
  last_name VARCHAR(40),
  birth_date DATE,
  sex VARCHAR(1),
  salary INT,
  supervisor_id INT,
  branch_id INT
  );
  
CREATE TABLE Branch(
  branch_id INT PRIMARY KEY,
  branch_name VARCHAR(40),
  manager_id INT,
  mgr_start_date DATE,
  FOREIGN KEY(manager_id) REFERENCES Employee(emp_id) ON DELETE SET NULL
  );
  
ALTER TABLE Employee
ADD FOREIGN KEY(supervisor_id) REFERENCES Employee(emp_id) ON DELETE SET NULL;
  
ALTER TABLE Employee
ADD FOREIGN KEY(branch_id) REFERENCES Branch(branch_id) ON DELETE SET NULL;

CREATE TABLE Client(
  client_id INT PRIMARY KEY,
  client_name VARCHAR(40),
  branch_id INT,
  FOREIGN KEY(branch_id) REFERENCES Branch(branch_id) ON DELETE SET NULL
  );
 
CREATE TABLE Works_with(
 emp_id INT PRIMARY KEY,
 client_id INT PRIMARY KEY,
 total_sales INT,
 PRIMARY KEY(emp_id, client_id)
 FOREIGN KEY(emp_id) REFERENCES Employee(emp_id) ON DELETE CASCADE,
 FOREIGN KEY(client_id) REFERENCES Client(client_id) ON DELETE CASCADE
 );

CREATE TABLE Branch_supplier(
  branch_id INT,
  supplier_name VARCHAR(40),
  supply_type VARCHAR(40),
  PRIMARY KEY(branch_id, supplier_name),
  FOREIGN KEY(branch_id) REFERENCES Branch(branch_id) ON DELETE CASCADE
  );
  
-- Inserting values into tables.

  
