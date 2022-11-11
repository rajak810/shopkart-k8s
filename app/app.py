from flask import (
    Flask,
    request
)

app = Flask(__name__)

@app.route('/', methods = ['GET'])
def default():
    return "Shopping App"

@app.route('/<path>', methods = ['GET'])
def response(path):
    path == request.view_args['path']
    return f"Service: {path}"

if __name__ == "__main__":
    app.run()