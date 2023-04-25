/*1)	Select employee details  of dept number 10 or 30*/

Select * 
From Emp_Table
Where DeptNo = 10 OR 30;

/*2)	Write a query to fetch all the dept details with more than 1 Employee.*/

Select * 
from Emp_Table
where count(DeptNo) > 1;

/*3)	Write a query to fetch employee details whose name starts with the letter “S”*/

SELECT *
from Emp_Table
WHERE Ename LIKE 'S%';


/*4)	Select Emp Details Whose experience is more than 2 years*/

SELECT *
FROM Emp_Table
WHERE age(CURRENT_DATE, Hire_Date) >2 ;


/*5)	Write a SELECT statement to replace the char “a” with “#” in Employee Name */

SELECT REPLACE('Ename', 'a', '#') 
from Emp_Table;
 
 
/*6)	Write a query to fetch employee name and his/her manager name.*/

SELECT * 
FROM Emp_Table 
WHERE (EmpNo IN (SELECT Mgr FROM Emp_Table));
 
 
/*7)	Fetch Dept Name , Total Salry of the Dept*/

SELECT DeptNo, SUM(Sal) 
FROM Emp_Table GROUP BY DeptNo;
 
 
/*8)	Write a query to fetch ALL the employee details along with department name, department location, irrespective of employee existence in the department.*/

SELECT * 
FROM Emp_Table As E, Dept_Table As D 
WHERE E.DeptNo= D.DeptNo;
 
 
/*9)	Write an update statement to increase the employee salary by 10 %*/

UPDATE Emp_Table SET Sal = Sal + (Sal * 10/100);


/*10)	 Write a statement to delete employees belong to Chennai location.*/

DELETE FROM Emp_Table 
WHERE DeptNo= (SELECT DeptNo from Dept_Table WHERE Loc = “Chennai”);
 
 
/*11)	Get Employee Name and gross salary (sal + comission) .*/

SELECT Ename, (Sal +Commission ) as gross_salary from Emp_Table;


/*12)	Increase the data length of the column Ename of Emp table from  100 to 250 using ALTER statement*/

ALTER TABLE Emp_Table ALTER COLUMN EName VARCHAR(250);
  
  
/*13)	Write query to get current datetime*/

SELECT CURRENT_TIMESTAMP AS "CURRENT_DATE_TIME";
 
 
/*14)	Write a statement to create STUDENT table, with related 5 columns*/

CREATE TABLE STUDENT ( STD_ID NUMBER(10),NAME VARCHAR(20), DOB DATE, DOJ DATE,  GENDER CHAR;


/*15)	Write a query to fetch number of employees in who is getting salary more than 10000*/

SELECT Count(*) 
FROM Emp_Table 
WHERE Sal >= 10000;

/*16)	Write a query to fetch minimum salary, maximum salary and average salary from emp table.*/

SELECT DeptNo, MAX(Sal) AS MAXSALARY, MIN(Sal) AS MINSALARY, AVG(Sal) AS AVGSALARY 
FROM Emp_Table;
 

/*17)	Write a query to fetch number of employees in each location*/

SELECT Loc, COUNT(*) 
FROM Emp_Table E, Dept_Table D 
WHERE E.DeptNo = D.DeptNo;
 
 
/*18)	Write a query to display emplyee names in descending order*/

SELECT Ename 
FROM Emp_Table ORDER BY Ename ASC;
 
 
/*19)	Write a statement to create a new table(EMP_BKP) from the existing EMP table */

CREATE TABLE EMP_BKP AS SELECT * FROM EMP;
 

/*20)	Write a query to fetch first 3 characters from employee name appended with salary.*/
 
SELECT (SUBSTRING(Ename,1,3)+Sal) 
FROM Emp_Table;
 
 
/*21) Get the details of the employees whose name starts with S */

Select * 
from Emp_Table 
where Ename LIKE 'S%';


/*22) Get the details of the employees who works in Bangalore location*/

SELECT * 
FROM Emp_Table E, Dept_Table D WHERE E.DeptNo= D.DeptNo AND D.Loc = "Bangalore";


/*23) Write the query to get the employee details whose name started within  any letter between  A and K	*/

SELECT Ename 
FROM Emp_Table  
WHERE Ename LIKE '[A-E]%';

/*24)  Write a query in SQL to display the employees whose manager name is Stefen */

SELECT * 
FROM Emp_Table #
WHERE  Mgr = ( SELECT Mgr FROM Emp_Table WHERE Ename = “Stefen ” );
 
 
/*25) Write a query in SQL to list the name of the managers who is having maximum number of employees working under him*/

SELECT Mgr 
FROM Emp_Table  GROUP BY Mgr HAVING COUNT(*) = (SELECT MAX( COUNT ( Mgr ) ) FROM Emp_Table GROUP BY Mgr );
 
 
/*26) Write a query to display the employee details, department details and the manager details of the employee who has second highest salary*/

SELECT * 
FROM Emp_Table E, Dept_Table D 
WHERE E.DeptNo= D.DeptNo AND E.Sal = ( SELECT MAX ( Sal) FROM Emp_Table WHERE Sal < ( SELECT MAX( Sal ) FROM Emp_Table) );


/*27) Write a query to list all details of all the managers*/

SELECT * 
FROM Emp_Table 
WHERE EmpNo IN (SELECT Mgr FROM Emp_Table );
 
 
/*28) Write a query to list the details and total experience of all the managers*/

SELECT *, age(CURRENT_DATE, Hire_Date) "Experience" 
FROM Emp_Table 
WHERE EmpNo IN (SELECT Mgr FROM Emp_Table );
 
 
/*29) Write a query to list the employees who is manager and  takes commission less than 1000 and works in Delhi*/

SELECT * 
FROM Emp_Table E, Dept_Table D 
WHERE EmpNo IN (SELECT Mgr FROM Emp_Table ) AND Commission < 1000 AND D.Loc = “Delhi” WHERE E.DeptNo= D.DeptNo ;
 
 
/*30) Write a query to display the details of employees who are senior to Martin */

SELECT * 
FROM Emp_Table 
WHERE Hire_Date < ( SELECT Hire_Date FROM Emp_Table WHERE Ename = “Martin” );
