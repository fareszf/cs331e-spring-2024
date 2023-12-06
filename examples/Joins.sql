-- ---------
-- Joins.sql
-- ---------

\c test;

-- ------------------------------------------------------------------------
SET client_min_messages=warning;
drop table if exists R;
drop table if exists S;

-- ------------------------------------------------------------------------
create table R (A int);
create table S (B int, C int);

-- ------------------------------------------------------------------------
insert into R values (1);
insert into R values (2);
insert into R values (3);

insert into S values (1, 6);
insert into S values (1, 7);
insert into S values (4, 8);
insert into S values (4, 9);

-- ------------------------------------------------------------------------
\echo "*** select * from R ***"
select * from R;
\echo "*** select * from R ***"
select * from S;

-- select count(*) from R, S;
-- select       *  from R, S;

\echo "*** select count(*)/* from R cross join S"
select count(*) from R cross join S;
select       *  from R cross join S;

-- ------------------------------------------------------------------------
\echo "*** select * from R ***"
select * from R;
\echo "*** select * from S ***"
select * from S;

-- select count(*) from R, S where R.A = S.B;
-- select       *  from R, S where R.A = S.B;

-- select count(*) from R cross join S where R.A = S.B;
-- select       *  from R cross join S where R.A = S.B;

-- select count(*) from R, S on R.A = S.B; -- You have an error in your SQL syntax
-- select       *  from R, S on R.A = S.B; -- You have an error in your SQL syntax

\echo "*** select count(*)/* from R inner join S on R.A = S.B"
select count(*) from R inner join S on R.A = S.B;
select       *  from R inner join S on R.A = S.B;

-- ------------------------------------------------------------------------
\echo "*** select * from R ***"
select * from R;
\echo "*** select * from S ***"
select * from S;

-- select count(*) from R left join S where R.A = S.B; -- You have an error in your SQL syntax
-- select       *  from R left join S where R.A = S.B; -- You have an error in your SQL syntax

\echo "*** select count(*)/* from R left join S on R.A = S.B" 
select count(*) from R left join S on R.A = S.B;
select       *  from R left join S on R.A = S.B;

-- ------------------------------------------------------------------------
\echo "*** select * from R ***" 
select * from R;
\echo "*** select * from S ***" 
select * from S;

-- select count(*) from R right join S where R.A = S.B; -- You have an error in your SQL syntax
-- select       *  from R right join S where R.A = S.B; -- You have an error in your SQL syntax

\echo "*** select count(*)/* from R right join S on R.A = S.B" 
select count(*) from R right join S on R.A = S.B;
select       *  from R right join S on R.A = S.B;

-- ------------------------------------------------------------------------
\echo "*** select * from R ***" 
select * from R;
\echo "*** select * from S ***" 
select * from S;

\echo "*** select count(*)/* from R natural join S" 
select count(*) from R natural join S;
select       *  from R natural join S;

-- ------------------------------------------------------------------------
drop table if exists R;
drop table if exists S;

-- ------------------------------------------------------------------------
create table R (A int);
create table S (A int, C int);

-- ------------------------------------------------------------------------
insert into R values (1);
insert into R values (2);
insert into R values (3);

insert into S values (6, 1);
insert into S values (7, 2);
insert into S values (8, 3);
insert into S values (9, 4);

-- ------------------------------------------------------------------------
\echo "*** select * from R ***" 
select * from R;
\echo "*** select * from S ***" 
select * from S;

\echo "*** select count(*)/* from R cross join S" 
select count(*) from R cross join S;
select       *  from R cross join S;

-- ------------------------------------------------------------------------
\echo "*** select * from R ***" 
select * from R;
\echo "*** select * from S ***" 
select * from S;

\echo "*** select count(*)/* from R inner join S using (A)" 
select count(*) from R inner join S using (A);
select       *  from R inner join S using (A);

-- ------------------------------------------------------------------------
\echo "*** select * from R ***" 
select * from R;
\echo "*** select * from S ***" 
select * from S;

\echo "*** select count(*)/* from R left join S using(A)" 
select count(*) from R left join S using (A);
select       *  from R left join S using (A);

-- ------------------------------------------------------------------------
\echo "*** select * from R ***" 
select * from R;
\echo "*** select * from S ***" 
select * from S;

\echo "*** select count(*)/* from R right join S using(A)" 
select count(*) from R right join S using (A);
select       *  from R right join S using (A);

-- ------------------------------------------------------------------------
\echo "*** select * from R ***" 
select * from R;
\echo "*** select * from S ***" 
select * from S;

\echo "*** select count(*)/* from R natural join S" 
select count(*) from R natural join S;
select       *  from R natural join S;

-- ------------------------------------------------------------------------
drop table if exists R;
drop table if exists S;

-- ------------------------------------------------------------------------
create table R (A int);
create table S (A int, C int);

-- ------------------------------------------------------------------------
insert into R values (1);
insert into R values (2);
insert into R values (3);

insert into S values (1, 6);
insert into S values (1, 7);
insert into S values (4, 8);
insert into S values (4, 9);

-- ------------------------------------------------------------------------
\echo "*** select * from R ***" 
select * from R;
\echo "*** select * from S ***" 
select * from S;

\echo "*** select count(*)/* from R cross join S" 
select count(*) from R cross join S;
select       *  from R cross join S;

-- ------------------------------------------------------------------------
\echo "*** select * from R ***" 
select * from R;
\echo "*** select * from S ***" 
select * from S;

\echo "*** select count(*)/* from R inner join S" 
select count(*) from R inner join S using (A);
select       *  from R inner join S using (A);

-- ------------------------------------------------------------------------
\echo "*** select * from R ***"
select * from R;
\echo "*** select * from S ***"
select * from S;

\echo "*** select count(*)/* from R left join S using(A)" 
select count(*) from R left join S using (A);
select       *  from R left join S using (A);

-- ------------------------------------------------------------------------
\echo "*** select * from R ***" 
select * from R;
\echo "*** select * from S ***" 
select * from S;

\echo "*** select count(*)/* from R right join S using(A)" 
select count(*) from R right join S using (A);
select       *  from R right join S using (A);

-- ------------------------------------------------------------------------
\echo "*** select * from R ***" 
select * from R;
\echo "*** select * from S ***" 
select * from S;

\echo "*** select count(*)/* from R natural join S" 
select count(*) from R natural join S;
select       *  from R natural join S;

-- ------------------------------------------------------------------------
drop table if exists R;
drop table if exists S;

-- ------------------------------------------------------------------------
create table R (A int, B int);
create table S (A int, C int, D int);

-- ------------------------------------------------------------------------
insert into R values (1, 4);
insert into R values (2, 5);
insert into R values (3, 6);

insert into S values (1, 3, 4);
insert into S values (1, 4, 5);
insert into S values (1, 4, 6);
insert into S values (2, 4, 7);
insert into S values (2, 5, 8);
insert into S values (4, 7, 9);

-- ------------------------------------------------------------------------
\echo "*** select * from R ***" 
select * from R;
\echo "*** select * from S ***" 
select * from S;

\echo "*** select count(*)/* from R cross join S" 
select count(*) from R cross join S;
select       *  from R cross join S;

-- ------------------------------------------------------------------------
\echo "*** select * from R ***" 
select * from R;
\echo "*** select * from S ***" 
select * from S;

\echo "*** select count(*)/* from R inner join S" 
select count(*) from R inner join S on R.A = S.A;
select       *  from R inner join S on R.A = S.A;

-- ------------------------------------------------------------------------
\echo "*** select * from R ***" 
select * from R;
\echo "*** select * from S ***" 
select * from S;

\echo "*** select count(*)/* from R left join S on R.A = S.A" 
select count(*) from R left join S on R.A = S.A;
select       *  from R left join S on R.A = S.A;

-- ------------------------------------------------------------------------
\echo "*** select * from R ***" 
select * from R;
\echo "*** select * from S ***" 
select * from S;

\echo "*** select count(*)/* from R right join S on R.A = S.A" 
select count(*) from R right join S on R.A = S.A;
select       *  from R right join S on R.A = S.A;

-- ------------------------------------------------------------------------
\echo "*** select * from R ***" 
select * from R;
\echo "*** select * from S ***" 
select * from S;

\echo "*** select count(*)/* from R natural join S" 
select count(*) from R natural join S;
select       *  from R natural join S;

-- ------------------------------------------------------------------------
drop table if exists R;
drop table if exists S;
drop table if exists T;

-- ------------------------------------------------------------------------
create table T (A int);

-- ------------------------------------------------------------------------
insert into T values (1);
insert into T values (2);
insert into T values (3);

-- ------------------------------------------------------------------------
\echo "*** select * from T ***" 
select * from T;

\echo "*** select count(*)/* from T as R cross join T as S" 
select count(*) from T as R cross join T as S;
select       *  from T as R cross join T as S;

-- ------------------------------------------------------------------------
\echo "*** select * from T ***" as "Select";
select * from T;

\echo "*** select count(*)/* from T as R inner join T as S" 
select count(*) from T as R inner join T as S using (A);
select       *  from T as R inner join T as S using (A);

-- ------------------------------------------------------------------------
\echo "*** select * from T ***" 
select * from T;

\echo "*** select count(*)/* from T as R left join T as S using (A)" 
select count(*) from T as R left join T as S using (A);
select       *  from T as R left join T as S using (A);

-- ------------------------------------------------------------------------
\echo "*** select * from T ***" 
select * from T;

\echo "*** select count(*)/* from T as R right join T as S using (A)" 
select count(*) from T as R right join T as S using (A);
select       *  from T as R right join T as S using (A);

-- ------------------------------------------------------------------------
\echo "*** select * from T ***" as "Select";
select * from T;

\echo "*** select count(*)/* from T as R natural join T as S using (A)"
select count(*) from T as R natural join T as S;
select       *  from T as R natural join T as S;

-- ------------------------------------------------------------------------
drop table if exists T;

\quit
