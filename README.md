# bike-data-cleaning
It is a project in which I cleaned a bike sales dataset using SQL and SQL Queries.

I have used PostgreSQL as the RDBMS for the task of accessing and managing the database. I have also attached a txt file that contains all the SQL quries that I performed.

In this project, I have dealt with various problem that we encounter generally when we have an uncleaned dataset. Some of the tasks that I perfomed are :-

1) Solving Null Values.
2) Solving incorrect data types for the columns.
3) Removing special symbols from various columns such as "$", ",".
4) Separating columns for proper representaion of the data.
5) Creating new columns according to the need.
6) Removing unnecessary columns/fields.
7) Extracting required data from the rows of various columns.
8) Solving the "0" values in the sales data by imputing them with calculated columns such as -

    { update sales_data 
          set revenue = unit_price * order_quantity
          where revenue = 0 }
