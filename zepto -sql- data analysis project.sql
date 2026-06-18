drop table if exists zepto;

create table zepto(
  sku_id SERIAL PRIMARY KEY,
  category VARCHAR(150),
  name VARCHAR(150) NOT NULL,
  mrp NUMERIC(8,2),
  discountpercentage NUMERIC(8,2),
  availablequantity INT,
  discountedsellingprice NUMERIC(8,2),
  weightInGms INT,
  outofstock BOOLEAN,
  quantity INT
  
);
select * from zepto;

---- Data exploration 

--- total rows

select count(*) from zepto;

select * from zepto
limit 6;


--- null value check---

select count(*) from zepto
where category is null 
or
name is null
or
mrp  is null
or
discountpercentage is null
or
availablequantity is null
or
discountedsellingprice is null
or
outofstock is null
or
quantity is null
  

--- diffferent product category

select distinct category
from zepto
order by category ;

--- product in stock vs out of stock
select outofstock , count(sku_id)
from zepto
group by outofstock;


---product name present multiple times

select name , count(sku_id) as Number_of_sku
from zepto
group by name
having count(sku_id) > 1
order by count(sku_id) Desc
limit 10;

---- data cleaning

-- product with price = 0

select * from zepto
where mrp = 0 or discountedsellingprice = 0;

--- delete product where 
delete from zepto
where mrp = 0;



--convert paise to rupees

update zepto
set mrp = mrp/100.0,
discountedsellingprice = discountedsellingprice/100.0


select mrp , discountedsellingprice from zepto;



--============Business Insights key findings ===========

-- Find top 10 best valued product by discounted percentage
select  distinct name, mrp, discountpercentage
from zepto
order by discountpercentage desc
limit 10;

---- what are the  product with high mrp but out of stock 

select distinct name, mrp
from zepto
where mrp >10 or outofstock = True
order by mrp desc;


---- Calculate estimated revenue for each category 
select category,
sum(discountedsellingprice * availablequantity) as total_revenue
from zepto
group by category
order by total_revenue


---- find all product where mrp is greater than 500 and discount is less than 10% 

select  distinct name ,mrp, discountpercentage
from zepto
where mrp > 500 and discountpercentage < 10
order by mrp desc,discountpercentage desc
limit 10;

---- Identify the top 5 category offering the highest average discount percetage

select category, avg(discountpercentage) as average_discount_percentage
from zepto
group by category
order by average_discount_percentage desc
limit 5 ;

--- find the price per gram for products per 100 gram and sort by best value ---
select distinct name , weightInGms,discountedsellingprice,
round(discountedsellingprice / weightInGms) as price_per_gram
from zepto
where weightInGms >= 100
order by  price_per_gram desc
limit 5;

---- group the product into category like low, medium, bulk 
select distinct name , weightInGms,
case  WHEN weightInGms < 1000  then 'low'
   when weightInGms < 5000  then 'medium'
   else 'bulk'
end as weight_category
from zepto
limit 10;

--- what is the total inventory weight per category
select sum(weightInGms* availablequantity) as total_weight ,
category
from zepto
group by category
order by total_weight desc
limit 5;










