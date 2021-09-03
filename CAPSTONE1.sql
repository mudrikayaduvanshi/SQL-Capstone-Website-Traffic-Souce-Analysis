show databases;
use mavenfuzzyfactory;
show tables;


/*ASSIGNMENT 1*/
desc website_sessions;
select*from website_sessions;
select DISTINCT(utm_source)from website_sessions;
select utm_source,utm_campaign,http_referer, count(website_session_id) as 'Total Sessions' from website_sessions where created_at < "2012-04-12"
 group by utm_source,utm_campaign,http_referer order by count(website_session_id) desc;
/* So here we can see most of the bulk of our website is coming from google search with the following link https://www.gsearch.com and
 most of the people preffered searching for non brand products*/

/* Salutations,
       Recently got the query and on the basis of query I've analysed the data and after analysing the tables I've come to the conclusion that most of 
the bulk on our website is coming from google search (with the following link https://www.gsearch.com) . The customers really showed their interest in 
searching non branded products.
       If you have any further query related to this please ping me. Thankyou!!!!
   
   From ,
   Mudrika Yaduvanshi
*/

 /*ASSIGNMENT 2*/
 select* from orders;
 select count(order_id) as 'Sales-gsearch nonbrand' from website_sessions as ws join orders as o on ws.website_session_id=o.website_session_id
 where utm_source="gsearch" and  utm_campaign="nonbrand";
 select count(website_session_id) from website_sessions where utm_source="gsearch" and utm_campaign="nonbrand" and created_At <'2012-04-14';
/*Calculating CVR*/
 select utm_source, utm_campaign, count(o.order_id)/count(ws. website_session_id)*100 as CVR from website_sessions as ws  left join orders as o on 
  ws.website_session_id=o.website_session_id  where ws.created_at<'2012-04-14' GROUP BY utm_source, utm_campaign;

 /* Salutations,
        On the basis of the problem statement weather from the searches we are getting the sales or not . After analysing the data I've come to the
    conclusion that the conversion rate for gsearch nonbrand comes out to be 2.8755 whereas for gsearch brand it is 9.6774. So we are getting more 
    sales from gsearch brand .
    I hope I've answered all your doubts Sir. If you have any other query related to this please let me know.
                                                  Thankyou!!!!
	From,
    Mudrika Yaduvanshi
*/
    


 /*ASSIGNMENT 3 */
 select  * from website_sessions;
 select count(*) from website_sessions ;
select year(created_at)as 'Year', week(created_at) as 'Week',count(distinct(website_Session_id)) as 'Total_sessions',min(date(created_at)) as Week_Starting_date,utm_source,utm_campaign 
from website_sessions 
where created_at<"2012-05-10" and utm_source="gsearch" and utm_campaign ="nonbrand"  group by 1,2;
  /* From the above query we got to know that when the bid down occured the sales per week got decresed*/
/* 
Salutations,
    As you've said I've checked that weather the bid down caused any changes. After 15th April 2012 the Total Sessions decresed on a constant rate .
So its not a very good decision to continue this bid down.
                                                      thankyou!!!
From,
Mudrika Yaduvanshi
*/
  
  
  /*ASSIGNMENT 4*/
  /* Conversion rate to order by device type*/
  select DISTINCT(device_type) from website_sessions;

select utm_source,utm_campaign,device_type,count(distinct o.order_id)as total_orders, count(distinct ws.website_session_id) as total_sessions,count( distinct order_id)/count(distinct ws.website_session_id)*100 as CVR from website_sessions as ws left join orders as o
on ws.website_session_id = o.website_session_id where ws.created_at<'2012-05-11' and utm_source="gsearch" and utm_campaign="nonbrand" group by device_type order by CVR desc;
  /* here we can see the CVR of desktop is way more larger than mobile"*/
  
  /* Salutations,
         I've gone through the problem statement. Our website users only prefers two devices i.e. mobile and desktop. The CVR of mobile phone less in 
comparision to the CVR of desktop  which simply means users using desktop while visiting our site are more likely to shop rather than the users
using mobile.So we can surely bid more to desktop to bring more volume. Please let me know if you have any doubts regarding this.
                                                         Thankyou!!!!
	 From,
     Mudrika Yaduvanshi
     */
     
     
/*ASSIGNMENT 5 */
select year(created_at)as 'Year',week(created_at) as 'Week', min(date(created_at)) as week_start_date,count(distinct(website_session_id)) as Total_sessions,
count(distinct case when device_type="desktop" then website_session_id else null end) as Desktop_total_sessions,
count(distinct case when device_type="mobile" then website_session_id else null end) as Mobile_total_sessions
from website_sessions where created_at between '2012-04-15' and '2012-06-09' and utm_source="gsearch" and utm_campaign="nonbrand"
 group by Year,Week;
 /* From the above query we can see there is a sudden increase in desktop total sessions increased after 19th May 2012 */
 
 
 /*Salutations,
       I've gone through the data after 15th April 2012 and the data shows that it was a good decision raising bid for desktop gsearch nonbrand 
   as the desktop total sessions increased after this. 
   
   From
   Mudrika Yaduvanshi
   */