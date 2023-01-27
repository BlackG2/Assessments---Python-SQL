SQL PRACTICAL QUESTIONS

Question 1 - Joining of data with the different types of joins
1.1
Write a query to return all clients and the respective departments that they work in.

SELECT client_id,client_name 
	FROM Client_Info_Table 
		JOIN Company_Table USING (client_id)
WHERE department IN 
	(SELECT department 
		FROM Company_Table)
GROUP BY client_id,client_name,department;

1.2
What type of join would result in all the field from the Client Info table, and only the matching fields from the Company Table?

"INNER JOIN"

1.3) 1.3.1
Consider the table above: write a query to return all employees with their manager.
SELECT id,employee_name 
	COUNT (id) AS Number_of_employees
FROM Employee_Table
JOIN Employee_Table
ON manager_id = id
GROUP BY id, employee_name	

1.3.2
Bonus: who is the boss?

"Werbich"

Question 2 - Apply the correct aggregate function to get certain answers: SUM, COUNT, AVERAGE

SELECT(
	(SELECT SUM(S) FROM Numbers WHERE S >= 0) +
	(SELECT SUM(S) FROM Numbers WHERE S < 0)
	) 
	FROM Numbers AS Total

Question 3 - Query the dataset to identify the duplicate entries in the query output.

SELECT id,employee_name,
	COUNT(*)
FROM Employee_Table
GROUP BY id, employee_name
HAVING COUNT(*) > 1

3.1 - Use a query to determine the 3rd oldest employee in the department

SELECT employee_name
	(SELECT TOP 3 Age() OVER(ORDER BY DateOfBirth) AS row,* FROM Employee_Table)
	Emp
	WHERE row=3

Question 4 - Create two tables with the following fields and limit it to 5 rows per table. Please specify data types

CREATE TABLE Table_1 (
	Make VARCHAR(30) NOT NULL,
	Model VARCHAR(30) NOT NULL,
	Manufacture_Date DATETIME NOT NULL,
	Cost INT NOT NULL,
	Model_id INT,
	PRIMARY KEY (Model_id)
		REFERENCES Models (id)
		ON DELETE CASCADE
	);
CREATE TABLE Table_2 (
	Manufacturer VARCHAR(30) NOT NULL,
	Model_id INT NOT NULL,
	Parts VARCHAR(30) NOT NULL,
	Warranty_Expiry_Date DATETIME NOT NULL,
	City VARCHAR(30) NOT NULL,
	PRIMARY KEY (Model_id),
	FOREIGN KEY (Model_id)
		REFERENCES Models (id)
		ON DELETE CASCADE
	);

Question 5.1 Create a query that returns the following fields: Make, Model, Cost, ManufactureDate, Parts, Warranty_Expiry_Date; Store the output in a temp table called temporary_table

SELECT Make,Model,Cost,Manufacture_Date
INTO temporary_table
	FROM Table_1
UNION ALL
SELECT Parts,Warranty_Expiry_Date
INTO temporary_table
	FROM Table_2


Question 5.2
You encounter the following error:
There is already an object named '##temp' in the database.
How do you fix this?

# You can either create another table with a different name or rename the original primary key name with a new name

Question 6 -Bonus Question
Use OPENQUERY to see all fields in a SQL table called Users in an external database called Vicidial

SELECT * 
	FROM OPENQUERY (Vicidial, 'SELECT * FROM Users')
	