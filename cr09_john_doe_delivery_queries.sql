SELECT first_name, last_name, customer_id
FROM customers
WHERE first_name = 'Max';

SELECT * FROM packages
WHERE weight >= 10;

SELECT customers.first_name, customers.last_name, customers.email, locations.city, packages.weight, packages.price  FROM customers
INNER JOIN recieve_send ON customers.customer_id = recieve_send.fk_customer_id
INNER JOIN locations ON locations.location_id = customers.customer_id
INNER JOIN packages ON packages.package_id = recieve_send.fk_package_id


SELECT packages.package_id, customers.first_name, customers.last_name, dates.delivery_date, dates.recieve_date FROM packages
INNER JOIN dates ON dates.date_id = packages.fk_date_id
INNER JOIN transports ON packages.package_id = transports.fk_package_id
INNER JOIN customers on customers.customer_id = transports.fk_customer_id

SELECT * FROM payments WHERE amount < 25

SELECT * FROM dates where recieve_date < NOW()

