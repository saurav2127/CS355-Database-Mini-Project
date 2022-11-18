CREATE TABLE addresses (
  address_id INT NOT NULL,
  address_line1 VARCHAR(100) NULL,
  address_line2 VARCHAR(100) NULL,
  city VARCHAR(45) NULL,
  state VARCHAR(45) NULL,
  country VARCHAR(45) NULL,
  zipcode VARCHAR(8) NULL,
  PRIMARY KEY (address_id)
);

CREATE TABLE guestHouse (
  guestHouse_id INT NOT NULL AUTO_INCREMENT,
  guestHouse_name VARCHAR(45) NULL,
  guestHouse_contact_number VARCHAR(12) NULL,
  guestHouse_description VARCHAR(100) NULL,
  guestHouse_floor_count INT NULL,
  guestHouse_room_capacity INT NULL,
  addresses_address_id INT NOT NULL ,
  check_in_time TIME NULL,
  check_out_time TIME NULL,
  PRIMARY KEY (guestHouse_id, addresses_address_id),
  CONSTRAINT fk_guestHouses_addresses1
    FOREIGN KEY (addresses_address_id)
    REFERENCES addresses (address_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
COMMENT = '		';

CREATE INDEX fk_guestHouses_addresses1_idx ON guestHouse (addresses_address_id ASC);


CREATE TABLE room_type (
  room_type_id INT NOT NULL AUTO_INCREMENT,
  room_type_name VARCHAR(45) NULL,
  room_cost DECIMAL(10,2) NULL,
  PRIMARY KEY (room_type_id)
);

CREATE TABLE rooms_mapping (
  room_id INT NOT NULL,
  room_number INT(4) NULL,
  rooms_type_rooms_type_id INT NOT NULL,
  guestHouse_guestHouse_id INT NOT NULL,
  available int default 1,
  PRIMARY KEY (room_id, rooms_type_rooms_type_id, guestHouse_guestHouse_id),
  CONSTRAINT fk_rooms_rooms_type1
    FOREIGN KEY (rooms_type_rooms_type_id)
    REFERENCES room_type (room_type_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_rooms_guestHouse1
    FOREIGN KEY (guestHouse_guestHouse_id)
    REFERENCES guestHouse (guestHouse_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

CREATE INDEX fk_rooms_rooms_type1_idx ON rooms_mapping (rooms_type_rooms_type_id ASC);
CREATE INDEX fk_rooms_guestHouse1_idx ON rooms_mapping (guestHouse_guestHouse_id ASC);

CREATE TABLE guests(
  guest_id INT NOT NULL AUTO_INCREMENT,
  guest_first_name VARCHAR(45) NULL,
  guest_last_name VARCHAR(45) NULL,
  guest_contact_number VARCHAR(12) NULL,
  guest_email_address VARCHAR(45) NULL,
  guest_credit_card VARCHAR(45) NULL,
  guest_id_proof VARCHAR(45) NULL,
  addresses_address_id INT NOT NULL,
  PRIMARY KEY (guest_id, addresses_address_id),
  CONSTRAINT fk_guests_addresses1
    FOREIGN KEY (addresses_address_id)
    REFERENCES addresses (address_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
COMMENT = '	';

CREATE INDEX fk_guests_addresses1_idx ON guests (addresses_address_id ASC);

CREATE TABLE department (
  department_id INT NOT NULL AUTO_INCREMENT,
  department_name VARCHAR(45) NULL,
  department_description VARCHAR(100) NULL,
  PRIMARY KEY (department_id)
);

CREATE TABLE employees (
  emp_id INT NOT NULL AUTO_INCREMENT,
  emp_first_name VARCHAR(45) NULL,
  emp_last_name VARCHAR(45) NULL,
  emp_designation VARCHAR(45) NULL,
  emp_contact_number VARCHAR(12) NULL,
  emp_email_address VARCHAR(45) NULL,
  department_department_id INT NOT NULL,
  addresses_address_id INT NOT NULL,
  guestHouse_guestHouse_id INT NOT NULL,
  PRIMARY KEY (emp_id, department_department_id, addresses_address_id, guestHouse_guestHouse_id),
  CONSTRAINT fk_employees_services1
    FOREIGN KEY (department_department_id)
    REFERENCES department (department_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_employees_addresses1
    FOREIGN KEY (addresses_address_id)
    REFERENCES addresses (address_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_employees_guestHouse1
    FOREIGN KEY (guestHouse_guestHouse_id)
    REFERENCES guestHouse (guestHouse_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

CREATE INDEX fk_employees_services1_idx ON employees (department_department_id ASC);
CREATE INDEX fk_employees_addresses1_idx ON employees (addresses_address_id ASC);
CREATE INDEX fk_employees_guestHouse1_idx ON employees (guestHouse_guestHouse_id ASC);

CREATE TABLE bookings (
  booking_id INT NOT NULL,
  booking_date DATETIME NULL,
  duration_of_stay VARCHAR(10) NULL,
  check_in_date DATETIME NULL,
  check_out_date DATETIME NULL,
  booking_payment_type VARCHAR(45) NULL,
  total_rooms_booked INT NULL,
  guestHouse_guestHouse_id INT NOT NULL,
  guests_guest_id INT NOT NULL,
  employees_emp_id INT NOT NULL,
  total_amount DECIMAL(10,2) NULL,
  PRIMARY KEY (booking_id, guestHouse_guestHouse_id, guests_guest_id, employees_emp_id),
  CONSTRAINT fk_bookings_guestHouse1
    FOREIGN KEY (guestHouse_guestHouse_id)
    REFERENCES guestHouse (guestHouse_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_bookings_guests1
    FOREIGN KEY (guests_guest_id)
    REFERENCES guests (guest_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_bookings_employees1
    FOREIGN KEY (employees_emp_id)
    REFERENCES employees (emp_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

CREATE INDEX fk_bookings_guestHouse1_idx ON bookings (guestHouse_guestHouse_id ASC);
CREATE INDEX fk_bookings_guests1_idx ON bookings (guests_guest_id ASC);
CREATE INDEX fk_bookings_employees1_idx ON bookings (employees_emp_id ASC);

CREATE TABLE rooms_booked(
  rooms_booked_id INT NOT NULL AUTO_INCREMENT,
  bookings_booking_id INT NOT NULL,
  rooms_room_id INT NOT NULL,
  PRIMARY KEY (rooms_booked_id, bookings_booking_id, rooms_room_id),
  CONSTRAINT fk_rooms_booked_bookings1
    FOREIGN KEY (bookings_booking_id)
    REFERENCES bookings (booking_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_rooms_booked_rooms1
    FOREIGN KEY (rooms_room_id)
    REFERENCES rooms_mapping(room_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

CREATE INDEX fk_rooms_booked_bookings1_idx ON rooms_booked (bookings_booking_id ASC);
CREATE INDEX fk_rooms_booked_rooms1_idx ON rooms_booked (rooms_room_id ASC);

CREATE TABLE guestHouse_services (
  service_id INT NOT NULL AUTO_INCREMENT,
  service_name VARCHAR(45) NULL,
  service_description VARCHAR(100) NULL,
  service_cost DECIMAL(10,2) NULL,
  guestHouse_guestHouse_id INT NOT NULL,
  PRIMARY KEY (service_id, guestHouse_guestHouse_id),
  CONSTRAINT fk_guestHouse_services_guestHouse1
    FOREIGN KEY (guestHouse_guestHouse_id)
    REFERENCES guestHouse (guestHouse_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

CREATE INDEX fk_guestHouse_services_guestHouse1_idx ON guestHouse_services (guestHouse_guestHouse_id ASC);
	
CREATE TABLE guestHouse_services_used_by_guests (
  service_used_id INT NOT NULL AUTO_INCREMENT,
  guestHouse_services_service_id INT NOT NULL,
  bookings_booking_id INT NOT NULL,
  PRIMARY KEY (service_used_id, guestHouse_services_service_id, bookings_booking_id),
  CONSTRAINT fk_guestHouse_services_has_bookings_guestHouse_services1
    FOREIGN KEY (guestHouse_services_service_id)
    REFERENCES guestHouse_services (service_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_guestHouse_services_has_bookings_bookings1
    FOREIGN KEY (bookings_booking_id)
    REFERENCES bookings (booking_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

CREATE INDEX fk_guestHouse_services_has_bookings_bookings1_idx ON guestHouse_services_used_by_guests (bookings_booking_id ASC);
CREATE INDEX fk_guestHouse_services_has_bookings_guestHouse_services1_idx ON guestHouse_services_used_by_guests (guestHouse_services_service_id ASC);

CREATE TABLE Bookings_Audit(
 audit_id int NOT NULL PRIMARY KEY AUTO_INCREMENT,
 booking_id INT NOT NULL,
 booking_date DATETIME NULL,
 duration_of_stay VARCHAR(10) NULL,
 check_in_date DATETIME NULL,
 check_out_date DATETIME NULL,
 booking_payment_type VARCHAR(45) NULL,
 total_rooms_booked INT NULL,
 guestHouse_guestHouse_id INT NOT NULL,
 guests_guest_id INT NOT NULL,
 employees_emp_id INT NOT NULL,
 total_amount DECIMAL(10,2) NULL,
 action_type VARCHAR(50) NOT NULL,
 date_updated DATETIME NOT NULL
);