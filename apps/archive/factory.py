from flask import Flask
from flask_cors import CORS 
from config import config
from .. import db
from ..models.general.folder import Folder
from sqlalchemy.event import listens_for


def create_app(config_name='development'):
    app = Flask(__name__, static_folder='static')
    app.config.from_object(config[config_name])
    config[config_name].init_app(app)
    db.init_app(app)

    def generate_unique_id():
        import random
        while True:
            unique_id = random.randint(1000000000, 9999999999)
            if not Folder.query.filter_by(unique_id=unique_id).first():
                return unique_id

    @listens_for(Folder, 'before_insert')
    def assign_unique_id(mapper, connection, target):
        if not target.unique_id:
            target.unique_id = generate_unique_id()

    CORS(app, resources={r"/archive/v1/*": {"origins": "*"}})

    from . import archive as archive_blueprint
    app.register_blueprint(archive_blueprint, url_prefix='/archive/v1')

    return app
