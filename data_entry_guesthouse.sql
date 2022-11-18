-- addresses
INSERT INTO addresses(address_id, address_line1, address_line2, city, state, country, zipcode)
    VALUES 
	 (1,'203', 'Morni Appartments', 'Chandigarh','Punjab','India','239122'),
	 (2,'1099', 'Sunset Appartments', 'Nanded','Maharashtra','India','457329'),
	 (3,'123', 'Sunrise Appartments', 'Bhilai','Chattisgarh','India','135289'),
	 (4,'451', 'Galaxy Appartments', 'Pune','Maharashtra','India','675281'),
	 (5,'666', 'Suncity Appartments', 'Lucknow','UP','India','657329'),
	 (6,20400, 'Phoenix', NULL,'AZ','USA','AZ85027'),
	 (11,45, 'Vanier Park', 'Kitchener','ON','Canada','Sd3 d35'),
	 (12,41, 'Greenfield', 'London','ON','Canada','234 987'),
	 (13,89, 'Jacob Rd', 'Paris','ON','Canada','467 289'),
	 (14,85, 'Martin Street', 'Ottawa','BC','Canada','263 987'),
	 (15,78, 'Josseph St. Street', 'Guelph','BC','Canada','267 387'),
	 (16,156, 'James Road', NULL,'AZ','USA','263 762'),
	 (17,7598, 'Atomic Street', 'Ottawa','New York','USA','756 145'),
	 (18,5476, 'Saint Jake Rd', 'NULL','San Jose','USA','675 846'),
	 (19,7465, 'Thames Rd', 'NUll','Gujarat','India','145 895'),
	 (101,'A Quarters', 'IIT Patna', 'Bihta','Bihar','India','801103'),
	 (102,'B Quarters', 'IIT Patna', 'Bihta','Bihar','India','801103'),
	 (103,'C Quarters', 'IIT Patna', 'Bihta','Bihar','India','801103'),
	 (104,'D Quarters', 'IIT Patna', 'Bihta','Bihar','India','801103');
	 

-- pre filled data of room type, employee, guesthouses, department, guestHouse_services, 

INSERT INTO department(department_name, department_description)
    VALUES
	 ('Kitchen','cooking'),
	 ('Cleaning','sweep and mop'),
	 ('Front Staff','handle bookings and query resolution'),
	 ('Management','handles customer and resolve complaints'),
	 ('Commute','pick up and drop');

INSERT INTO room_type(room_type_name, room_cost)
    VALUES 
	 ('Standard Room','110'),
	 ('Standard Twin Room','120'),
	 ('Executive Room','140'),
	 ('Club Room','160'); 
	 
INSERT INTO guestHouse_services( service_name, service_description, service_cost, guestHouse_guestHouse_id)
    VALUES
	 ('24-hour Room Service','There will be 24-hour Room Service to take care of customers needs',20,1),
	 ('Currency Exchange','Foreign Currency Exchange facility available',80,1),
	 ('Laundry','Laundry/Dry Cleaning available same day',10,1),
	 ('Entertainment Room','Book and watch movies',50,2),
	 ('Sports Complex','Sports Complex access to all guests.',100,2),
	 ('Gym','Access to Gym.',140,2);

INSERT INTO employees(emp_first_name, emp_last_name, emp_designation, emp_contact_number, emp_email_address, department_department_id, addresses_address_id, guestHouse_guestHouse_id)
    VALUES 
     ('Rushi','Langde','Waiter','4545444443','rushi@gmail.com',1,11,1),
     ('Ashish','Murthy','Manager','6565646463','ashish@gmail.com',4,12,1),
     ('Parth','Gupta','Cashier','7575747473','parth@gmail.com',3,13,1),
     ('Nikhil','Chobey','Cook','8585848483','nikhil@gmail.com',1,14,1),
     ('Khanjan','Pathak','Manager','9595949493','khanjan@gmail.com',4,15,2);
     
	
-- guesthouse have address id starting from 100
INSERT INTO guestHouse( guestHouse_name, guestHouse_contact_number, guestHouse_description, guestHouse_floor_count, guestHouse_room_capacity, addresses_address_id, check_in_time, check_out_time)
    VALUES 
	 ('A Quarters','9595858575','A 5 min walk from gate 1', 10, 45, 101, '12:00:00','23:00:00'),
	 ('B Quarters','9494848474','A 15 min walk from gate 1', 10, 55, 102, '12:00:00','23:00:00'),
	 ('C Quarters','9393838373','A 5 min walk from gate 2', 10, 50, 103, '12:00:00','23:00:00'),
	 ('D Quarters','9292828272','A 15 min walk from gate 2', 10, 40, 104, '12:00:00','23:00:00');

-- preinserted guest details
INSERT INTO guests(guest_first_name, guest_last_name, guest_contact_number, guest_email_address, guest_credit_card, guest_id_proof, addresses_address_id)
    VALUES 
	 ('Gaurav','Garg','8979695949','gaurav@gmail.com',NULL,'Driving License',1),
	 ('Saurav','Dudhate','8878685848','saurav@gmail.com',NULL,'Passport',2),
	 ('Shreyansh','Kumar','8777675747','sheru@gmail.com',NULL,'Aadhaar Card',3),
	 ('Anurag','Deshmane','8676665646','anurag@gmail.com',NULL,'Aadhaar Card',4),
	 ('Tingu','Aggarwal','8575655545','tingu@gmail.com',NULL,'Driving Lincense',5);

-- booking insetion will be done next
INSERT INTO bookings (booking_id, booking_date, duration_of_stay, check_in_date, check_out_date, booking_payment_type, total_rooms_booked, guestHouse_guestHouse_id, guests_guest_id, employees_emp_id, total_amount)
    VALUES
	 (1, '2022-08-08 00:00:00', '5', '2022-08-10 12:00:00', '2022-08-15 23:00:00', 'cash', 1, 101, 1, 2, '590'),
	 (2, '2012206-08 00:00:00', '20', '2022-06-08 12:00:00', '2022-06-28 23:00:00', 'card', 1, 101, 2, 2, '2300'),
	 (3, '2012206-08 00:00:00', '10', '2022-06-08 12:00:00', '2022-06-18 23:00:00', 'card', 1, 102, 1, 3, '1100'),
	 (4, '2022-06-08 00:00:00', '2', '2022-06-08 12:00:00', '2022-06-10 23:00:00', 'card', 1, 102, 4, 2, '290'),
	 (5, '2022-06-08 00:00:00', '3', '2022-06-08 12:00:00', '2022-06-11 23:00:00', 'card', 1, 102, 2, 3, '350'),
	 (6, '2022-06-08 00:00:00', '5', '2022-06-08 12:00:00', '2022-06-13 23:00:00', 'card', 1, 103, 3, 3, '570'),
	 (7, '2022-08-13 00:00:00', '2', '2022-06-13 12:00:00', '2022-06-15 23:00:00', 'cash', 2, 103, 5, 2, '280'),
	 (8, '2022-08-10 00:00:00', '3', '2022-08-11 12:00:00', '2022-08-13 23:00:00', 'card', 1, 103, 3, 2, '350'),
	 (9, '2022-08-10 00:00:00', '5', '2022-08-12 12:00:00', '2022-08-16 23:00:00', 'card', 1, 104, 4, 2, '570'),
	 (10, '2022-08-14 00:00:00', '2', '2022-08-15 12:00:00', '2022-08-17 23:00:00', 'cash', 2, 104, 5, 2, '280'),
	 (11, '2022-08-14 00:00:00', '5', '2022-08-16 12:00:00', '2022-08-21 23:00:00', 'cash', 1, 104, 1, 3, '590');


INSERT INTO rooms_mapping(room_id, room_number, rooms_type_rooms_type_id, guestHouse_guestHouse_id)
    VALUES 
	 (1,1001,1,101),
	 (2,1002,1,101),
	 (3,1003,1,101),
	 (4,1004,1,101),
	 (5,1005,1,101),
	 (6,1006,3,101),
	 (7,1007,3,101),
	 (8,1008,3,101),
	 (9,1009,3,101),
	 (10,1010,3,101),
	 (11,2001,1,102),
	 (12,2002,1,102),
	 (13,2003,1,102),
	 (14,2004,1,102),
	 (15,2005,1,102),
	 (16,2006,2,102),
	 (17,2007,2,102),
	 (18,2008,2,102),
	 (19,2009,2,102),
	 (20,2010,2,102),
	 (21,3001,2,103),
	 (22,3002,2,103),
	 (23,3003,2,103),
	 (24,3004,2,103),
	 (25,3005,2,103),
	 (26,3006,4,103),
	 (27,3007,4,103),
	 (28,3008,4,103),
	 (29,3009,4,103),
	 (30,3010,4,103),
	 (31,4001,2,104),
	 (32,4002,2,104),
	 (33,4003,2,104),
	 (34,4004,2,104),
	 (35,4005,2,104),
	 (36,4006,2,104),
	 (37,4007,2,104),
	 (38,4008,2,104),
	 (39,4009,2,104),
	 (40,4010,2,104);


INSERT INTO guestHouse_services_used_by_guests (guestHouse_services_service_id, bookings_booking_id) 
    VALUES 
     (1, 2),
     (2, 2),
     (3, 2),
     (4, 4),
     (6, 6),
     (1, 7),
     (4, 3),
     (5, 1),
     (3, 8),
     (1, 10);

INSERT INTO rooms_booked (bookings_booking_id, rooms_room_id) 
    VALUES 
    (1,1),
    (2,2),
    (3,11),
    (4,12),
    (5,13),
    (6,21),
    (7,22),
    (7,23),
    (8,24),
    (9,31),
    (10,32),
    (11,33);
    