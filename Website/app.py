from flask import *
import utils.Database
from utils.routes import simple_page

app = Flask(__name__)

app.register_blueprint(simple_page)

if __name__ == "__main__":
  app.run(debug=True)