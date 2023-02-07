DELIMITER //
CREATE PROCEDURE UpdateBooking(IN bookID INT, IN bookDate Date)
BEGIN
UPDATE Bookings SET BookingDate = bookDate WHERE BookingID = bookID;
SELECT concat('Booking ', bookID ,' updated');
END //
DELIMITER ;
CALL UpdateBooking(9,'2022-10-30');
