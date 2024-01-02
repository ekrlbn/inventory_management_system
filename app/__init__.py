from flask import Flask
import configparser


def create_app():
    app = Flask("inventory_app", template_folder="app/templates")
    config = configparser.ConfigParser()
    config.read("config.ini")
    config = config["app"]
    app.secret_key = config["SECRET_KEY"]

    from .views import views
    from .controller import controller

    app.register_blueprint(views, url_prefix="/")

    return app