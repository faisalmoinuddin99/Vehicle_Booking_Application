-- Check which column is Primary key
SELECT column_name FROM all_cons_columns WHERE constraint_name = (
  SELECT constraint_name FROM all_constraints 
  WHERE UPPER(table_name) = UPPER('vehicle') AND CONSTRAINT_TYPE = 'P'
);


CREATE TABLE ROLE(
role_id CHAR(5) PRIMARY KEY,
role_name VARCHAR2(50) NOT NULL UNIQUE
)

CREATE TABLE user_role (
user_id CHAR(5) ,
role_id CHAR(5) ,
FOREIGN KEY ( user_id ) REFERENCES users(user_id),
FOREIGN KEY ( role_id ) REFERENCES role(role_id)
)
ALTER TABLE USER_ROLE
ADD CONSTRAINT user_id_role Primary key ( user_id, role_id );

desc user_role;


desc vehicle ;

/*
1. id p.k
2. model
3. user_id f.k
4. v_number p.k
5. color
6. fuel_type_id f.k
7. locataion_id f.k
8. v_image_url
*/

drop table vehicle;

CREATE TABLE Vehicle(
vehicle_id char(5) primary key, -- p.k
vehicle_model varchar2(50) not null,
user_id char(5) not null,
foreign key (user_id) REFERENCES Users(user_id),
vehicle_number char(10), 
vehicle_type_id char(5), 
foreign key (vehicle_type_id) references vehicle_type( vehicle_type_id) ,
color varchar2(50) not null,
fuel_type_id char(5) not null, 
foreign key (fuel_type_id) references fuel_type( fuel_type_id ),
locataion_id char(5) not null, 
FOREIGN key (locataion_id) references location ( location_id ),
vehicle_image_url varchar2(500) not null
)
Alter table vehicle
drop primary key;

drop table vehicle;

ALTER TABLE VEHICLE
ADD CONSTRAINT VEHICLE_ID_NUMBER PRIMARY KEY(VEHICLE_ID, VEHICLE_NUMBER);


create table vehicle_type(
vehicle_type_id char(5) primary key,
vehicle_type_name varchar2(50) not null unique,
cost_per_hour number(10,2) not null,
vehicle_category char(5) not null, 
foreign key (vehicle_category) references vehicle_category(vehicle_category)
)

create table vehicle_category (
vehicle_category char(5) primary key,
vehicle_category_name varchar2(50) not null unique
)

create table  fuel_type(
fuel_type_id char(5) primary key,
fuel_type varchar2(50) not null unique
)

create table location (
location_id char(5) primary key,
location_name varchar2(50) not null,
address varchar2(100) not null,
city_id char(5) not null, --f.k
FOREIGN key ( city_id) REFERENCES city(city_id),
pincode char(6) not null
)

create table city (
city_id char(5) primary key,
city_name varchar2(50) not null
)

desc booking

alter table booking
drop column LOCATION_NAME ;

alter table booking
add location_id char(5);

alter table booking
modify location_id char(5) not null ;

alter table booking
add foreign key (location_id) references location(location_id);


create table request_status(
request_status_id char(5) primary key,
request_status_name varchar2(50) not null unique
)

create table activity(
activity_id char(5) primary key,
activity_type varchar2(50) not null unique
)

create table requests(
request_id char(5) primary key,
user_id char(5) not null,
foreign key (user_id) references Users(user_id),
activity_id char(5) not null,
foreign key (activity_id) references activity(activity_id),
user_comments varchar2(50),
admin_comments varchar2(50),
request_status_id char(5) not null,
foreign key (request_status_id) references request_status(request_status_id),
vehicle_id char(5),
foreign key (vehicle_id) references Vehicle(vehicle_id)
)
