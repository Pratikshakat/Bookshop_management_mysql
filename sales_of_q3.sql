SELECT * FROM library_management.sales_q3;

-- Create table Sales Quarter 3 if exists then drop and create to use in database

drop table if exists sales_q3;

create table sales_q3( 
                      sale_date varchar(10),
                      isbn varchar(30),
                      discount varchar(5) default null,
                      itemid varchar(30),
                      orderid varchar(20)
                      );

desc sales_q3;

select * from sales_q3;


set sql_safe_updates = 0;

update sales_q3 
set sale_date = str_to_date(sale_date, "%d-%m-%Y");

alter table sales_q3
change column sale_date sale_date date;

update sales_q3 
set discount = NULL where discount = 0.0;

alter table sales_q3
change column discount discount float;

set sql_safe_updates = 1;

show tables;