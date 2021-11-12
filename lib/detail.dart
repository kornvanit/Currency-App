// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home.dart';

class Detail extends StatefulWidget {
  Detail({Key? key}) : super(key: key);

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    final currency = ModalRoute.of(context)!.settings.arguments as List;

    return MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.purple.shade100,
          appBar: AppBar(
            backgroundColor: Colors.purple,
            title: Text("อัตราแลกเปลี่ยนสกุลเงิน " + currency[0]),
            leading: GestureDetector(
              onTap: () => {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => Home()))
              },
              child: Icon(Icons.arrow_back_ios_new_rounded),
            ),
          ),
          body: Center(
            child: Column(
              children: [
                Image.asset(
                  "asset/images/" + currency[0] + "_flag.png",
                ),
                Padding(padding: EdgeInsets.fromLTRB(0, 40, 0, 0)),
                Text(
                  "1 " + currency[0],
                  style: TextStyle(fontSize: 50),
                  textAlign: TextAlign.center,
                ),
                Padding(padding: EdgeInsets.fromLTRB(0, 30, 0, 0)),
                Text("เท่ากับ",
                    style: TextStyle(fontSize: 50),
                    textAlign: TextAlign.center),
                Padding(padding: EdgeInsets.fromLTRB(0, 30, 0, 0)),
                Text(currency[1].toString() + " THB",
                    style: TextStyle(fontSize: 50),
                    textAlign: TextAlign.center),
              ],
            ),
          )),
    );
  }
}
