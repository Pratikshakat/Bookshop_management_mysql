-- BOOK STORE MANAGEMENT DATA ANALYSIS

-- Create database for data analysis,
-- if exists then drop it and create then use it for project

Show databases;
drop database if exists library_management;
create database library_management;
use library_management;

/* Create table for analysis */

set sql_mode = "";

-- Create table book

drop table if exists book;

create table book(
                  bookid varchar(10),
                  title varchar(70),
                  authid varchar(10)
                  );

desc book;

select * from book;

-- Create table info
drop table if exists info;

create table info(bookid varchar(10),
                  bookid1 varchar(3),
                  bookid2 int,
                  genre varchar(20),
                  seriesid varchar(15),
                  volume_number int8,
                  staff_comment varchar(500)
                  );
                  
 desc info;

 select * from info;

 set sql_safe_updates = 0;

 update info set volume_number = NULL where volume_number = 0;

 set sql_safe_updates = 1;
 
 -- Create table edition
 
drop table if exists edition;

create table edition(isbn varchar(20),
					 bookid varchar(10),
                     format varchar(30),
                     pubid varchar(5),
                     publication_date varchar(10),
                     pages int, 
                     print_run_size_k int,
                     price float
                     );

desc edition;
                     
select * from edition;    

set sql_safe_updates = 0;

update edition set publication_date = str_to_date(publication_date, "%d-%m-%Y");

alter table edition
change column publication_date publication_date date;

set sql_safe_updates = 1;                 

-- Create table Author if exists then drop and create it to use in database

drop table if exists author;

create table author(
                    authid varchar(10),
                    firstname varchar(20),
                    lastname varchar(20),
                    country_of_residence varchar(25),
                    hrs_writing_per_day float
                    );
                    
desc author;

select * from author;     


-- Create table publisher if exists then drop it and create to use in database

drop table if exists publisher;

create table publisher(
                       pubid varchar(5),
                       publishing_house varchar(30),
                       city varchar(15),
                       state varchar(15),
                       country varchar(15),
                       year_established int, 
                       marketing_spend varchar(15)
                       );
                       
desc publisher;

select * from publisher;

set sql_safe_updates = 1;


-- Create table Award if exists then drop and create to use in database

drop table if exists award;

create table award(
                   title varchar(70),
                   award_name varchar(30),
                   year_won int
                   );
                   
select * from award;

desc award;

show tables;				

set sql_safe_updates = 1;

-- Create table Chechouts if exists then drop and create to use in database

drop table if exists checkouts;

create table checkouts(
                       bookid varchar(10),
                       checkoutmonth int,
                       number_of_checkouts int
                       );
                       
select * from checkouts;

desc checkouts;

show tables;

set sql_safe_updates = 1;


-- Create table Ratings if exists then drop and create to use in database

drop table if exists ratings;

create table ratings(
                     bookid varchar(10),
                     ratings int,
                     reviewerid int,
                     reviewid int
                     );

desc ratings;

select * from ratings;

set sql_safe_updates = 1;


-- Create table Series if exists then drop it and create for use in database

drop table if exists series;

create table series(
                    seriesid varchar(10),
					series_name varchar(30),
                    planned_volumes int,
                    book_tour_events int
                    );
                    
desc series;

select * from series;

set sql_safe_updates = 1;

show tables;

-- Create table LibraryProfiles if exists then drop it and create for use in database

drop table if exists libraryprofiles;

create table libraryprofiles(
                             staff_type varchar(30),
                             number_of_staff int,
                             library varchar(30),
                             library_id varchar(10),
                             consortium_member varchar(3),
                             private varchar(3)
                             );
                             
desc libraryprofiles;

select * from libraryprofiles;

set sql_safe_updates = 1;

show tables;         

-- Create table catalog if exists then drop table and create new one.

drop table if exists catalog;

create table catalog(
                     loan_id varchar(25),
                     isbn varchar(20),
                     library_id varchar(5),
                     number_of_copies int
                     );

desc catalog;

select * from catalog;                     

set sql_safe_updates = 1;