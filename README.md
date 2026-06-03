# SQL-X — A Twitter-like social network database management system using SQL scripts
## Overview
SQL-X is a project that provides SQL scripts to manage a database similar to a Twitter-like social network. The database includes tables for users, followers, tweets, and likes, and provides a basic structure for managing these entities. This project aims to provide a simple and efficient way to manage a social network database using SQL.

## Tech Stack
* MySQL
* SQL

## Prerequisites
To use SQL-X, you need to have MySQL installed on your system.

## Getting Started
To get started with SQL-X, clone the repository, create a new MySQL database, and run the SQL scripts provided in the repository. You can do this by running the following commands:
```bash
git clone https://github.com/your-username/SQL-X.git
mysql -u your-username -p your-password
CREATE DATABASE sql_x;
USE sql_x;
SOURCE path/to/SQL-X/sql-scripts.sql
```

## Environment Variables
| Variable | Default | Description |
| --- | --- | --- |
| DB_HOST | localhost | MySQL host |
| DB_PORT | 3306 | MySQL port |
| DB_USER | root | MySQL username |
| DB_PASSWORD | password | MySQL password |
| DB_NAME | sql_x | MySQL database name |

## Testing
To test the SQL scripts, you can run the following command:
```bash
mysql -u your-username -p your-password sql_x < path/to/SQL-X/test-scripts.sql
```

## Contributing
If you want to contribute to SQL-X, please fork the repository, make your changes, and submit a pull request. Make sure to include a detailed description of your changes and any relevant testing or documentation updates.