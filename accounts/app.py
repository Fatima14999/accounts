from flask import Flask, jsonify, request
from flask_cors import CORS
from flask_talisman import Talisman

app = Flask(__name__)
CORS(app)
Talisman(app)

accounts = []

@app.route('/')
def home():
    return jsonify({"message": "Accounts Service Running"})

@app.route('/accounts', methods=['POST'])
def create_account():
    data = request.get_json()
    accounts.append(data)
    return jsonify(data), 201

@app.route('/accounts', methods=['GET'])
def list_accounts():
    return jsonify(accounts)

@app.route('/accounts/<int:index>', methods=['GET'])
def read_account(index):
    return jsonify(accounts[index])

@app.route('/accounts/<int:index>', methods=['PUT'])
def update_account(index):
    data = request.get_json()
    accounts[index] = data
    return jsonify(data)

@app.route('/accounts/<int:index>', methods=['DELETE'])
def delete_account(index):
    accounts.pop(index)
    return '', 204

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)
