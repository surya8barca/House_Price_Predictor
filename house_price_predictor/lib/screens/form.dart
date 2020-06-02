import 'package:flutter/material.dart';
import 'package:house_price_predictor/screens/result.dart';
import 'package:house_price_predictor/shared/formdecoration.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Getdata extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Getdata> {
  double areaincome, areahouseage, areanorooms, areanobedrooms, areapopulation;

  validform() {
    if (areahouseage != null &&
        areaincome != null &&
        areanorooms != null &&
        areanobedrooms != null &&
        areapopulation != null) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          'House Price Predictor',
          style: TextStyle(
            fontSize: 28.0,
            color: Colors.blue,
          ),
        ),
      ),
      body: Builder(
        builder: (context) => SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/home.jpg'),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    'House Price Prediction using Machine Learning',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white,
                        width: 3,
                      ),
                      borderRadius: BorderRadius.circular(15)),
                  child: Form(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Enter Details',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextField(
                          keyboardType: TextInputType.number,
                          style: TextStyle(color: Colors.yellow, fontSize: 25),
                          textInputAction: TextInputAction.next,
                          decoration: formdecoration.copyWith(
                            labelText: 'Avg. Area Income:',
                          ),
                          onChanged: (value) {
                            if (value != null) {
                              setState(() {
                                areaincome = double.parse(value);
                              });
                            }
                          },
                          onSubmitted: (value) {
                            FocusScope.of(context).nextFocus();
                          },
                        ),
                        SizedBox(height: 10),
                        TextField(
                          keyboardType: TextInputType.number,
                          style: TextStyle(color: Colors.yellow, fontSize: 25),
                          textInputAction: TextInputAction.next,
                          decoration: formdecoration.copyWith(
                            labelText: 'Avg. Area House Age:',
                          ),
                          onChanged: (value) {
                            if (value != null) {
                              setState(() {
                                areahouseage = double.parse(value);
                              });
                            }
                          },
                          onSubmitted: (value) {
                            FocusScope.of(context).nextFocus();
                          },
                        ),
                        SizedBox(height: 10),
                        TextField(
                          keyboardType: TextInputType.number,
                          style: TextStyle(color: Colors.yellow, fontSize: 25),
                          textInputAction: TextInputAction.next,
                          decoration: formdecoration.copyWith(
                            labelText: 'Avg. Area Number of Rooms:',
                          ),
                          onChanged: (value) {
                            if (value != null) {
                              setState(() {
                                areanorooms = double.parse(value);
                              });
                            }
                          },
                          onSubmitted: (value) {
                            FocusScope.of(context).nextFocus();
                          },
                        ),
                        SizedBox(height: 10),
                        TextField(
                          keyboardType: TextInputType.number,
                          style: TextStyle(color: Colors.yellow, fontSize: 25),
                          textInputAction: TextInputAction.next,
                          decoration: formdecoration.copyWith(
                            labelText: 'Avg. Area Number of Bedrooms:',
                          ),
                          onChanged: (value) {
                            if (value != null) {
                              setState(() {
                                areanobedrooms = double.parse(value);
                              });
                            }
                          },
                          onSubmitted: (value) {
                            FocusScope.of(context).nextFocus();
                          },
                        ),
                        SizedBox(height: 10),
                        TextField(
                          keyboardType: TextInputType.number,
                          style: TextStyle(color: Colors.yellow, fontSize: 25),
                          textInputAction: TextInputAction.next,
                          decoration: formdecoration.copyWith(
                            labelText: 'Area Population:',
                          ),
                          onChanged: (value) {
                            if (value != null) {
                              setState(() {
                                areapopulation = double.parse(value);
                              });
                            }
                          },
                          onSubmitted: (value) {
                            FocusScope.of(context).nextFocus();
                          },
                        ),
                        SizedBox(height: 30),
                        RaisedButton(
                          color: Colors.blue,
                          padding: EdgeInsets.all(15),
                          shape: RoundedRectangleBorder(
                              side: BorderSide(
                                color: Colors.blue,
                                width: 5,
                              ),
                              borderRadius: BorderRadius.circular(15)),
                          child: Text(
                            'Predict',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          onPressed: () {
                            if (validform()) {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Result(
                                            areahouseage: areahouseage,
                                            areaincome: areaincome,
                                            areanobedrooms: areanobedrooms,
                                            areanorooms: areanorooms,
                                            areapopulation: areapopulation,
                                          )));
                            } else {
                              Alert(
                                      context: context,
                                      title: 'All fields are required',
                                      buttons: [],
                                      style: AlertStyle(
                                          backgroundColor: Colors.cyan))
                                  .show();
                            }
                          },
                        ),
                        SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
