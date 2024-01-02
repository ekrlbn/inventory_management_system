import mysql.connector
import configparser


def get_db_connection():
    config = configparser.ConfigParser()
    config.read("config.ini")
    config = config["mysql"]
    return mysql.connector.connect(
        host=config["DB_HOST"],
        user=config["DB_USER"],
        password=config["DB_PASSWORD"],
        database=config["DB_NAME"],

    )

def get_db_cursor(connection):
    return connection.cursor(dictionary=True)

def close_db_connection(connection):
    connection.close()

def close_db_cursor(cursor):
    cursor.close()

def get_all_products(order_by="name", order="asc"):
    connection = get_db_connection()
    cursor = get_db_cursor(connection)
    cursor.execute(f"SELECT * FROM product ORDER BY {order_by} {order}")
    products = cursor.fetchall()
    close_db_cursor(cursor)
    close_db_connection(connection)
    return products

def get_user(username):
    connection = get_db_connection()
    cursor = get_db_cursor(connection)
    cursor.execute("SELECT * FROM user WHERE username=%s", (username,))
    user = cursor.fetchone()
    close_db_cursor(cursor)
    close_db_connection(connection)
    return user

def authorize_user(session_id, username):
    connection = get_db_connection()
    cursor = get_db_cursor(connection)
    cursor.execute("UPDATE user SET session_id=%s WHERE username=%s", (session_id, username))
    connection.commit()
    close_db_cursor(cursor)
    close_db_connection(connection)

def get_user_by_session_id(session_id):
    connection = get_db_connection()
    cursor = get_db_cursor(connection)
    cursor.execute("SELECT * FROM user WHERE session_id=%s", (session_id,))
    user = cursor.fetchone()
    close_db_cursor(cursor)
    close_db_connection(connection)
    return user