-- Author: Jasmin A. Smith
-- Date: 06/11/2020

-- Ensuring we are using the correct database
use hotel;
-- 1. Write a query that returns a list of reservations that end in July 2023,
-- including the name of the guest, the room number(s), and the reservation dates.
select
	CONCAT(g.firstName, ' ', g.lastName) guestName,
	r.RoomNumber,
	CONCAT(res.startDate, ' - ', res.endDate) reservationDate
from room r
inner join RoomReservation rRes on rRes.roomID = r.roomID
inner join reservation res on rRes.reservationID = res.reservationID
inner join guest g on res.guestID = g.guestID
where res.endDate between '2023-07-01' and '2023-07-31';
-- results
-- Jasmin Smith		205		2023-06-28 - 2023-07-02
-- Walter Holaway	204		2023-07-13 - 2023-07-14
-- Wilfred Vise		401		2023-07-18 - 2023-07-21
-- Bettyann Seery	303		2023-07-28 - 2023-07-29

-- 2. Write a query that returns a list of all reservations for rooms with a jacuzzi, 
-- displaying the guest's name, the room number, and the dates of the reservation.
select 
	CONCAT(g.firstName, ' ', g.lastName) guestName,
	r.roomNumber,
	a.amenityName,
	CONCAT(res.startDate, ' - ', res.endDate) reservationDate
from room r
inner join roomReservation rRes on rRes.roomID = r.roomID
inner join reservation res on rRes.reservationID = res.reservationID 
inner join guest g on res.guestID = g.guestID
inner join roomAmenity ra on ra.roomID = r.roomID
inner join amenity a on ra.amenityID = a.amenityID 
where a.amenityName = 'jacuzzi';
-- results (first four rows had 11 in total)
-- Karie Yang		201		Jacuzzi		2023-03-06 - 2023-03-07
-- Bettyann Seery	203		Jacuzzi		2023-02-05 - 2023-02-10
-- Karie Yang		203		Jacuzzi		2023-09-13 - 2023-09-15
-- Jasmin Smith		205		Jacuzzi		2023-06-28 - 2023-07-02

-- 3. Write a query that returns all the rooms reserved for a specific guest,
-- including the guest's name, the room(s) reserved, the starting date of the reservation, 
-- and how many people were included in the reservation. (Choose a guest's name from the existing data.)
select 
	CONCAT(g.firstName, ' ', g.lastName) guestName,
	r.roomNumber,
	res.startDate,
	(res.numAdults + res.numChildren) as totalPeople 
from room r
inner join roomReservation rRes on rRes.roomID = r.roomID
inner join reservation res on rRes.reservationID = res.reservationID
inner join guest g on res.guestID = g.guestID
where g.firstName = 'Zachery';
-- results
-- Zachery Luechtefeld	202	2023-03-29	4



-- 4. Write a query that returns a list of rooms, reservation ID, and per-room cost for each reservation. 
-- The results should include all rooms, whether or not there is a reservation associated with the room.
select 
	r.roomNumber,
    rRes.reservationID,
    res.cost
from room r
left outer join roomReservation rRes on r.roomID = rRes.roomID
left outer join reservation res on rRes.reservationID = res.reservationID;
-- results (first four rows had 26 in total)
-- 201	4	199.99
-- 202	7	349.98
-- 203	2	999.95
-- 203	21	399.98

-- 5. Write a query that returns all rooms with a capacity of three or more and 
-- that are reserved on any date in April 2023.
select
	CONCAT(g.firstName, ' ', g.lastName) guestName,
	r.maxOccupancy,
	CONCAT(res.startDate, ' - ', res.endDate) reservationDate
from room r
inner join roomReservation rRes on rRes.roomID = r.roomID
inner join reservation res on rRes.reservationID = res.reservationID 
inner join guest g on res.guestID = g.guestID
where res.startDate between '2023-04-01' and '2023-04-30'
and r.maxOccupancy > 3;
-- results
-- Walter Holaway, 4, 2023-04-09 - 2023-04-13


-- 6. Write a query that returns a list of all guest names and the number of reservations per guest,
-- sorted starting with the guest with the most reservations and then by the guest's last name.
 select 
	CONCAT(g.firstName, ' ', g.lastName) guestName,
    count(res.guestID) reservationCount
from guest g
left outer join reservation res on g.guestID = res.guestID
group by res.guestID
order by count(res.guestID) desc, g.lastName;
-- results (first four rows had 11 in total)
-- Mack Simmer		4
-- Bettyann Seery	3
-- Duane Cullison	2
-- Walter Holaway	2

-- 7. Write a query that displays the name, address, and phone number of a guest based on their phone number.
-- (Choose a phone number from the existing data.)
select
	firstName,
	lastName,
	address,
	city,
	stateID,
	phoneNumber 
from Guest
where phoneNumber = '(919) 389-6378';
-- results
-- Jasmin	Smith	136 Percheron Drive	Zebulon	NC	(919) 389-6378
