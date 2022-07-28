# Pewlett-Hackard-Analysis
PostgreSQL and pgAdmin
 
## Background
As baby boomers start to retire, the client (Pewlett-Hackard) is looking to be prepared for future changes, they want to know who is retiring and how many employees will be retiring.
 
## Overview of Analysis
### Purpose
 
The purpose of this analysis is to help our client determine the number of retiring employees per title, and identify employees who are eligible to participate in a mentorship program. We used PostgresSQL to create a database, and pgAdmin to work with the data that we imported from 6 different CSV files. Additionally, QuickDB was used to create the ERD image.
 
<br/>
 
## Resources
 
Data source:
- (1)departments.csv, (2)dept_emp.csv, (3)dept_manager.csv, (4)employees.csv, (5)salaries.csv, (6)titles.csv
 
Software:
- PostgreSQL 14.0, PgAdmin 4
 
<br/>
 
## Analysis
 
Using QuickDBD, we generated a **conceptual ERD diagram** or schema as the starting base for our analysis as shown in Figure 1.1.
 
<br/>
 
![QuickDB](./Analysis%20Project%20Folder/Pewlett-Hackerd-Analysis%20Folder/Images/EmployeeDB.png)
 
<sub>Figure 1.1 Conceptual ERD
 
<br/>
 
Then we transitioned to create our **logical diagrams** containing the same information that a conceptual diagram does, but updating the tables to include data types and primary keys. (Figure 1.2)
 
![ERD](./Analysis%20Project%20Folder/Pewlett-Hackerd-Analysis%20Folder/Images/ERD.png)
 
<sub>Figure 1.2 Logical ERD
 
<br/>
 
With our tables structure created, we proceeded to import our data or csv files(**physical**) and started to perform our queries per our client instructions. First, we created a query to search for employees born between 1952 and 1955, who were also hired between 1985 and 1988(Figure 1.3) and used this query as the base for our retirement_info.
 
![retirement](./Analysis%20Project%20Folder/Pewlett-Hackerd-Analysis%20Folder/Images/retirement.png)
 
<sub>Figure 1.3 Query-1 Retirement_Titles
 
We created a query to sort out employees with multiple titles or promotions, to only display the most recent title. (Figure 1.4).
 
<br/>
 
![Unique_Titles](./Analysis%20Project%20Folder/Pewlett-Hackerd-Analysis%20Folder/Images/unique_titles.png)
 
<sub>Figure 1.4 Quert-2 Unique_Titles
 
Then, we wrote another query to retrieve the number of employees by their most recent job title who were about to retire. (retiring_titles- Figure 1.5).
 
<br/>
 
![Retiring_Titles](./Analysis%20Project%20Folder/Pewlett-Hackerd-Analysis%20Folder/Images/retiring_titles.png)
 
<sub>Figure 1.5 Query-3 Retiring_Titles
 
<br/>
 
Finally, we wrote a query to create a Mentorship Eligibility table that holds the employees who are eligible to participate in a mentorship program.   (Figure 1.6)
 
![Membership_Elegibility](./Analysis%20Project%20Folder/Pewlett-Hackerd-Analysis%20Folder/Images/mentorship_elegibilit.png)
 
<sub>Figure 1.6 Query-4 Mentorship_Elegibility
 
<br/>
 
Figure 1.7 shows our final **ERD diagram** with our table structure and relationship between tables.
 
![ERD_final](./Analysis%20Project%20Folder/Pewlett-Hackerd-Analysis%20Folder/Images/ERD_final.png)
 
<sub>Figure 1.7 ERD with final tables structure and relationship
 
<br/>
 
 
### Results
 
- There were about **72,458** employees that could potentially be retiring in the upcoming years based on their birth date and hiring date. (Figure 1.5)
- The titles that will be more affected by the baby boomers retiring would be Senior engineers with **25,915** and Senior staff with **24,926**. (Figure 1.5)
- The least affected titles was Managers with only **2** employees retiring. This could be because there are less management positions compared to non-management positions. But could also reflect that the company had a higher rate of turnover for management positions, and the employees occupying these roles are more recent hires that don't meet the client criteria for retirement. (Fig 1.5)
- The mentorship elegibility table reflected that there are about **1,549** employees that meet the client criteria to mentor the next generation.(Fig 1.6)
 
<br/>
 
## Summary
 
- There would be about 72,458 roles that would be needed to fill as the "silver tsunami" begins, 36% are senior engineers and 34% are Senior staff. We have generated a histogram (Fig 1.8) and a pie chart (Fig 1.9) to help with the visualization of the distribution and percentages of retiring titles.
 
<br/>
 
![histogram](./Analysis%20Project%20Folder/Pewlett-Hackerd-Analysis%20Folder/Images/Screenshot%20from%202022-07-26%2019-31-09.png)
 
<sub>Figure 1.8 Histogram - Retiring_Titles
 
<br/>
 
![pie_chart](./Analysis%20Project%20Folder/Pewlett-Hackerd-Analysis%20Folder/Images/Screenshot%20from%202022-07-26%2019-19-49.png)
 
<sub>Figure 1.9 Pie Chart - Retiring_Titles
 
<br/>
 
- If we take a look at the retiring titles table and extract the number of employees that meet the requirements for retirement per our query, the total number is about **72,458** employees, meaning potential vacant positions. If we compare this against the number of employees that qualify for mentorship program that are about **1,549**, this is a ratio of about 46. The client will have to assign about 46 employees per mentor to prepare the next generation of employees.
 
- In order to better help the client, we wrote 2 additional queries, one to filter the "retiring title table by department" (Fig 1.10 - Fig 1.11) and one to filter the "mentorship retiring table by departments" (Fig 1.12). This way, the client would have more insight on information regarding which departments would be more affected and the mentors that they currently have per department. By looking into Figure 1.11, we can see that not all departments are affected equally, deparments like "Development", "Production", and "Sales" are the more affected. This kind of analysis will better position them to plan and assign resources to the different departments according to their needs of vacant positions and to maximize their current resources.
 
<br/>
 
![retiring_by_departmt](./Analysis%20Project%20Folder/Pewlett-Hackerd-Analysis%20Folder/Images/retiring_by_department.png)
 
<sub>Figure 1.10 Retiring Titles by Departments
 
<br/>
 
![histogram_retiring_by_department](./Analysis%20Project%20Folder/Pewlett-Hackerd-Analysis%20Folder/Images/histogram_retiring_by_department.png)
 
<sub>Figure 1.11 Histogram Retiring Titles by Department
 
<br/>
 
![mentorship_retiring_dept](./Analysis%20Project%20Folder/Pewlett-Hackerd-Analysis%20Folder/Images/mentorship_retiring_by_department.png)
 
<sub>Figure 1.12 Mentorship Retiring by Department
 
<br/>
 
- The amount of mentors could be enough if the client uses the current provided information to plan with each department and design mentorship programs in phases based on titles retiring at a given period of time. This way, they can fill out positions and bring out more candidates as the need surges on those vacant positions and departments. To do this, they would need to plan and coordinate which positions retire first based on seniority in order to keep a healthy ratio of mentors and employees.
 
<br/>
 
## References
 
[Markdown](https://docs.github.com/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax)
 
[QuickDBD](https://app.quickdatabasediagrams.com/#/)
 
[Matplotlib gallery](https://matplotlib.org/stable/gallery/index.html)
