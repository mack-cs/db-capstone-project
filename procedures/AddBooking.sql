CREATE PROCEDURE `AddBooking`(IN booking INT, IN bookDate Date, IN table_no INT,IN customer INT)
BEGIN
INSERT INTO Bookings(`BookingID`,`BookingDate`,`TableNumber`,`CustomerID`)
VALUES (booking,bookDate,table_no,customer);
SELECT 'New booking added' Confirmation;
END