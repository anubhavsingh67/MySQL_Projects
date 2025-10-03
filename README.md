# MySQL_Projects

🧰 What’s Inside & What You Can Do

This repo is built to help:

Explore SQL features
Through the My_SQL_Graded_Project.sql you’ll see usage of CREATE TABLE, INSERT, UPDATE, DELETE, JOIN, subqueries, window functions, and other advanced queries.

Work with realistic data
The .csv files simulate datasets you might see in e-commerce, retail, or supply chain scenarios: products, orders, stores, locations.

Practice ETL / Data import
You can load these CSVs into MySQL (using LOAD DATA INFILE, LOAD DATA LOCAL INFILE, or importing via GUI tools) and build your own querying scenarios.

Modify & extend
Feel free to change table structures, add new tables, create views, write reports, or generate dashboards using your favorite front-end tools.

✅ How to Use This Project

If you want to get started quickly, here’s how:

Clone the repository

git clone https://github.com/anubhavsingh67/MySQL_Projects.git
cd MySQL_Projects


Set up a MySQL database

Create a new database (e.g. mysql_projects_db).

Adjust the SQL script (My_SQL_Graded_Project.sql) if needed (for database name, path to CSVs, etc.).

Import or run the SQL script

Use mysql CLI:

mysql -u your_user -p mysql_projects_db < My_SQL_Graded_Project.sql


Or execute the script via your database GUI (MySQL Workbench, phpMyAdmin, etc.).

Load the CSV data
If the SQL script references external files, ensure the paths are correct and you have permission to import via LOAD DATA.

Start querying
Explore tables, run example queries, and build your own reports or studies.

🧠 Possible Extensions & Ideas

Add indexing and analyze performance (EXPLAIN plans).

Create stored procedures, triggers, or functions.

Build a reporting dashboard using tools like Power BI, Metabase, or a web app with Flask/Django.

Incorporate data cleaning or data transformation steps (ETL pipeline).

Add unit tests (e.g. using pytest + a test DB) to validate query outputs.

🙋 Author & Contact

Author: Anubhav Singh

GitHub Profile: anubhavsingh67

About Me: I’m passionate about databases, backend systems, and solving data challenges.

Contact / Feedback: Feel free to open an issue, drop a pull request, or message me via GitHub.
