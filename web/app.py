from flask import request, Flask
import json

app = Flask(__name__)


@app.route("/")
def hello_world():
    return "Hello from Flask !"


@app.route('/plus_one')
def plus_one():
    x = int(request.args.get('x', 1))
    return json.dumps({'x': x + 1})


@app.route('/plus_two')
def plus_two():
    x = int(request.args.get('x', 1))
    return json.dumps({'x': x + 2})


@app.route('/square')
def square():
    x = int(request.args.get('x', 1))
    return json.dumps({'x': x * x})

if __name__ == '__main__':
 app.run(debug=True,host='0.0.0.0', port=5000)
