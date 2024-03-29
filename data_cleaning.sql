--1) Creating some separate columns :-

  -- A) Creating a separate column named "bike size" and then extracting values from a column to store in the new column -
           
         {alter table sales_data
          add "bike_size" varchar(5)}

 
         {update sales_data
          set bike_size = coalesce(bike_size,right(product_description,2)) }





--2) Removing unnecessary fields :-


  --A) Removing "day" field -                 -- Removed this field as we already have date field 

     { alter table sales_data

       drop column "day"

     }

  --B) Removing "month" field :-             -- Removed this field as we already have date field 

      { alter table sales_data

        drop column "month"

      }

  --C) Removing "year" field :-              -- Removed this field as we already have date field 


      { alter table sales_data

        drop column "year"

      }


  --D) Removing "age_group" field :-          -- Removed this field as it has uncleaned data and it's better to make a new field


       { alter table sales_data

         drop column "age_group"
  
       }



--3) Checking for NULL values and removing them :-


   --A) Checking null values in sales_order" field - 
    
      { select sales_order from sales_data         --No NULL values found

        where sales_order is null

       }


   --B) Checking null values in "Date" field -

      { select "Date" from sales_data            --No NULL Values found

        where "Date" is null

      }
 

   --C) Checking null values in "customer_age" field -

      { select "customer_age" from sales_data           --No NULL values found

        where "customer_age" is null

      }



   --D) Checking null values in "customer_gender" field -

      { select "customer_gender" from sales_data         --No NULL Values found 

        where "customer_gender" is null
      }



   --E) Checking null values in "country" field -

      { select "country" from sales_data                --No NULL values found

        where "country" is null

      }



   --F) Checking null values in "state" field -

      { select state from sales_data                 --No NULL values found

        where state is null

      }



   --G) Checking null values in "product_category" field -

      { select product_category from sales_data           --No NULL values found

        where product_category is null

      }


   --H) Checking null values in "sub_category" field -

      { select sub_category from sales_data             --No NULL values found

        where sub_category is null

      }

   --I) Checking null values in "product_description" field - 


        { select product_description from sales_data       -- 1 null value found
          where product_description is null
        }


      --Solving the null value :-

        {delete from sales_data                          -- deleting the row having null value
         where product_description is null
        }




--4) Removing "$" sign from all the columns containing it :-


    --A) Removing '$' from unit_cost -

        {update sales_data
         set unit_cost = LTRIM(unit_cost,'$') 
        }


    --B) Removing '$'sign from unit_price - 

        { update sales_data
          set unit_price = LTRIM(unit_price,'$')
         } 


    --C) Removing '$'sign from profit - 

         { update sales_data
           set profit = LTRIM(profit,'$') 
         }


    --D) Removing '$'sign from "cost" - 

        { update sales_data
          set "cost" = LTRIM("cost",'$')
        }

    --F) Removing '$'sign from revenue -

       { update sales_data
         set revenue = LTRIM(revenue,'$')  
       }



--5) Removing comma(,) from the currency based columns :-


   --A) Removing comma(,) from unit_cost - 

         { update sales_data
           set unit_cost = replace(unit_cost,',', '')
          }



   --B) Removing comma(,) from unit_price - 

         { update sales_data
           set unit_price = replace(unit_price,',', '')
         }



   --C) Removing comma(,) from profit - 

       { update sales_data
         set profit = replace(profit,',', '')
       }




   --D) Removing comma(,) from "cost" -

        { update sales_data
          set "cost" = replace("cost",',', '') 
        }



   --F) Removing comma(,) from revenue -

        { update sales_data
          set revenue = replace(revenue,',', '')
        }





--6) Changing the data type of required columns to float data type :- 


    --A) Changing data type of column unit_cost  - 


        { ALTER TABLE sales_Data 
         ALTER COLUMN unit_cost TYPE float USING (unit_cost::float) }


    
    --B) Changing data type of column unit_price - 


       { ALTER TABLE sales_Data 
         ALTER COLUMN unit_price TYPE float USING (unit_price::float) }



    --C) Changing data type of column profit -


        { ALTER TABLE sales_Data 
          ALTER COLUMN profit TYPE float USING (profit::float) }


   
    --D) Changing data type of column "cost" -

        { ALTER TABLE sales_Data 
          ALTER COLUMN "cost" TYPE float USING ("cost"::float) }



    --F) Changing data type of column revenue -


        { ALTER TABLE sales_Data 
          ALTER COLUMN revenue TYPE float USING (revenue::float) }



    --G) Changing the data type of column order_quantity - 


         { ALTER TABLE sales_Data 
          ALTER COLUMN order_quantity TYPE float USING (order_quantity::float) }





--7) Updating row values having wrong data :- 



    --A) Updating the column unit_cost having "0" as row values - 


         { UPDATE sales_data
           set unit_cost = unit_price - profit
           where unit_cost = 0 }



    --B) Updating the column unit_price having "0" as row values - 


         { UPDATE sales_data
           set unit_price = unit_cost + profit
           where unit_price = 0 }



    --C) Updating the column "cost" having "0" as row values -


         { update sales_data 
           set "cost" = unit_cost * order_quantity
           where "cost" = 0 }


    --D) Updating the column revenue having "0" as row values -


        { update sales_data 
          set revenue = unit_price * order_quantity
          where revenue = 0 }



--8) Creating new columns for representing data properly and updating data in them :- 



    --A) Creating a column named product_model - 



         { alter table sales_data 
           add column product_model varchar(20) }

   

       --Updating values in the newly created column named product_model - 


           { update sales_data 
             set product_model = split_part(product_description,' ',1) }




       


    --B) Creating a column named product_color - 


        { alter table sales_data 
          add column product_color varchar(10) }



      --Updating values in the newly created column product_color -



          { update sales_data 
            set product_color = split_part(product_description,' ',2) }




      --Removing the comma(,) from the column named product_color - 

          { update sales_data
            set product_color= replace(product_color,',', '')





--9) Removing the column that isn't required after extracting required data :- 




    --A) Removing column named product_description - 



        { alter table sales_data
          drop column product_description }