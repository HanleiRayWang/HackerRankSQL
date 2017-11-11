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
????????????????????????????

#Challenges
????????????????????????????

#Contest Leaderboard
????????????????????????????

