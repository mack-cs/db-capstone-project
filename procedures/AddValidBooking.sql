DELIMITER //
CREATE PROCEDURE AddValidBooking(IN bookDate Date, IN id INT)
BEGIN
DECLARE record INT;
START TRANSACTION;
SELECT BookingID INTO record FROM Bookings 
	WHERE BookingDate = bookDate and TableNumber = id LIMIT 1;
INSERT INTO Bookings(`BookingID`,`BookingDate`,`TableNumber`,`CustomerID`)
VALUES (6,bookDate,id,9);
IF record > 0 THEN
ROLLBACK;
SELECT CONCAT('Table ',id,' is already booked - booking cancelled') AS 'Booking Status';
ELSEif record is null THEN
COMMIT;
SELECT CONCAT('Table ',id,' booked successfully') AS 'Booking Status';
END IF;
END //
DELIMITER ;