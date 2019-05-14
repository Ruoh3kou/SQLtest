1、 查询Student表中的所有记录的Sname、Ssex和Class列。  

    SELECT sname,ssex,class FROM Student;  

2、 查询教师所有的单位即不重复的Depart列。    

    SELECT DISTINCT depart FROM `teacher`

3、 查询Student表的所有记录。  

    SELECT * FROM `student`

4、 查询Score表中成绩在60到80之间的所有记录。  

    SELECT * FROM `score` WHERE score.degree BETWEEN 60 AND 80

5、 查询Score表中成绩为85，86或88的记录。  

    SELECT * FROM `score` WHERE score.degree IN (85,86,88)

6、 查询Student表中“95031”班或性别为“女”的同学记录。  

    SELECT * FROM `student` WHERE student.ssex = '女' or student.class = 95031

7、 以Class降序查询Student表的所有记录。  

    SELECT * FROM `student` ORDER BY class DESC

8、 以Cno升序、Degree降序查询Score表的所有记录。  

    SELECT * FROM `score` ORDER BY cno,degree DESC

9、 查询“95031”班的学生人数。  

    SELECT class,COUNT(*) FROM `student` WHERE class = 95031

10、查询Score表中的最高分的学生学号和课程号。  

    SELECT sno,cno
    FROM score
    WHERE degree IN (SELECT MAX(degree) FROM score)
