from flask import render_template, Blueprint
from api.getdata import getallafleveringen, getafleveringbyID, getseries, getseriesByID

routes = Blueprint('api', __name__)

@routes.route('/')
def index():
    return render_template('index.html')

@routes.route('/episodes')
def allepisodes():
    data = getallafleveringen()
    return render_template('episodes.html', data=data)

@routes.route('/episodebyID')
def episodebyID():
    data = getafleveringbyID(8192)
    return render_template('episodes.html', data=data)

@routes.route('/series')
def allseries():
    data = getseries()
    return render_template('series.html', data=data)

@routes.route('/seriebyID')
def seriebyID():
    data = getseriesByID(23)
    return render_template('series.html', data=data)

@routes.route('/sidebar')
def sidebar():
    return render_template('sidebar.html')