#Type of Triangle
select (case when A=B and B=C then 'Equilateral'
             when A+B<=C or B+C<=A or A+C<=B then 'Not A Triangle'
             when A=B or A=C or B=C then 'Isosceles'
             when A<>B and B<>C then 'Scalene' end)
from TRIANGLES




#The PADS
select CONCAT(name,'(',LEFT(occupation,1),')')
from OCCUPATIONS
order by name;

#注意此处一定要CAST到char去不然order之后在每个相同count的内部姓名的顺序不是alphabetical的
select CONCAT('There are a total of ', cast(count(name) as char), ' ', lower(occupation), 's.' )
from OCCUPATIONS
group by occupation
order by count(name);




#Occupations
set @r1=0, @r2=0, @r3=0, @r4=0;
select min(Doctor), min(Professor), min(Singer), min(Actor)
from(
  select case when Occupation='Doctor' then (@r1:=@r1+1)
            when Occupation='Professor' then (@r2:=@r2+1)
            when Occupation='Singer' then (@r3:=@r3+1)
            when Occupation='Actor' then (@r4:=@r4+1) end as RowNumber,
    case when Occupation='Doctor' then Name end as Doctor,
    case when Occupation='Professor' then Name end as Professor,
    case when Occupation='Singer' then Name end as Singer,
    case when Occupation='Actor' then Name end as Actor
  from OCCUPATIONS
  order by Name
) Temp
group by RowNumber;




#Binary Tree Nodes
select N, case when P is null then 'Root'
               when N not in (select distinct P from BST where P is not null) then 'Leaf'
               else 'Inner'
          end
from BST
order by N




#New Companies
select company.company_code, founder, count(distinct lead_manager_code), 
       count(distinct senior_manager_code), count(distinct manager_code), count(distinct employee_code)
from employee, company
where employee.company_code=company.company_code
group by company.company_code, founder
