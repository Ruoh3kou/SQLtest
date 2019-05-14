11、查询‘3-105’号课程的平均分。

    SELECT cno,AVG(degree) as avg_degree
    FROM score
    WHERE score.cno = '3-105'

12、查询 Score 表中至少有 5 名学生选修的并以 3 开头的课程的平均分数。

    SELECT cno,AVG(degree) as avg_degree
    FROM score
    WHERE score.cno LIKE '3%'
    GROUP BY cno
    HAVING COUNT(cno)>=3

13、查询最低分大于 70，最高分小于 90 的 Sno 列。

    SELECT sno
    FROM score
    GROUP BY sno
    HAVING MIN(degree)>=70 AND MAX(degree)<=90

14、查询所有学生的 Sname、Cno 和 Degree 列。

    SELECT student.sname,score.cno,score.degree
    FROM student
    JOIN score
    ON student.sno = score.sno

15、查询所有学生的 Sno、Cname 和 Degree 列。

    SELECT s.sno,c.cname,s.degree
    FROM course c
    RIGHT JOIN score s
    ON c.cno=s.cno

16、查询所有学生的 Sname、Cname 和 Degree 列。
  
 SELECT stu.sname,cou.cname,sco.degree
FROM student stu
JOIN score sco ON sco.sno=stu.sno
JOIN course cou ON cou.cno=sco.cno

17、查询“95033”班所选课程的平均分。

    SELECT b.cno, avg(b.degree) as avg_degree
    FROM student as a
    JOIN score as b
    ON a.sno=b.sno
    WHERE a.class='95033'
    GROUP BY b.cno

18、假设使用如下命令建立了一个 grade 表：
```
    CREATE TABLE rank(
        low_number INT(3) ,
        high_number INT(3),
        rank VARCHAR(1)
    )ENGINE=InnoDB DEFAULT CHARSET=utf8;
    insert into rank values(90,100,'A');
    insert into rank values(80,89,'B');
    insert into rank values(70,79,'C');
    insert into rank values(60,69,'D');
    insert into rank values(0,59,'E');
```
现查询所有同学的Sno、Cno和rank列。

    SELECT s.sno,s.cno,r.rank
    FROM score as s
    JOIN rank as r
    ON s.degree>=r.low_number AND s.degree<=r.high_number

19、查询选修“3-105”课程的成绩高于“109”号同学成绩的所有同学的记录。
    
    SELECT s.*
    FROM score as s
    WHERE s.cno = '3-105' 
    AND s.degree>(SELECT degree FROM score WHERE sno = '109' AND cno = '3-105')

20、查询 score 中选学一门以上课程的同学中分数为非最高分成绩的记录。

    select t1.sno,t1.cno,t1.degree 
    from score as t1, 
        (select sno,max(degree) as max_degree 
        from score 
        group by sno having count(sno)>1 ) as t2
    where t1.sno = t2.sno and t1.degree < t2.max_degree

