-- -----------------
-- ShowDatabases.sql
-- -----------------

-- https://www.postgresql.org/

-- Running the PostgreSQL interactive terminal program
-- $ psql -U postgres -h localhost
-- Password for user postgres :

-- if the password is valid, you receive the following message.
-- psql (10.16)
-- WARNING: Console code page (437) differs from Windows code page (1252)
--         8-bit characters might not work correctly. See psql reference
--         page "Notes for Windows users" for details.
-- Type "help" for help.
-- postgres=#
--

-- list available databases
\list
-- quit postgres
\quit

/*
$ psql --version
psql (PostgreSQL) 10.16
%



$ psql -U postgres --quiet
Password for user postgres:
postgres=# \quit
%


$ psql -U postgres --quiet -H -f ShowDatabases.sql > ShowDatabases.html
Password for user postgres:
% 
*/
