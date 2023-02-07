USE littlelemon;
create table bookings (
	BookingID INT,
    BookingDate DATE,
	TableNumber int,
	CustomerID INT
);
insert into bookings (BookingID,BookingDate, TableNumber,  CustomerID) values (1, '2022-10-10', 5, 1);
insert into bookings (BookingID,BookingDate, TableNumber,  CustomerID) values (2,  '2022-11-12',3, 2);
insert into bookings (BookingID,BookingDate, TableNumber,  CustomerID)  values (3,  '2023-10-11', 2, 3);
insert into bookings (BookingID,BookingDate, TableNumber,  CustomerID)  values (4, '2022-10-13', 2, 4);



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

CALL AddValidBooking('2022-10-13', 2);


drop procedure AddValidBooking;
DELIMITER //
CREATE PROCEDURE AddValidBooking(IN bookDate Date, IN id INT)
BEGIN
DECLARE record INT;
SELECT BookingID INTO record FROM Bookings 
	WHERE BookingDate = bookDate and TableNumber = id;
INSERT INTO Bookings(`BookingID`,`BookingDate`,`TableNumber`,`CustomerID`)
VALUES (5,bookDate,id,6);
IF BookingID > 0 THEN
ROLLBACK;
SELECT CONCAT('Table ',id,' booked successfully');
ELSEif BookingID is null THEN
COMMIT;
SELECT CONCAT('Table ',id,' is already booked - booking cancelled');
END IF;
END //
DELIMITER ;



drop procedure AddValidBooking;
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
CALL AddValidBooking('2022-10-29', 6);


UPDATE littlelemon.bookings SET BookingDate = '2022-10-30' WHERE BookingID = 9;


drop procedure UpdateBooking;
DELIMITER //
CREATE PROCEDURE UpdateBooking(IN bookID INT, IN bookDate Date)
BEGIN
UPDATE Bookings SET BookingDate = bookDate WHERE BookingID = bookID;
SELECT concat('Booking ', bookID ,' updated');
END //
DELIMITER ;
CALL UpdateBooking(9,'2022-10-30');

DELIMITER //
CREATE PROCEDURE CancelBooking(IN bookID INT)
BEGIN
DELETE FROM Bookings  WHERE BookingID = bookID;
SELECT concat('Booking ', bookID ,' canceled');
END //
DELIMITER ;
CALL CancelBooking(9);