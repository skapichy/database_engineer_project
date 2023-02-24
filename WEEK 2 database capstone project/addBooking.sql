USE little_lemondb;


DELIMITER //

CREATE PROCEDURE AddBooking (IN bookingIDVar INT, IN customerIDVar INT, IN bookingDateVar INT, IN tableNumVar INT)
BEGIN 
INSERT INTO BOOKINGS (booking_id, customer_id, staff_id, table_num, booking_date) VALUES (bookingIDVar, customerIDVar, 1, tableNumVar, bookingDateVar);
SELECT CONCAT('New booking added') AS Confirmation;
END //

DELIMITER ;




