from flask import Flask
from utils.routes import routes

app = Flask(__name__)
app.secret_key = " 9ay8d2qe';c.as"
app.register_blueprint(routes)



if __name__ == "__main__":
  app.run(debug=True)