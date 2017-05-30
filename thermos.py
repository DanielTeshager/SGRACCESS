from flask import Flask, render_template, url_for, flash

app = Flask(__name__)
app.secret_key = 'some_secret'

@app.route('/')
@app.route('/index')
def index():
    flash("This is the index page")
    return render_template("index.html")

@app.errorhandler(404)
def page_not_found(e):
    return render_template('404.html'), 404

@app.errorhandler(500)
def server_error(e):
    return render_template('500.html'), 500

if __name__=="__main__":
    app.run(debug=True)
