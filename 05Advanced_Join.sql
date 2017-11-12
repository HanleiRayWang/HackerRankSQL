#Projects
#a选出所有起始日期，b选出所有终止日期
#temp中选出最小end就对应a中startdate项目
#必须建立temp再选，因为只能groupby a.startdate但是需要用到b中的minenddate
SELECT Start_Date, End_Date_Correspond
FROM (SELECT a.Start_Date, Min(b.End_Date) As End_Date_Correspond
      FROM (SELECT Start_Date FROM Projects 
            WHERE Start_Date NOT IN (SELECT End_Date FROM Projects)) a,
           (SELECT End_Date FROM Projects 
            WHERE End_Date NOT IN (SELECT Start_Date FROM Projects)) b
      WHERE Start_Date < End_Date
      GROUP BY a.Start_Date) as temp
ORDER BY DATEDIFF(End_Date_Correspond, Start_Date), Start_Date;



#Placements
select s1.name
from students s1, friends f, students s2, packages p1, packages p2
where s1.id=f.id and s2.id=f.friend_id and 
      p1.id=s1.id and p2.id=s2.id and 
      p1.salary<p2.salary
order by p2.salary



#Symmetric Pairs
(select a.x, a.y from functions a, functions b
where a.x=b.y and a.y=b.x and a.x<a.y) union
(select x,y from functions where x=y 
group by x,y having count(*)>1)
order by x



#Interviews



#15 Days of Learning SQL
