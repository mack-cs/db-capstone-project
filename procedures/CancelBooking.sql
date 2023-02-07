DELIMITER //
CREATE PROCEDURE CancelBooking(IN bookID INT)
BEGIN
DELETE FROM Bookings  WHERE BookingID = bookID;
SELECT concat('Booking ', bookID ,' canceled');
END //
DELIMITER ;
CALL CancelBooking(9);