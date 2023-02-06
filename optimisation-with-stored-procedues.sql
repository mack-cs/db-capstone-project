CREATE PROCEDURE GetMaxQuantity()
SELECT
	MAX(Quantity)
FROM
	ORDERS;
call GetMaxQuantity();

PREPARE GetOrderDetail FROM 'SELECT OrderID, Quantity, BillAmount FROM little_lemon_db.Orders WHERE OrderID = ?';
SET @id = 3;
EXECUTE GetOrderDetail USING @id;

DELIMITER //
CREATE PROCEDURE CancelOrder(IN id INT)
BEGIN
DELETE  FROM littlelemon.Orders WHERE OrderID = id;
SELECT CONCAT('Order ', id,' cancelled') as Confirmation;
END //
DELIMITER ;

CALL CancelOrder(30);
