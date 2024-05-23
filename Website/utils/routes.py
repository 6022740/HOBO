from flask import render_template, Blueprint
from api.getdata import getallafleveringen

routes = Blueprint('api', __name__)

@routes.route('/')
def index():
    return render_template('index.html')

@routes.route('/test')
def test():
    data = getallafleveringen()
    return render_template('test.html', data=data)

@routes.route('/login', methods=['POST'])
def login():
    return render_template('login.html')

@routes.route('/register', methods=['POST'])
def register():
    return render_template('register.html')