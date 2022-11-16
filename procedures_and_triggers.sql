-- procedure to get request status

delimiter |
create procedure getRequestStatus(in u_name varchar(30))
begin

SELECT a.pb_id as id,type_of_service,status from Billrequests a LEFT JOIN Pendingbills b ON
a.pb_id=b.pb_id WHERE store_id in (SELECT store_id FROM Shopkeepers WHERE username = u_name);

SELECT lic_id as id,status from License_ext_req WHERE lic_id in (SELECT lic_id from
License WHERE store_id in (SELECT store_id FROM Shopkeepers WHERE username = u_name));

end |
delimiter ;

-- procedure to update rating in Stores on receiving new feedback for a particular store

DELIMITER |
CREATE PROCEDURE updateRating(IN SID INT)
BEGIN
DECLARE s,a,q,p,c FLOAT DEFAULT 0;
SELECT AVG(service),AVG(availability),AVG(quality),AVG(price),AVG(conduct) INTO
s,a,q,p,c FROM Feedback WHERE store_id=SID;
UPDATE Stores SET rating=((s+a+q+p+c)/5.0) WHERE store_id=SID;
END |
DELIMITER ;

-- procedure to add new store (only for admin)

delimiter |
create procedure addStore(in store_name varchar(10),in store_location varchar(10), in st_category varchar(10),in st_availability text)
begin
insert into Stores(name,location,category,availability) values (store_name,store_location,st_category,st_availability);
end |
delimiter ;

-- procedure to add shopkeeper details

delimiter |
create procedure addShopkeepers(in sname varchar(10),in s_store_id int, in s_phone_no bigint, in st_sec_pass_id varchar(20), in st_sec_pass_exp date)
begin

    declare c int;
    select count(*) into c from (select a.name,a.store_id,a.phone_no,a.sec_pass_id,a.sec_pass_exp from Shopkeepers a WHERE a.name = sname and
    a.store_id=s_store_id and a.phone_no=s_phone_no and a.sec_pass_id=st_sec_pass_id and a.sec_pass_exp=st_sec_pass_exp) as tbl ;

    if (c>0) then
    SIGNAL SQLSTATE '45000'
	SET MESSAGE_TEXT = 'USER ALREADY EXISTS!';

	else
	insert into Shopkeepers(name,store_id,phone_no,sec_pass_id,sec_pass_exp) values (sname,s_store_id,s_phone_no,st_sec_pass_id,st_sec_pass_exp);

	end if;

end |
delimiter ;

-- Trigger to create a new shopkeeper row on registering under market services

DELIMITER $$
CREATE TRIGGER insertShopkeeper
AFTER INSERT
ON Users FOR EACH ROW
BEGIN
IF(NEW.role_id=3) THEN
INSERT INTO Shopkeepers(username) VALUES (new.username);
END IF;
END$$
DELIMITER ;
