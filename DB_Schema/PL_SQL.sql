

--  ******************** VIEW **********************

/*
A VIEW is a virtual table based on the results of an SQL query. 

We can run complex join queries and present the result in the form of this table

THE SYNTAX USED TO CREATE A VIEW IS AS FOLLOWS:

CREATE OR REPLACE VIEW view_name AS
SELECT Column1, Column2, ...
FROM table_name
WHERE condition ;
*/

select * from countries ;

CREATE VIEW japanese_country AS
SELECT * 
FROM countries
where COUNTRY_ID IN ( select countries.COUNTRY_ID from regions where regions_id = 3 ) ;