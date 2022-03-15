-- Comments in SQL Start with dash-dash --

INSERT INTO products (name, price, can_be_returned)
VALUES ('chair', 44.00, 'f');

INSERT INTO products (name, price, can_be_returned)
VALUES ('stool', 25.99, 't');

INSERT INTO products (name, price, can_be_returned)
VALUES ('table', 124.00, 'f');

SELECT * FROM products;

SELECT name FROM products;

SELECT name, price FROM products;

INSERT INTO products (name, price, can_be_returned)
VALUES ('fireplace', 599.99, 'f');
-- not sure about the nulling thing

SELECT * FROM products WHERE can_be_returned;

SELECT * FROM products WHERE price < 44.00;
-- I wanted to do SELECT name instead of *, need to figure out the difference

SELECT * FROM products WHERE price BETWEEN 22.50 AND 99.99;

UPDATE products SET price = price - 20;

DELETE FROM products WHERE price < 25;

UPDATE products SET can_be_returned = 't';