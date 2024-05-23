from flask import jsonify, Blueprint
from utils.database import getconnection

def getallafleveringen():
    with getconnection() as conn:
        conn.execute("SELECT * FROM afleveringen")
        result = conn.fetchall()
        return jsonify(result)


