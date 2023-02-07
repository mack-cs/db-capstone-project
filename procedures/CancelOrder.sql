DELIMITER //
CREATE PROCEDURE CancelOrder(IN id INT)
BEGIN
DELETE  FROM littlelemon.Orders WHERE OrderID = id;
SELECT CONCAT('Order ', id,' cancelled') as Confirmation;
END //
DELIMITER ;