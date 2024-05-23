# Python implementation to create a Database in MySQL
import mysql.connector


def getconnection():
	db = mysql.connector.connect(
		host="localhost",
		user="root",
		passwd="",
    	database="hobo2024"
	)
	conn = db.connect()
	cursor = conn.cursor()
	return cursor
