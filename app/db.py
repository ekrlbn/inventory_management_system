import mysql.connector
import configparser
import datetime


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

def get_all_purchases():
    connection = get_db_connection()
    cursor = get_db_cursor(connection)
    cursor.execute("SELECT p. FROM purchase p LEFT JOIN purchase_detail pd ON p.id=pd.purchase_id")
    purchases = cursor.fetchall()
    close_db_cursor(cursor)
    close_db_connection(connection)
    return purchases

def get_profit():
    connection = get_db_connection()
    cursor = get_db_cursor(connection)
    cursor.execute("SELECT r.months month, r.revenue,e.expense, (r.revenue-e.expense) profit FROM "
                   + "(SELECT MONTH(s.s_date) months, SUM(sd.quantity * sd.price) AS revenue FROM sale_detail sd LEFT JOIN sale s ON sd.sale_id=s.id GROUP BY MONTH(s.s_date) ORDER BY 1) r "
                   + "LEFT JOIN " 
                   + "(SELECT MONTH(p.p_date) months, SUM(pd.quantity * pd.price) AS expense FROM purchase_detail pd LEFT JOIN purchase p ON pd.purchase_id=p.id GROUP BY MONTH(p.p_date) ORDER BY 1) e "
                   + "ON r.months=e.months;")
    profits = cursor.fetchall()
    close_db_cursor(cursor)
    close_db_connection(connection)
    profits = list(profits)
    for i in range(len(profits)):
        profits[i]["month"] = datetime.date(1900, profits[i]["month"], 1).strftime('%B')
    return profits

def delete_session():
    connection = get_db_connection()
    cursor = get_db_cursor(connection)
    cursor.execute("UPDATE user SET session_id=NULL")
    connection.commit()
    close_db_cursor(cursor)
    close_db_connection(connection)

def get_suppliers():
    connection = get_db_connection()
    cursor = get_db_cursor(connection)
    cursor.execute("SELECT * FROM supplier")
    suppliers = cursor.fetchall()
    close_db_cursor(cursor)
    close_db_connection(connection)
    return suppliers

def add_product(name, quantity, price, supplier):
    connection = get_db_connection()
    cursor = get_db_cursor(connection)
    cursor.execute("INSERT INTO product (name, quantity, current_price, supplier_id) VALUES (%s, %s, %s, %s)", (name, quantity, price, supplier))
    connection.commit()
    close_db_cursor(cursor)
    close_db_connection(connection)

def get_product(product_id):
    connection = get_db_connection()
    cursor = get_db_cursor(connection)
    cursor.execute("SELECT * FROM product WHERE id=%s", (product_id,))
    product = cursor.fetchone()
    close_db_cursor(cursor)
    close_db_connection(connection)
    return product

def update_product(product_id, name, quantity, price, supplier_id):
    connection = get_db_connection()
    cursor = get_db_cursor(connection)
    cursor.execute("UPDATE product SET name=%s, quantity=%s, current_price=%s, supplier_id=%s WHERE id=%s", (name, quantity, price, supplier_id, product_id))
    connection.commit()
    close_db_cursor(cursor)
    close_db_connection(connection)

def delete_product(product_id):
    connection = get_db_connection()
    cursor = get_db_cursor(connection)
    cursor.execute("DELETE FROM product WHERE id=%s", (product_id,))
    connection.commit()
    close_db_cursor(cursor)
    close_db_connection(connection)