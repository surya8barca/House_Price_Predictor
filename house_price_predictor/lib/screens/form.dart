
import 'package:flutter/material.dart';
import 'package:house_price_predictor/screens/result.dart';
import 'package:house_price_predictor/shared/formdecoration.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Getdata extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Getdata> {
  double areaincome,areahouseage,areanorooms,areanobedrooms,areapopulation;

  validform(){
    if(areahouseage!=null&&areaincome!=null&&areanorooms!=null&&areanobedrooms!=null&&areapopulation!=null){
      return true;
    }
    else{
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
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
          child: Form(
                      child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextField(
                  keyboardType: TextInputType.number,
                                  style: TextStyle(
                                      color: Colors.blue, fontSize: 25),
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
                                  style: TextStyle(
                                      color: Colors.blue, fontSize: 25),
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
                                  style: TextStyle(
                                      color: Colors.blue, fontSize: 25),
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
                                  style: TextStyle(
                                      color: Colors.blue, fontSize: 25),
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
                                  style: TextStyle(
                                      color: Colors.blue, fontSize: 25),
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
                                SizedBox(height: 40),
                                RaisedButton(
                                  child: Text(
                                'Predict',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                                ),
                                onPressed: (){
                                  if(validform())
                                  {
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Result(areahouseage: areahouseage,areaincome: areaincome,areanobedrooms: areanobedrooms,areanorooms: areanorooms,areapopulation: areapopulation,)));
                                  }
                                  else{
                                    Alert(context: context,title: 'All fields are required',buttons: [],style: AlertStyle(backgroundColor:Colors.cyan)).show();
                                  }
                                },
                                ),
              ],
            ),
          ),
        ),
      ),
      ),
    );
  }
}