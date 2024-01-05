from flask import Blueprint, render_template, request, redirect, url_for, flash, session
import uuid

import app.db as db

views = Blueprint("views", __name__)

@views.route("/")
def home():
    if "session_id" in session and authorize_user(session["session_id"]):
        return redirect(url_for("views.inventory"))
    return redirect(url_for("views.login"))

@views.route("/login")
def login():
    return render_template("login.html")

@views.route("/login", methods=["POST"])
def login_post():
    username = request.form.get("username")
    password = request.form.get("password")
    user = db.get_user(username)
    if user is None or user["password"] != password:
        flash("Invalid credentials")
        return redirect(url_for("views.login"))

    session_id = str(uuid.uuid4())
    db.authorize_user(session_id, username)

    session["session_id"] = session_id

    return redirect(url_for("views.inventory"))

def authorize_user(session_id: str):
    user = db.get_user_by_session_id(session_id)
    if user is None:
        return False
    return True


@views.route("/inventory")
def inventory():
    if "session_id" not in session or not authorize_user(session["session_id"]):
        return redirect(url_for("views.login"))
    
    order_by = request.args.get("order_by")
    order = request.args.get("order")
    if order_by is None or order_by not in ["name", "quantity", "current_price"]:
        order_by = "name"
    if order is None or order not in ["asc", "desc"]:
        order = "asc"

    products = db.get_all_products( order_by=order_by, order=order)
    reverse_order = "desc" if order == "asc" else "asc"
    return render_template("inventory.html", products=products, reverse_order=reverse_order)

@views.route("/purchases")
def purchases():
    if "session_id" not in session or not authorize_user(session["session_id"]):
        return redirect(url_for("views.login"))
    
    purchases = db.get_all_purchases()
    return render_template("purchases.html", purchases=purchases)

@views.route("/profits")
def revenue():
    if "session_id" not in session or not authorize_user(session["session_id"]):
        return redirect(url_for("views.login"))
    
    profits = db.get_profit()
    return render_template("profits.html", profits=profits)

@views.route("/logout")
def logout():
    session.pop("session_id", None)
    db.delete_session()
    return redirect(url_for("views.login"))

@views.route("/new_product", methods=["POST"])
def add_product():
    if "session_id" not in session or not authorize_user(session["session_id"]):
        return redirect(url_for("views.login"))
    name = request.form.get("name")
    quantity = request.form.get("quantity")
    price = request.form.get("price")
    supplier_id = request.form.get("supplier_id")
    db.add_product(name, quantity, price, supplier_id)
    return redirect(url_for("views.inventory"))

@views.route("/new_product")
def new_product():
    if "session_id" not in session or not authorize_user(session["session_id"]):
        return redirect(url_for("views.login"))
    suppliers = db.get_suppliers()
    return render_template("add_product.html", suppliers=suppliers)

@views.route("/product/<int:product_id>")
def product(product_id):
    if "session_id" not in session or not authorize_user(session["session_id"]):
        return redirect(url_for("views.login"))
    product = db.get_product(product_id)
    return render_template("product.html", product=product, suppliers=db.get_suppliers())

@views.route("/product/<int:product_id>", methods=["POST"])
def update_product(product_id):
    if "session_id" not in session or not authorize_user(session["session_id"]):
        return redirect(url_for("views.login"))
    name = request.form.get("name")
    quantity = request.form.get("quantity")
    price = request.form.get("price")
    supplier_id = request.form.get("supplier_id")
    db.update_product(product_id, name, quantity, price, supplier_id)
    return redirect(url_for("views.inventory"))

@views.route("/product_delete/<int:product_id>", methods=["POST"])
def delete_product(product_id):
    if "session_id" not in session or not authorize_user(session["session_id"]):
        return redirect(url_for("views.login"))
    db.delete_product(product_id)
    return redirect(url_for("views.inventory"))