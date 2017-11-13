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
SELECT    contest.contest_id, contest.hacker_id, contest.name, 
          sum(total_submissions) as sum1, 
          sum(total_accepted_submissions) as sum2, 
          sum(total_views) as sum3, 
          sum(total_unique_views) as sum4
FROM Contests contest INNER JOIN Colleges college ON contest.contest_id = college.contest_id
                      INNER JOIN Challenges challenge ON challenge.college_id = college.college_id
                      #这里必须使用left join，因为存在一些college和challenge没有view的
                      LEFT JOIN ( SELECT challenge_id, 
                                         sum(total_views) as total_views, 
                                         sum(total_unique_views) as total_unique_views
                                  FROM View_Stats GROUP BY challenge_id) as view_sum 
                                  ON view_sum.challenge_id = challenge.challenge_id
                      #这里必须使用left join，因为存在一些college和challenge没有submission的
                      LEFT JOIN ( SELECT challenge_id, 
                                         sum(total_submissions) as total_submissions, 
                                         sum(total_accepted_submissions) as total_accepted_submissions
                                  FROM Submission_Stats GROUP BY challenge_id) as submission_sum
                                  ON submission_sum.challenge_id = challenge.challenge_id
GROUP BY contest.contest_id,contest.hacker_id,contest.name
having sum1+sum2+sum3+sum4>0
ORDER BY contest.contest_ID


#这种写法不正确
/*select contest.contest_id, contest.hacker_id, contest.name, 
       sum(submission.total_submissions) as sum1,
       sum(submission.total_accepted_submissions) as sum2,
       sum(view.total_views) as sum3, 
       sum(view.total_unique_views) as sum4
from contests contest, colleges college, challenges challenge, 
     view_stats view, submission_stats submission
where contest.contest_id=college.contest_id and 
      college.college_id=challenge.college_id and
      challenge.challenge_id=view.challenge_id and
      challenge.challenge_id=submission.challenge_id
group by contest.contest_id, contest.hacker_id, contest.name
having sum1+sum2+sum3+sum4>0
order by contest.contest_id;
*/




#最后这一题比较难
#15 Days of Learning SQL





