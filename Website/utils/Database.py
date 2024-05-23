# Python implementation to create a Database in MySQL
import mysql.connector

# connecting to the mysql server
db = mysql.connector.connect(
	host="localhost",
	user="root",
	passwd="",
    database="hobo2024"
)

# cursor object c
c = db.cursor()

# executing the create database statement
c.execute("SHOW Tables")

# finally closing the database connection
db.close()
