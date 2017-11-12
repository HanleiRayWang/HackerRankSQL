#Asian Population
select sum(city.population) from city, country
where city.countrycode=country.code and country.continent='Asia'

#African Cities
select city.name from city, country
where city.countrycode=country.code and country.continent='Africa'

#Average Population of Each Continent
select country.continent, round(avg(city.population)-0.5,0)
from city, country
where city.countrycode=country.code
group by country.continent

#The Report
select case when grade<8 then 'NULL'
            else name end, grade, marks
from students, grades
where marks<=max_mark and marks>=min_mark
order by grade desc, name

#Top Competitors
select h.hacker_id, h.name
from hackers h, difficulty d, challenges c, submissions s
where d.difficulty_level=c.difficulty_level and
      c.challenge_id=s.challenge_id and
      h.hacker_id = s.hacker_id and
      d.score = s.score
group by h.hacker_id, h.name
having count(distinct c.challenge_id)>1
order by count(distinct c.challenge_id) desc, h.hacker_id 

#Ollivander's Inventory
#temp表找出了power，age相同的not evil的魔杖最低价
select id, wands_property.age, coins_needed, wands.power
from wands, (select min(coins_needed) as minn, power, age
             from wands, wands_property
             where wands.code=wands_property.code and is_evil=0
             group by power, age) as temp, wands_property
where wands_property.is_evil=0 and wands.code=wands_property.code and 
      wands.coins_needed=temp.minn and wands.power=temp.power and wands_property.age=temp.age
order by power desc, age desc

#Challenges
#temp1选出了challenge最大值，temp2选出了对应的hacker只有一名的challenge
select h.hacker_id, h.name, count(*) as num
from hackers h, challenges c
where h.hacker_id=c.hacker_id
group by h.hacker_id, h.name
having num=(select max(temp1.c) as m
            from (select count(distinct challenge_id) as c
                  from challenges
                  group by hacker_id) as temp1)
    or num in (select temp2.c
               from (select count(distinct challenge_id) as c
                     from challenges
                     group by hacker_id) as temp2
               group by temp2.c
               having count(temp2.c)=1)
order by num desc, h.hacker_id

#Contest Leaderboard
#temp选出了同一hacker在同一challenge上得到的max-score
select h.hacker_id, h.name, sum(temp.m) as s
from hackers h, (select hacker_id, challenge_id, max(score) as m
                 from submissions
                 group by hacker_id, challenge_id) as temp
where h.hacker_id=temp.hacker_id
group by h.hacker_id, h.name
having s<>0
order by s desc, h.hacker_id asc

