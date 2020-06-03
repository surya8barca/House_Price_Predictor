from flask import Flask,jsonify,request
import joblib
import pandas as pd
from flask.templating import render_template

app = Flask(__name__)

@app.route("/")
def index():
    return render_template('form.html')

@app.route("/predict/",methods=['GET'])
def predict():
    result=request.args
    data=[[float(result["areaincome"]),float(result["areahouseage"]),float(result["areanorooms"]),float(result["areanobedrooms"]),float(result["areapopulation"])]]
    model=joblib.load('house_predictor.sav')
    prediction=model.predict(data)
    return jsonify({'prediction': int(prediction)}) 

if __name__ == '__main__':
    app.run()