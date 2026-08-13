from flask import Flask, render_template
import os

app = Flask(
    __name__,
    template_folder=os.path.join(
        os.path.dirname(os.path.dirname(__file__)),
        "templates"
    )
)

@app.route("/")
def home():
    return render_template("index.html")

@app.route("/health")
def health():
    return "OK"

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5050)