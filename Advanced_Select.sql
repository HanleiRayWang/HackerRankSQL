#Type of Triangle
select (case when A=B and B=C then 'Equilateral'
             when A+B<=C or B+C<=A or A+C<=B then 'Not A Triangle'
             when A=B or A=C or B=C then 'Isosceles'
             when A<>B and B<>C then 'Scalene' end) as triangle
from TRIANGLES
