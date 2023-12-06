--  ---------------
--  Aggregation.sql
--  ---------------

\c test

--  ------------------------------------------------------------------------
SET client_min_messages=warning;
drop table if exists Student;
drop table if exists Apply;
drop table if exists College;

--  ------------------------------------------------------------------------
create table Student (
    sID    int,
    sName  text,
    GPA    float,
    sizeHS int);

create table Apply (
    sID      int,
    cName    text,
    major    text,
    decision boolean);

create table College (
    cName      text,
    state      char(2),
    enrollment int);

--  ------------------------------------------------------------------------
insert into Student values (123, 'Amy',    3.9,  1000);
insert into Student values (234, 'Bob',    3.6,  1500);
insert into Student values (320, 'Lori',   null, 2500);
insert into Student values (345, 'Craig',  3.5,   500);
insert into Student values (432, 'Kevin',  null, 1500);
insert into Student values (456, 'Doris',  3.9,  1000);
insert into Student values (543, 'Craig',  3.4,  2000);
insert into Student values (567, 'Edward', 2.9,  2000);
insert into Student values (654, 'Amy',    3.9,  1000);
insert into Student values (678, 'Fay',    3.8,   200);
insert into Student values (765, 'Jay',    2.9,  1500);
insert into Student values (789, 'Gary',   3.4,   800);
insert into Student values (876, 'Irene',  3.9,   400);
insert into Student values (987, 'Helen',  3.7,   800);

insert into Apply values (123, 'Berkeley', 'CS',             true);
insert into Apply values (123, 'Cornell',  'EE',             true);
insert into Apply values (123, 'Stanford', 'CS',             true);
insert into Apply values (123, 'Stanford', 'EE',             false);
insert into Apply values (234, 'Berkeley', 'biology',        false);
insert into Apply values (321, 'MIT',      'history',        false);
insert into Apply values (321, 'MIT',      'psychology',     true);
insert into Apply values (345, 'Cornell',  'bioengineering', false);
insert into Apply values (345, 'Cornell',  'CS',             true);
insert into Apply values (345, 'Cornell',  'EE',             false);
insert into Apply values (345, 'MIT',      'bioengineering', true);
insert into Apply values (543, 'MIT',       'CS',            false);
insert into Apply values (678, 'Stanford', 'history',        true);
insert into Apply values (765, 'Cornell',  'history',        false);
insert into Apply values (765, 'Cornell',  'psychology',     true);
insert into Apply values (765, 'Stanford', 'history',        true);
insert into Apply values (876, 'MIT',      'biology',        true);
insert into Apply values (876, 'MIT',      'marine biology', false);
insert into Apply values (876, 'Stanford', 'CS',             false);
insert into Apply values (987, 'Berkeley', 'CS',             true);
insert into Apply values (987, 'Stanford', 'CS',             true);

insert into College values ('Berkeley', 'CA', 36000);
insert into College values ('Cornell',  'NY', 21000);
insert into College values ('Irene',    'TX', 25000);
insert into College values ('MIT',      'MA', 10000);
insert into College values ('Stanford', 'CA', 15000);

--  ------------------------------------------------------------------------
\echo "*** select * from Student ***" 
select * from Student;
\echo "*** select * from Apply ***" 
select * from Apply;
\echo "*** select * from College ***" 
select * from College;

--  ------------------------------------------------------------------------
\echo "*** stats on GPA of students ***"

\echo "*** Choose everything from Student ****"
select *
    from Student;

\echo "*** count the number of rows in Student ****" 
select count(*)
    from Student;

\echo "*** Choose only GPAs from Student ****" 
select GPA
    from Student;

\echo "*** Compute the average of GPAs from Student ****" 
select avg(GPA)
    from Student;

\echo "*** Find the maximum GPA from Student ****" 
select max(GPA)
    from Student;

\echo "*** Find the minimum GPA from Student ****" 
select min(GPA)
    from Student;

\echo "*** Compute the sum of GPAs from Student ****" 
select sum(GPA)
    from Student;

--  ------------------------------------------------------------------------
\echo "*** stats on GPA of students applying to CS ***"

select *
    from Student
    where sID in (select sID from Apply where major = 'CS')
    order by GPA desc;

select count(*)
    from Student
    where sID in (select sID from Apply where major = 'CS');

select GPA
    from Student
    where sID in (select sID from Apply where major = 'CS')
    order by GPA desc;

select avg(GPA)
    from Student
    where sID in (select sID from Apply where major = 'CS');
    

select max(GPA)
    from Student
    where sID in (select sID from Apply where major = 'CS');

select min(GPA)
    from Student
    where sID in (select sID from Apply where major = 'CS');

select sum(GPA)
    from Student
    where sID in (select sID from Apply where major = 'CS');

--  ------------------------------------------------------------------------
\echo "*** number of colleges with enrollment > 15000 ***"

select *
    from College
    order by enrollment desc;

select *
    from College
    where enrollment > 15000
    order by enrollment desc;

select count(*)
    from College
    where enrollment > 15000;

--  ------------------------------------------------------------------------
\echo "*** number of students who applied to Cornell ***"

\echo "this is not right, because of duplicates"

select *
    from Apply
    where cName = 'Cornell';


select count(*)
    from Apply
    where cName = 'Cornell';

\echo "this is right"

select distinct sID
    from Apply
    where cName = 'Cornell';

select count(distinct sID)
    from Apply
    where cName = 'Cornell';

--  ------------------------------------------------------------------------
\echo "*** students, such that *** "
\echo "*** the number of other students with the same GPA equals ***"
\echo "*** the number of other students with the same high school size ***"

select *
    from Student as R
    where
        (select count(*)
            from Student as S
            where (R.sID != S.sID) and (R.GPA = S.GPA))
        =
        (select count(*)
            from Student as S
            where (R.sID != S.sID) and (R.sizeHS = S.sizeHS))
    order by sID;

--  ------------------------------------------------------------------------
\echo "*** amount by which the average GPA of students applying to CS ***"
\echo "*** exceeds the average GPA of students not applying to CS ***"

select *
    from
        (select avg(GPA) as gpa
            from Student
            where sID in
                (select sID
                    from Apply
                        where major = 'CS')) as R,
        (select avg(GPA) as gpa
            from Student
            where sID not in
                (select sID
                    from Apply
                        where major = 'CS')) as S;

select R.gpa - S.gpa as diff
    from
        (select avg(GPA) as gpa
            from Student
            where sID in
                (select sID
                    from Apply
                        where major = 'CS')) as R,
        (select avg(GPA) as gpa
            from Student
            where sID not in
                (select sID
                    from Apply
                        where major = 'CS')) as S;

--  ------------------------------------------------------------------------
\echo "*** number of applications to each college ***"

\echo "*** order by cName ***";
select *
    from Apply
    order by cName;

\echo "*** cName, count(*) grouped by cName ***"
select cName, count(*)
    from Apply
    group by cName;

--  ------------------------------------------------------------------------
\echo "*** number of students who applied to each college ***"

select *
    from Apply
    order by cName;

select cName, count(sID)
    from Apply
    group by cName;

select cName, count(distinct sID)
    from Apply
    group by cName;

--  ------------------------------------------------------------------------
\echo "*** stats on college enrollment by state ***"

select *
    from College
    order by state;

select state, avg(enrollment)
    from College
    group by state;

select state, max(enrollment)
    from College
    group by state;

select state, min(enrollment)
    from College
    group by state;

select state, sum(enrollment)
    from College
    group by state;

--  ------------------------------------------------------------------------
\echo "*** stats on GPA of applicants to each college and major ***"

select *
    from Student
    inner join Apply using (sID)
    order by cName, major;

select cName, major, avg(GPA), max(GPA), min(GPA), max(GPA) - min(GPA)
    from Student
    inner join Apply using (sID)
    group by cName, major
	order by cName, major;

--  ------------------------------------------------------------------------
\echo "*** max spread between min and max GPA of applicants ***"
\echo "*** to each college and major ***";

select max(x)
    from
        (select max(GPA) - min(GPA) as x
            from Student
            inner join Apply using (sID)
            group by cName, major) as T;

select cName, major, avg(GPA), max(GPA), min(GPA), max(GPA) - min(GPA) as diff
    from Student
    inner join Apply using (sID)
    group by cName, major
    having
        max(GPA) - min(GPA)
        =
		(select max(x)
			from
				(select max(GPA) - min(GPA) as x
					from Student
					inner join Apply using (sID)
					group by cName, major) as T);

--  ------------------------------------------------------------------------
\echo "*** number of colleges applied to by each student ***"

\echo "does not include student who did not apply anywhere"

select *
    from Student
    inner join Apply using (sID);

select sID, sName, count(cName) as count_cName
    from Student
    inner join Apply using (sID)
    group by sID, sName 
    order by count(cName) desc;

select sID, sName, count(distinct cName) as count_cName
    from Student
    inner join Apply using (sID)
    group by sID, sName 
    order by count(cName) desc;

\echo "does include student who did not apply anywhere";

select sID, sName, count(distinct cName) as count_cName
    from Student
    inner join Apply using (sID)
    group by sID, sName 
union
select sID, sName, 0 as count_cName
    from Student
    where sID not in
        (select sID from Apply)
order by count_cName desc;

--  ------------------------------------------------------------------------
\echo "*** colleges with fewer than 5 applications ***"

select cName, count(*)
    from Apply
    group by cName;

select cName, count(*)
    from Apply
    group by cName
    having count(*) < 5;

--  ------------------------------------------------------------------------
\echo "*** colleges with fewer than 5 applicants ***"

select cName, count(distinct sID)
    from Apply
    group by cName;

select cName, count(distinct sID)
    from Apply
    group by cName
    having count(distinct sID) < 5;

--  ------------------------------------------------------------------------
\echo "*** majors whose applicant's max GPA is less than the average ***"

select avg(GPA)
    from Student;

select major, max(GPA)
    from Student
    inner join Apply using (sID)
    group by major;

select major
    from Student
    inner join Apply using (sID)
    group by major
    having
        max(GPA)
        <
        (select avg(GPA) from Student);

--  ------------------------------------------------------------------------
drop table if exists Student;
drop table if exists Apply;
drop table if exists College;

\quit
