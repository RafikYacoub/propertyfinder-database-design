LOAD DATA INFILE 'D:/Uni/fall 2022/database/project/MS2/work_for_filtered.csv'
INTO TABLE work_for
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
#IGNORE 1 ROWS
(agent_phone_number,broker_company_name);
select * from work_for;

delete from work_for;


LOAD DATA INFILE 'D:/Uni/fall 2022/database/project/MS2/agents_filtered.csv'
INTO TABLE agent
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
#IGNORE 1 ROWS
(name,phone_no);
select * from agent;

delete from agent;


LOAD DATA INFILE 'D:/Uni/fall 2022/database/project/MS2/dev_proj_filtered.csv'
INTO TABLE development_project
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
#IGNORE 1 ROWS
(name,location,developer,size_range_min,size_range_min,starting_price,completion_status);
select * from development_project;

delete from development_project;


insert into development_project values
("La Verde New Capital","La Verde Developments","Cairo, New Capital City, New Capital Compounds",1880000,75,462,"Q4-2023"
);


LOAD DATA INFILE 'D:/Uni/fall 2022/database/project/MS2/proj_types_filtered.csv'
INTO TABLE development_project_types
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
#IGNORE 1 ROWS
(project_name,properties_types);
select * from development_project_types;


LOAD DATA INFILE 'D:/Uni/fall 2022/database/project/MS2/prop_test_filtered2.csv'
INTO TABLE property
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
#IGNORE 1 ROWS
(ID,area,location,type,bedrooms_number,bathrooms_number,price,agent_phone_no,@vone,@Vtwo)
SET  
development_project_name = NULLIF(@vone,'NULL'),
description = NULLIF(@vtwo,'NULL\r');

select * from property;
use property_finder;
insert into user values ('test', 'test','M','new cairo','email@email.com','1999-10-9');

select * from user;

delete from property;

SET FOREIGN_KEY_CHECKS=0;
LOAD DATA INFILE 'D:/Uni/fall 2022/database/project/MS2/prop_amen_filtered.csv'
INTO TABLE property_amenities
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
#IGNORE 1 ROWS
(property_ID,property_location,property_area,amenity);
select * from property_amenities;

delete from property_amenities;

LOAD DATA INFILE 'D:/Uni/fall 2022/database/project/MS2/user_test.csv'
INTO TABLE user
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
#IGNORE 1 ROWS
(username,name,gender,address,email,date_of_birth);
select * from user;

SET SQL_SAFE_UPDATES = 0;
delete from user;

LOAD DATA INFILE 'D:/Uni/fall 2022/database/project/MS2/user_focus_areas.csv'
INTO TABLE user_focus_areas
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
#IGNORE 1 ROWS
(user_email,focus_areas);
select * from user_focus_areas;

delete from user_focus_areas;

LOAD DATA INFILE 'D:/Uni/fall 2022/database/project/MS2/csv/broker_company_csv_files/company_test.csv'
INTO TABLE broker_company
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(name, phone_no, active_listing, location, @vfive)
SET description = NULLIF(@vfive,'null\r')
;
select * from broker_company;

delete from broker_company;

LOAD DATA INFILE 'D:/Uni/fall 2022/database/project/MS2/shortlisted.csv'
INTO TABLE shortlisted
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
#IGNORE 1 ROWS
;
select * from shortlisted;

LOAD DATA INFILE 'D:/Uni/fall 2022/database/project/MS2/feedback.csv'
INTO TABLE provide_feedback
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
#IGNORE 1 ROWS
;
select * from provide_feedback;


drop schema property_finder;


create database if not exists property_finder;

use property_finder;

create table user (
username varchar(20) not null,
name varchar(20) not null,
gender char(3),
address varchar(100),
email varchar(40) not null primary key,
date_of_birth date
);

create table user_focus_areas (
user_email varchar(40) not null,
focus_areas varchar(40) not null,
primary key (user_email, focus_areas),
FOREIGN KEY(user_email) REFERENCES user(email) 
on delete cascade on update cascade
);

create table development_project (
name varchar(100) not null primary key,
location varchar(100),
developer varchar(60),
size_range_min int,
size_range_max int,
starting_price int,
completion_status  varchar(30)
);


create table development_project_types (
project_name varchar(100) not null,
properties_types varchar(20),
primary key(project_name,properties_types),
FOREIGN KEY(project_name) REFERENCES development_project(name) 
on delete cascade on update cascade
);


create table broker_company(
name varchar(100) not null primary key,
phone_no varchar(40),
active_listing int,
location varchar(250),
description varchar(6000)
);

create table agent(
name varchar(55) not null,
phone_no varchar(45) not null primary key
);


create table work_for
(
agent_phone_number varchar(45) not null,
broker_company_name varchar(70) not null,
primary key (agent_phone_number,broker_company_name)

);

create table provide_feedback (
agent_phone_no varchar(40) not null,
user_email varchar(40) not null,
feedback_date date not null,
rate integer not null CHECK (rate >= 0 AND rate <= 10),
review varchar(1000) not null,
primary key (user_email, agent_phone_no, feedback_date)
);

create table property(
ID varchar(50) not null ,
area int not null,
location varchar(200) not null,
type varchar(20) not null,
bedrooms_number int, 
bathrooms_number int,
listing_date date,
price int,
agent_phone_no varchar(45) not null,
development_project_name varchar(100),
description varchar(6000),
primary key(ID,location,area)
);


create table property_amenities
(
property_ID varchar(50) not null, 
property_location varchar(200) not null, 
property_area int not null,
amenity varchar(40) not null,

primary key (property_ID,property_location,property_area,amenity),

FOREIGN KEY (property_ID,property_location,property_area) REFERENCES property(ID,location,area)
on delete cascade on update cascade
);

create table shortlisted
(
property_ID varchar(50) not null,
property_location varchar(200) not null, 
property_area int not null,
user_email varchar(40) not null,

primary key (user_email,property_ID,property_location,property_area)

);
