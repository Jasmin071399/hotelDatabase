-- Author: Jasmin A. Smith
-- Daye: 06/10/2020

-- Ensuring we are in the correct database
use hotel;

-- inserting data into tables with no foreign keys
insert into amenity (amenityName) values
	row('Microwave'),
    row('Jacuzzi'),
    row('Refrigerator'),
    row('Electric Oven');
-- select * from amenity;

insert into state (stateID, stateName) values
	row('IA', 'Iowa'),
    row('AK', 'Alaska'),
    row('TX', 'Texas'),
	row('NJ', 'New Jersey'),
    row('MI', 'Michigan'),
    row('CO', 'Colorado'),
    row('IL', 'Illinois'),
    row('RI', 'Rhode Island'),
    row('NY', 'New York'),
    row('VA', 'Virginia'),
    row('PA', 'Pennsylvania'),
    row('NC', 'North Carolina');
-- select * from state;
    
-- inserting data into nonbridge tables
    insert into guest(firstName, lastName, address, city, stateID, zip, phoneNumber) values
		row('Jasmin', 'Smith', '136 Percheron Drive', 'Zebulon', 'NC', '27597', '(919) 389-6378'),
        row('Mack', 'Simmer', '379 Old Shore Street', 'Council Bluffs', 'IA', '51501', '(291) 553-0508'),
        row('Bettyann', 'Seery', '750 Wintergreen Dr.', 'Wasilla', 'AK', '99654', '(478) 277-9632'),
        row('Duane', 'Cullison', '9662 Foxrun Lane', 'Harlingen', 'TX', '78552', '(308) 494-0198'),
        row('Karie', 'Yang', '9378 W. Augusta Ave.', 'West Deptford', 'NJ', '08096', '(214) 730-0298'),
        row('Aurore', 'Lipton', '762 Wild Rose Street', 'Saginaw', 'MI', '48601', '(377) 507-0974'),
        row('Zachery', 'Luechtefeld', '7 Poplar Dr.', 'Arvada', 'CO', '80003', '(814) 485-2615'),
        row('Jeremiah', 'Pendergrass', '70 Oakwood St.', 'Zion', 'IL', '60099', '(279) 491-0960'),
        row('Walter', 'Holaway', '7556 Arrowhead St.', 'Cumberland', 'RI', '02864', '(446) 396-6785'),
        row('Wilfred', 'Vise', '77 West Surrey Street', 'Oswego', 'NY', '13126', '(834) 727-1001'),
        row('Maritza', 'Tilton', '939 Linda Rd.', 'Burke', 'VA', '22015', '(446) 351-6860'),
        row('Joleen', 'Tison', '87 Queen St.', 'Drexel Hill', 'PA', '27597', '(231) 893-2755');
-- select * from guest;
    
insert into room(roomNumber, roomType, bedCount, standardOccupancy, maxOccupancy, adaAccessible, basePrice, extraPerPerson) values
	row(201, 'Double', 2, 2, 4, 0, 199.99, 10),
	row(202, 'Double', 2, 2, 4, 1, 174.99, 10),
    row(203, 'Double', 2, 2, 4, 0, 199.99, 10),
    row(204, 'Double', 2, 2, 4, 1, 174.99, 10),
    row(205, 'Single', 1, 2, 2, 0, 174.99, null),
    row(206, 'Single', 1, 2, 2, 1, 149.99, null),
    row(207, 'Single', 1, 2, 2, 0, 174.99, null),
    row(208, 'Single', 1, 2, 2, 1, 149.99, null),
    row(301, 'Double', 2, 2, 4, 0, 199.99, 10),
    row(302, 'Double', 2, 2, 4, 1, 174.99, 10),
    row(303, 'Double', 2, 2, 4, 0, 199.99, 10),
    row(304, 'Double', 2, 2, 4, 1, 174.99, 10),
    row(305, 'Single', 1, 2, 2, 0, 174.99, null),
    row(306, 'Single', 1, 2, 2, 1, 149.99, null),
    row(307, 'Single', 1, 2, 2, 0, 174.99, null),
    row(308, 'Single', 1, 2, 2, 1, 149.99, null),
    row(401, 'Suite', 3, 3, 8, 1, 399.99, 20),
    row(402, 'Suite', 3, 3, 8, 1, 399.99, 20);
-- select * from room;

insert into reservation(numAdults, numChildren, startDate, endDate, guestID, cost) values
	row(1, null, '2023-02-02', '2023-02-04', 2, 299.98),
    row(2, 1, '2023-02-05', '2023-02-10', 3, 999.95),
    row(2, null, '2023-02-22', '2023-02-24', 4, 349.98),
    row(2, 2, '2023-03-06', '2023-03-07', 5, 199.99),
    row(1, 1, '2023-03-17', '2023-03-20', 1, 524.97),
    row(3, null, '2023-03-18', '2023-03-23', 6, 924.95),
    row(2, 2, '2023-03-29', '2023-03-31', 7, 349.98),
    row(2, null, '2023-03-31', '2023-04-05', 8, 874.95),
    row(1, null, '2023-04-09', '2023-04-13', 9, 799.96),
    row(1, 1, '2023-04-23', '2023-04-24', 10, 174.99),
    row(2, 4, '2023-05-30', '2023-06-02', 11, 1199.97),
    row(2, null, '2023-06-10', '2023-06-14', 12, 599.96),
    row(1, null, '2023-06-10', '2023-06-14', 12, 599.96),
    row(3, null, '2023-06-17', '2023-06-18', 6, 184.99),
    row(2, null, '2023-06-28', '2023-07-02', 1, 699.96),
    row(3, 1, '2023-07-13', '2023-07-14', 9, 184.98),
    row(4, 2, '2023-07-18', '2023-07-21', 10, 1259.97),
    row(2, 1, '2023-07-28', '2023-07-29', 3, 199.99),
    row(1, null, '2023-08-30', '2023-09-01', 3, 349.98),
    row(2, null, '2023-09-16', '2023-09-17', 2, 149.99),
    row(2, 2, '2023-09-13', '2023-09-15', 5, 399.98),
    row(2, 2, '2023-11-22', '2023-09-15', 4, 1199.97),
    row(2, null, '2023-11-22', '2023-11-25', 2, 449.97),
    row(2, 2, '2023-11-22', '2023-11-25', 2, 599.97),
    row(2, null, '2023-12-24', '2023-12-28', 11, 699.96);
-- select * from reservation;

-- inserting data into bridge entity tables
insert into roomReservation(roomID, reservationID) values
	row(16, 1),
    row(3, 2),
    row(11, 3),
    row(1, 4),
    row(15, 5),
    row(10, 6),
    row(2, 7),
    row(12, 8),
    row(9, 9),
    row(7, 10),
    row(17, 11),
    row(6, 12),
    row(8, 13),
    row(12, 14),
    row(5, 15),
    row(4, 16),
    row(17, 17),
    row(11, 18),
    row(13, 19),
    row(8, 20),
    row(3, 21),
    row(17, 22),
    row(6, 23),
    row(9, 24),
    row(10, 25);
-- select * from roomreservation;
  
  insert into roomAmenity(roomID, amenityID) values
	row(1, 1),
    row(1, 2),
    row(2, 3),
    row(3, 1),
    row(3, 2),
    row(4, 3),
    row(5, 1),
    row(5, 2),
    row(5, 3),
    row(6, 1),
    row(6, 3),
    row(7, 1),
    row(7, 2),
    row(7, 3),
    row(8, 1),
    row(8, 3),
    row(9, 1),
    row(9,2),
    row(10, 3),
    row(11, 1),
    row(11, 2),
    row(12,3),
    row(13, 1),
    row(13, 2),
    row(13, 3),
    row(14, 1),
    row(14, 2),
    row(15, 1),
    row(15, 2),
    row(15, 3),
    row(16, 1),
    row(16, 3),
    row(17, 1),
    row(17, 3),
    row(17, 4),
    row(18, 1),
    row(18, 3),
    row(18, 4);
-- select * from roomamenity;
    
    
-- Disabling MYSQL's safe updates
set SQL_SAFE_UPDATES = 0;

-- Deleting Jeremiah from roomReservation, so there is no ghost data
delete from roomReservation
where reservationId = 8;

-- Deleting Jeremiah from reservation, so there is no ghost data
delete from Reservation
where reservationId = 8;

-- Now can finally delete Jeremiah 
delete from guest
where guestId = 8;

-- Reactivates MYSQL's safe updates so there is no accidents
SET SQL_SAFE_UPDATES = 1;