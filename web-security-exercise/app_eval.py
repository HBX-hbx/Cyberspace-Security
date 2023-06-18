from flask import Flask, request, render_template, redirect
from IPython import embed
import requests

# 启动flask
app = Flask(__name__)
@app.route('/', methods=['GET', 'POST'])
def index():
    return render_template('eval.html')

if __name__ == '__main__':
    app.run(port=5001)