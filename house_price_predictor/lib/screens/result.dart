import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:house_price_predictor/loading/loading.dart';
import 'package:house_price_predictor/screens/form.dart';
import 'package:http/http.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Result extends StatefulWidget {
  final areaincome, areahouseage, areanorooms, areanobedrooms, areapopulation;
  Result(
      {this.areaincome,
      this.areahouseage,
      this.areanorooms,
      this.areanobedrooms,
      this.areapopulation});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Result> {
  int prediction;

  Future<void> predict() async {
    try {
      String url =
          'https://flutteruse.herokuapp.com/predict/?areaincome=${widget.areaincome}&areahouseage=${widget.areahouseage}&areanorooms=${widget.areanorooms}&areanobedrooms=${widget.areanobedrooms}&areapopulation=${widget.areapopulation}';
      Response data = await get(url);
      setState(() {
        prediction = jsonDecode(data.body)['prediction'];
      });
    } catch (e) {
      Alert(
              context: context,
              title: 'Error',
              desc: e.message,
              buttons: [],
              style: AlertStyle(backgroundColor: Colors.cyan))
          .show();
    }
  }

  @override
  void initState() {
    predict();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (prediction == null) {
      return Loading();
    } else {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Text(
            'House Price',
            style: TextStyle(
              fontSize: 28.0,
              color: Colors.blue,
            ),
          ),
        ),
        body: Builder(
          builder: (context) => SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/home.jpg'),
                  fit: BoxFit.fill,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      'Prediction using Linear Regresion',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.orangeAccent,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Text(
                      'Predicted Price acoording to the Details',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Center(
                    child: Text(
                      'Rs. $prediction',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
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
                      'Predict Another House Price',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => Getdata()));
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }
  }
}
