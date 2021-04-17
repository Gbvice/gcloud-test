import os
import sys

from flask import Flask, current_app
from flask_cors import CORS


app = Flask(__name__)
CORS(app)

@app.route('/bot', methods=['GET'])
def bot(*args, **kwargs):
    return {'response': True}, 200

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080, debug=True)