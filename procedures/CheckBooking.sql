DELIMITER //
CREATE PROCEDURE CheckBooking(IN bookDate Date, IN id INT)
BEGIN
SELECT
CASE
	WHEN EXISTS (SELECT BookingDate,TableNumber FROM littlelemon.bookings
					WHERE 
					BookingDate = bookDate and TableNumber = id)
	THEN CONCAT('Table ',id,' is already booked')
    ELSE CONCAT('Table ',id,' is available')
END as 'Booking status';
END //
DELIMITER ;