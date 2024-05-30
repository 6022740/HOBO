import mysql.connector


def getconnection():
    """Establishes a connection to the MySQL database."""

    try:
        db = mysql.connector.connect(
            host="localhost",
            user="root",
            passwd="",
            database="hobo2022"
        )
        return db
    except mysql.connector.Error as err:
        print("Error connecting to database:", err)
        return None  # Indicate failure