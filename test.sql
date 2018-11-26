#建学生信息表
create table student(
sno varchar(20) not null primary key,
sname varchar(20) not null,
ssex varchar(20) not null,
sbirthday datetime,
class varchar(20)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
#建立教师表
create table teacher
(
tno varchar(20) not null primary key,
tname varchar(20) not null,
tsex varchar(20) not null,
tbirthday datetime,
prof varchar(20),
depart varchar(20) not null
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
#建立课程表
create table course
(
cno varchar(20) not null primary key,
cname varchar(20) not null,
tno varchar(20) not null,
foreign key(tno) references teacher(tno)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
#建立成绩表
create table score
(
sno varchar(20) not null,
foreign key(sno) references student(sno),
cno varchar(20) not null,
foreign key(cno) references course(cno),
degree decimal
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
#插入学生表数据
INSERT INTO STUDENT (SNO,SNAME,SSEX,SBIRTHDAY,CLASS) VALUES (108 ,'曾华' ,'男' ,'1977-09-01',95033);
INSERT INTO STUDENT (SNO,SNAME,SSEX,SBIRTHDAY,CLASS) VALUES (105 ,'匡明' ,'男' ,'1975-10-02',95031);
INSERT INTO STUDENT (SNO,SNAME,SSEX,SBIRTHDAY,CLASS) VALUES (107 ,'王丽' ,'女' ,'1976-01-23',95033);
INSERT INTO STUDENT (SNO,SNAME,SSEX,SBIRTHDAY,CLASS) VALUES (101 ,'李军' ,'男' ,'1976-02-20',95033);
INSERT INTO STUDENT (SNO,SNAME,SSEX,SBIRTHDAY,CLASS) VALUES (109 ,'王芳' ,'女' ,'1975-02-10',95031);
INSERT INTO STUDENT (SNO,SNAME,SSEX,SBIRTHDAY,CLASS) VALUES (103 ,'陆君' ,'男' ,'1974-06-03',95031);
#插入教师表数据
INSERT INTO TEACHER(TNO,TNAME,TSEX,TBIRTHDAY,PROF,DEPART) VALUES (804,'李诚','男','1958-12-02','副教授','计算机系');
INSERT INTO TEACHER(TNO,TNAME,TSEX,TBIRTHDAY,PROF,DEPART) VALUES (856,'张旭','男','1969-03-12','讲师','电子工程系');
INSERT INTO TEACHER(TNO,TNAME,TSEX,TBIRTHDAY,PROF,DEPART) VALUES (825,'王萍','女','1972-05-05','助教','计算机系');
INSERT INTO TEACHER(TNO,TNAME,TSEX,TBIRTHDAY,PROF,DEPART) VALUES (831,'刘冰','女','1977-08-14','助教','电子工程系');
#note:这里提醒大家一下，请按照我的顺序插入数据，因为被定义为外键的字段在插入数据的前提是主表的主键有相对应的值才可以插入否则会报错1452 - Cannot add or update a child row: a foreign key constraint fails ，所以主外键表先插主键表
#插入课程表数据
INSERT INTO COURSE(CNO,CNAME,TNO)VALUES ('3-105' ,'计算机导论',825);
INSERT INTO COURSE(CNO,CNAME,TNO)VALUES ('3-245' ,'操作系统' ,804);
INSERT INTO COURSE(CNO,CNAME,TNO)VALUES ('6-166' ,'数据电路' ,856);
INSERT INTO COURSE(CNO,CNAME,TNO)VALUES ('9-888' ,'高等数学' ,831);
#插入成绩表数据
INSERT INTO SCORE(SNO,CNO,DEGREE)VALUES (103,'3-245',86);
INSERT INTO SCORE(SNO,CNO,DEGREE)VALUES (105,'3-245',75);
INSERT INTO SCORE(SNO,CNO,DEGREE)VALUES (109,'3-245',68);
INSERT INTO SCORE(SNO,CNO,DEGREE)VALUES (103,'3-105',92);
INSERT INTO SCORE(SNO,CNO,DEGREE)VALUES (105,'3-105',88);
INSERT INTO SCORE(SNO,CNO,DEGREE)VALUES (109,'3-105',76);
INSERT INTO SCORE(SNO,CNO,DEGREE)VALUES (101,'3-105',64);
INSERT INTO SCORE(SNO,CNO,DEGREE)VALUES (107,'3-105',91);
INSERT INTO SCORE(SNO,CNO,DEGREE)VALUES (108,'3-105',78);
INSERT INTO SCORE(SNO,CNO,DEGREE)VALUES (101,'6-166',85);
INSERT INTO SCORE(SNO,CNO,DEGREE)VALUES (107,'9-888',79);
INSERT INTO SCORE(SNO,CNO,DEGREE)VALUES (108,'6-166',81);