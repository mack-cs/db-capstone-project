CREATE PROCEDURE GetMaxQuantity()
SELECT
	MAX(Quantity)
FROM
	ORDERS;
call GetMaxQuantity();


