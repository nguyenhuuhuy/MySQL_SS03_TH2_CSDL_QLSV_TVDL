create database java10_md4_ss3_th1;
use java10_md4_ss3_th1;
create table Class(
classId int auto_increment primary key,
className varchar(250),
startDate date,
status bit
);
create table Student(
studentId int auto_increment primary key,
studentName varchar (200),
address varchar (200),
Phone varchar(200),
status bit,
classId int not null,
foreign key(classId) references Class(classId)
);
create table Subject(
subId int auto_increment primary key,
subName varchar(200),
credit tinyint not null default 1 check (credit >=1),
status bit      		default 1
);

create table Mark (
markId int auto_increment primary key,
subId int not null,
studentId int not null,
mark float default 0 check (mark between 0 and 100),
examTimes tinyint default 1,
unique (subId,studentId),
foreign key (subId) references Subject (subId),
foreign key(studentId) references Student (studentId)
);
INSERT INTO Class
VALUES (1, 'A1', '2008-12-20', 1);
INSERT INTO Class
VALUES (2, 'A2', '2008-12-22', 1);
INSERT INTO Class
VALUES (3, 'B3', current_date, 0);

INSERT INTO Student (StudentName, Address, Phone, Status, ClassId)
VALUES ('Hung', 'Ha Noi', '0912113113', 1, 1);
INSERT INTO Student (StudentName, Address, Status, ClassId)
VALUES ('Hoa', 'Hai phong', 1, 1);
INSERT INTO Student (StudentName, Address, Phone, Status, ClassId)
VALUES ('Manh', 'HCM', '0123123123', 0, 2);

INSERT INTO Subject
VALUES (1, 'CF', 5, 1),
       (2, 'C', 6, 1),
       (3, 'HDJ', 5, 1),
       (4, 'RDBMS', 10, 1);
       
INSERT INTO Mark (SubId, StudentId, Mark, ExamTimes)
VALUES (1, 1, 8, 1),
       (1, 2, 10, 2),
       (2, 1, 12, 1);
       
select *from student;
select *from student where status = true;
select *from subject where credit<10;

SELECT S.StudentId, S.StudentName, C.ClassName
FROM Student S join Class C on S.ClassId = C.ClassID;

SELECT S.StudentId, S.StudentName, C.ClassName
FROM Student S join Class C on S.ClassId = C.ClassID
WHERE C.ClassName = 'A1';

SELECT S.StudentId, S.StudentName, Sub.SubName, M.Mark
FROM Student S join Mark M on S.StudentId = M.StudentId join Subject Sub on M.SubId = Sub.SubId;

SELECT S.StudentId, S.StudentName, Sub.SubName, M.Mark
FROM Student S join Mark M on S.StudentId = M.StudentId join Subject Sub on M.SubId = Sub.SubId
WHERE Sub.SubName = 'CF';