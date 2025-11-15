CREATE TABLE states (
    code CHAR(2) PRIMARY KEY NOT NULL,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE addresses (
    id INT AUTO_INCREMENT PRIMARY KEY,
    street VARCHAR(100) NOT NULL,
    city VARCHAR(50) NOT NULL,
    state_code CHAR(2) NOT NULL,
    zip_code VARCHAR(10) NOT NULL,
    FOREIGN KEY (state_code) REFERENCES states(code)
);

CREATE TABLE customers (	
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    cpf VARCHAR(11) UNIQUE NOT NULL,
    CHECK (LENGTH(cpf) = 11),
    addresses_id INT UNIQUE NOT NULL,
    phone VARCHAR(15),
    FOREIGN KEY (addresses_id) REFERENCES addresses(id)
);


CREATE TABLE employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    position VARCHAR(50) NOT NULL
);

CREATE TABLE motorcycle_models (
    id INT AUTO_INCREMENT PRIMARY KEY,
    model VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL
);

CREATE TABLE motorcycles (
    id INT AUTO_INCREMENT PRIMARY KEY,
    model_id INT NOT NULL,
    year INT NOT NULL,
    FOREIGN KEY (model_id) REFERENCES motorcycle_models(id)
);

CREATE TABLE suppliers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    cnpj VARCHAR(18) NOT NULL
);

CREATE TABLE parts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    supplier_id INT NOT NULL,
    FOREIGN KEY (supplier_id) REFERENCES suppliers(id)
);

CREATE TABLE sales (
    id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    employee_id INT NOT NULL,
    motorcycle_id INT NOT NULL,
    sale_date DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(id),
    FOREIGN KEY (employee_id) REFERENCES employees(id),
    FOREIGN KEY (motorcycle_id) REFERENCES motorcycles(id)
);

CREATE TABLE service_orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    open_date DATE NOT NULL,
    status VARCHAR(20) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);

CREATE TABLE services (
    id INT AUTO_INCREMENT PRIMARY KEY,
    service_order_id INT NOT NULL,
    description VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (service_order_id) REFERENCES service_orders(id)
);

CREATE TABLE service_parts (
    part_id INT NOT NULL,
    service_id INT NOT NULL,
    quantity INT NOT NULL,
    PRIMARY KEY (part_id, service_id),
    FOREIGN KEY (part_id) REFERENCES parts(id),
    FOREIGN KEY (service_id) REFERENCES services(id)
);

INSERT INTO states (code, name) VALUES
('AC','Acre'), ('AL','Alagoas'), ('AP','Amapá'), ('AM','Amazonas'),
('BA','Bahia'), ('CE','Ceará'), ('DF','Distrito Federal'), ('ES','Espírito Santo'),
('GO','Goiás'), ('MA','Maranhão'), ('MT','Mato Grosso'), ('MS','Mato Grosso do Sul'),
('MG','Minas Gerais'), ('PA','Pará'), ('PB','Paraíba'), ('PR','Paraná'),
('PE','Pernambuco'), ('PI','Piauí'), ('RJ','Rio de Janeiro'), ('RN','Rio Grande do Norte'),
('RS','Rio Grande do Sul'), ('RO','Rondônia'), ('RR','Roraima'), ('SC','Santa Catarina'),
('SP','São Paulo'), ('SE','Sergipe'), ('TO','Tocantins');


INSERT INTO addresses ( street, city, state_code, zip_code) 
VALUES ( 'Santa Pricila Street', 'Buique', 'PE', '12345-000');

INSERT INTO customers (addresses_id, name, cpf, phone) VALUES 
(1, 'Edder Deryck', '12345678900', '87 123456789');


INSERT INTO employees (name, position) VALUES 
('Simon', 'Seller');

INSERT INTO motorcycle_models (model, price) VALUES 
('Honda CB 500 F', 47296.00);

INSERT INTO motorcycles (model_id, year) VALUES 
(1, 2024);

INSERT INTO suppliers (name, cnpj) VALUES 
('Honda Official', '12.345.678/0001-99');

INSERT INTO parts (name, price, supplier_id) VALUES 
('Oil Filter', 35.00, 1),
('Brake Pad', 60.00, 1);

INSERT INTO sales (customer_id, employee_id, motorcycle_id, sale_date) VALUES 
(1, 1, 1, '2025-09-15');

INSERT INTO service_orders (customer_id, open_date, status) VALUES 
(1, '2025-09-16', 'Open');

INSERT INTO services (service_order_id, description, price) VALUES 
(1, 'Oil Change', 100.00);

INSERT INTO service_parts (part_id, service_id, quantity) VALUES 
(1, 1, 1);
