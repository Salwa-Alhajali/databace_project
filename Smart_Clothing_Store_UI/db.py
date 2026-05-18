import mysql.connector

def get_conn():
    return mysql.connector.connect(
        host="localhost",
        user="root",
        password="",
        database="Smart_Clothing_Store_System"
    )