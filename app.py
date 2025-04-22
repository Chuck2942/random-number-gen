from flask import Flask, render_template, request
import random

app = Flask(__name__)

@app.route('/', methods=['GET', 'POST'])
def index():
    number = None
    if request.method == 'POST':
        number = random.randint(1, 1000)
    return render_template('index.html', number=number)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
