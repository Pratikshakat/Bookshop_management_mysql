set sql_mode='';

/* Query 1.  book title, price of book with name of author */
select b.title, concat(a.firstname, " ", a.lastname) as author_name,
e.price  from book as b
inner join edition as e on b.bookid=e.bookid
inner join author as a on a.authid=b.authid;

/* Query 2.  ISBN number of books and 
count of isbn number with 
title and price of book with name od author
 in sales of quarter 1 (q1)    */
select q1.isbn, b.title, e.price,
concat(a.firstname, " ", a.lastname) as author_name,
count(q1.isbn) as count_of_copies,
round(e.price*count(q1.isbn),2) as total_sale_copies_in_$
from book as b
inner join edition as e on b.bookid=e.bookid 
inner join sales_q1 as q1 on e.isbn=q1.isbn
inner join author as a on b.authid=a.authid
group by q1.isbn, b.title
order by 6 desc;


/* Query 3.  ISBN number of books and 
count of isbn number with 
title and price of book with name of author 
in sales of quarter 2 (q2)    */
select q2.isbn, b.title, e.price,
concat(a.firstname, " ", a.lastname) as author_name,
count(q2.isbn) as count_of_copies,
round(e.price*count(q2.isbn),2) as total_sales_copies_in_$
from book as b
inner join edition as e on b.bookid=e.bookid 
inner join sales_q2 as q2 on e.isbn=q2.isbn
inner join author as a on b.authid=a.authid
group by q2.isbn, b.title
order by 6 desc;


/* Query 4.  ISBN number of books and 
count of isbn number with 
title and price of book with name of author
 in sales of quarter 3 (q3)    */
select q3.isbn, b.title, e.price,
concat(a.firstname, " ", a.lastname) as author_name,
count(q3.isbn) as count_of_copies,
round(e.price*count(q3.isbn),2) as total_sales_copies_in_$
from book as b
inner join edition as e on b.bookid=e.bookid 
inner join sales_q3 as q3 on e.isbn=q3.isbn
inner join author as a on b.authid=a.authid
group by q3.isbn, b.title
order by 6 desc;


/* Query 5.  ISBN number of books and 
count of isbn number with 
title and price of book with name of author
 in sales of quarter 4 (q4)    */
select b.title, q4.isbn, e.price,
concat(a.firstname, " ", a.lastname) as author_name,
count(q4.isbn) as count_of_copies,
round(e.price*count(q4.isbn),2) as total_sales_copies_in_$
from book as b
inner join edition as e on b.bookid=e.bookid 
inner join sales_q4 as q4 on e.isbn=q4.isbn
inner join author as a on b.authid=a.authid
group by q4.isbn, b.title
order by 6 desc;

/* Query 6.  Book title, genre, format, pages, publication date, price*/

select 	b.title, i.genre, e.format, 
e.pages, e.publication_date, e.price
from book as b
inner join info as i on b.bookid=i.bookid
inner join edition as e on b.bookid=e.bookid
group by 1,2,3
order by 1;


/* Query 7.  Publisher and Publication of Book and it's information: 
Book title, publication date, publishing house,
city, state, country, year established and marketing spend*/

select b.title, e.publication_date, p.publishing_house,
 p.city, p.state, p.country, p.year_established, p.marketing_spend
 from book as b
 inner join edition as e on b.bookid=e.bookid
 inner join publisher as p on e.pubid=p.pubid
 group by 1,2
 order by 2 desc;

/* Query 8.  Popularity: Book title, Award name, number of checkouts,
rating, series name*/

select b.title, a.award_name, 
c.number_of_checkouts as Checkouts, 
r.ratings as Rating, s.series_name
from book as b 
inner join award as a on b.title=a.title
inner join checkouts as c on b.bookid=c.bookid
inner join ratings as r on b.bookid=r.bookid
inner join info on info.bookid=b.bookid
inner join series as s on info.seriesid=s.seriesid
group by 1
order by 4 desc, 3 desc;

/*  Query 9.  According to number of checkouts bookname 
and author name has selected*/

select b.bookid, b.title, 
concat(a.firstname," ", a.lastname) as Author_name, c.checkoutmonth, 
max(c.number_of_checkouts) as highest_checkouts
from book as b 
inner join checkouts as c on b.bookid=c.bookid 
inner join author as a on a.authid=b.authid
group by 2
order by 5 desc;

select max(number_of_checkouts) from checkouts; 