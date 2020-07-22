-- Author: Jasmin A Smith
-- Date: 06/10/2020
-- Drops any database with the name hotel. Creates a new hotel DB
-- And ensures it is being used when creating a table
drop database if exists hotel;
create database hotel;
use hotel;
-- We will start creating tables that do not have any foreign keys

create table room(
	roomID int auto_increment,
    roomNumber int,
    roomType varchar(6) not null,
    bedCount int not null,
    standardOccupancy int not null,
    maxOccupancy int not null,
    adaAccessible bool not null,
    basePrice decimal(5,2) not null,
    extraPerPerson decimal(4,2),
constraint pk_room
	primary key (roomID)
);

create table amenity(
	amenityID int auto_increment,
    amenityName varchar(30) not null,
constraint pk_amenity
	primary key (amenityID)
);

create table state(
	stateID char(2),
    stateName varchar(30) not null,
constraint pk_state
	primary key (stateID)
);

-- Making entity tables that are not bridge tables

create table guest(
	guestID int auto_increment,
	firstName varchar(25) not null,
    lastName varchar(25) not null,
    address varchar(100),
    city varchar(25),
    stateID char(2),
    zip char(5),
    phoneNumber varchar(20) not null,
constraint pk_guest
	primary key (guestID),
constraint fk_guest_state
	foreign key (stateID) 
    references state(stateID)
);

create table reservation(
	reservationID int auto_increment,
	numAdults int not null,
    numChildren int,
    startDate date not null,
    endDate date not null,
    guestID int not null,
    cost decimal(6,2)not null,
constraint pk_reservation
	primary key (reservationID),
constraint fk_reservation_guest
	foreign key (guestID) 
    references guest(guestID)
);

-- Creating the bridge tables 

create table roomReservation (
roomID int not null,
reservationID int not null,
constraint pk_roomReservation
primary key (roomID, reservationID),
constraint fk_roomReservation_room
foreign key (roomID)
references room(roomID),
constraint fk_roomReservation_reservation
foreign key (reservationID)
references reservation(reservationID)
);

create table roomAmenity (
roomID int not null,
amenityID int not null,
constraint pk_roomAmenity
primary key (roomID, amenityID),
constraint fk_roomAmenity_room
foreign key (roomID)
references room(roomID),
constraint fk_roomAmenity_amenity
foreign key (amenityID)
references amenity(amenityID)
);

