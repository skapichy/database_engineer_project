USE little_lemondb;

CREATE PROCEDURE GetMaxQuantity()
	SELECT MAX(quantity) AS MaxQuantityInOrder
	FROM orders;

CALL GetMaxQuantity();