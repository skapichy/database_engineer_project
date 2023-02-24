USE little_lemondb;


DELIMITER //

CREATE PROCEDURE CancelBooking (IN booking_id INT)
BEGIN
START TRANSACTION;
IF NOT EXISTS(SELECT 1 FROM Bookings WHERE (BookingID = booking_id))
THEN
SELECT CONCAT("Booking " , booking_id, " Does Not Exist.") AS `Message`;
ROLLBACK;
ELSE
DELETE FROM Bookings WHERE BookingID = booking_id;
COMMIT;
-- SELECT CONCAT("Booking ", booking_id ," cancelled.") AS `Confirmation`; 
END IF;
END //

DELIMITER ;




