#Revising Aggregations - The Count Function
select count(distinct name) from city where population>100000

#Revising Aggregations - The Sum Function
select sum(population) from city where district='California'

#Revising Aggregations - Averages
select sum(population) from city where district='California'

#Average Population
select round(avg(population),0) from city

#Japan Population
select sum(population) from city where countrycode='JPN'

#Population Density Difference
select MAX(population)-MIN(population) from city

#The Blunder
SELECT CEIL(AVG(Salary)-AVG(REPLACE(Salary,'0',''))) FROM EMPLOYEES;

#Top Earners
select temp.m, count(*)
from employee, (select max(salary*months) as m from employee) as temp
where salary*months=temp.m
group by temp.m;
#或者
select salary*months as money, count(*) 
from employee
group by money
order by money desc
limit 1


#Weather Observation Station 2
select round(sum(lat_n),2), round(sum(long_w),2) from station

#Weather Observation Station 13
select round(sum(lat_n),4) from station
where lat_n>38.7880 and lat_n<137.2345


#Weather Observation Station 14
select round(max(lat_n),4) from station where lat_n<137.2345

#Weather Observation Station 15
select round(long_w,4) from station 
where lat_n=(select max(lat_n) from station where lat_n<137.2345)

#Weather Observation Station 16
select round(lat_n, 4) from station 
where lat_n=(select MIN(lat_n) from station where lat_n>38.7780)

#Weather Observation Station 17
select round(long_w,4) from station where lat_n=(select min(lat_n) from station where lat_n>38.7780)

#Weather Observation Station 18
select round(MAX(lat_n)-MIN(lat_n)+MAX(long_w)-min(long_w),4) from station


#Weather Observation Station 19
select round(sqrt(power(MAX(lat_n)-MIN(lat_n),2)+power(MAX(long_w)-min(long_w),2)),4) from station

#Weather Observation Station 20
#求中位数，median, 即使得>median和<median的行数相同
select round(a.lat_n,4) from station a
where (select count(lat_n) from station where lat_n>a.lat_n)
        =(select count(lat_n) from station where lat_n<a.lat_n)







