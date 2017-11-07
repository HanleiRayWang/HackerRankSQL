#Revising the Select Query I
select *
from CITY
where COUNTRYCODE='USA' and POPULATION>100000;


#Revising the Select Query II
select NAME
FROM CITY
where countrycode='USA' and population>120000;


#Select All
select * from city;


#Select By Id
select * from city where ID=1661;


#Japanese Cities' Attributes
select * from city where countrycode='JPN';


#Japanese Cities' Names
select name from city where countrycode='JPN'


#Weather Observation Station 1
select city, state from station


#Weather Observation Station 3
select distinct city from station where id%2=0


#Weather Observation Station 4
select (select count(*) from station)-(select count(distinct city) from station)


#Weather Observation Station 5
select city, length(city)
from station
where length(city)=(select MIN(length(city)) from station)
order by city
limit 1;
select city, length(city)
from station
where length(city)=(select MAX(length(city)) from station)
order by city
limit 1;


#Weather Observation Station 6
select distinct city 
from station 
where city like 'a%' or city like 'e%' or city like 'i%' or city like 'o%' or city like 'u%'


#Weather Observation Station 7
select distinct city from station
where city like '%a' or city like '%e' or city like '%i' or city like '%o' or city like '%u'


#Weather Observation Station 8
select distinct city from station
where (city like '%a' or city like '%e' or city like '%i' or city like '%o' or city like '%u') 
  AND (city like 'a%' or city like 'e%' or city like 'i%' or city like 'o%' or city like 'u%')
      
      
#Weather Observation Station 9
select distinct city from station 
where city not like 'a%' and city not like 'i%' and city not like 'e%' and city not like 'u%' and city not like 'o%'


#Weather Observation Station 10
select distinct city from station 
where city not like '%a' and city not like '%i' and city not like '%e' and city not like '%u' and city not like '%o'


#Weather Observation Station 11
select distinct city from station 
where (city not like 'a%' and city not like 'i%' and city not like 'e%' and city not like 'u%' and city not like 'o%') 
   or (city not like '%a' and city not like '%i' and city not like '%e' and city not like '%u' and city not like '%o')


#Weather Observation Station 12
select distinct city from station 
where (city not like 'a%' and city not like 'i%' and city not like 'e%' and city not like 'u%' and city not like 'o%') 
  and (city not like '%a' and city not like '%i' and city not like '%e' and city not like '%u' and city not like '%o')


###############################Higher Than 75 Marks#############################################
select name from students where marks>75 order by RIGHT(name,3), id asc


#Employee Names
select name from employee order by name


#Employee Salaries
select name from employee where salary>2000 and months<10 order by employee_id
