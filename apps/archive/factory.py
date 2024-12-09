from flask import Flask
from flask_cors import CORS 
from config import config
from .. import db
from ..models.general.folder import Folder


def create_app(config_name='development'):
    app = Flask(__name__, static_folder='static')
    app.config.from_object(config[config_name])
    config[config_name].init_app(app)
    db.init_app(app)
    CORS(app, resources={r"/archive/v1/*": {"origins": "*"}})

    from . import archive as archive_blueprint
    app.register_blueprint(archive_blueprint, url_prefix='/archive/v1')

    return app
