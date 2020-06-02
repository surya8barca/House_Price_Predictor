

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:house_price_predictor/loading/loading.dart';
import 'package:http/http.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Result extends StatefulWidget {

  final areaincome,areahouseage,areanorooms,areanobedrooms,areapopulation;
  Result({this.areaincome,this.areahouseage,this.areanorooms,this.areanobedrooms,this.areapopulation});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Result> {

  int prediction;

  Future<void> predict()async{
    try
    {
      String url='https://flutteruse.herokuapp.com/predict/?areaincome=${widget.areaincome}&areahouseage=${widget.areahouseage}&areanorooms=${widget.areanorooms}&areanobedrooms=${widget.areanobedrooms}&areapopulation=${widget.areapopulation}';
      Response data = await get(url);
        setState(() {
          prediction=jsonDecode(data.body)['prediction'];
        });
    }
    catch(e)
    {
      Alert(context: context,title: 'Error',desc: e.message,buttons: [],style: AlertStyle(backgroundColor:Colors.cyan)).show();
    }


  }


  @override
  void initState() {
    predict();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if(prediction==null)
    {
      return Loading();
    }
    else
    {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
        title: Text(
          'House Price Predictor',
          style: TextStyle(
            fontSize: 28.0,
            color: Colors.black,
          ),
        ),
      ),
      body: Builder(builder: (context) => 
      SingleChildScrollView(
        child: Container(
          child: Center(
            child: Text(
              'House Price: $prediction',
              style: TextStyle(
                color: Colors.black,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
      ),
    );
  }
  }
}

