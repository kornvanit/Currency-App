// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:travel_rate/detail.dart';
import 'money_rate.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  MoneyRate ApiData = new MoneyRate(base: 'base', rates: {'rates': 2.0});
  Iterable<String> names = ['1'];
  Iterable<double> currencies = [1.11];
  var curren = ['2', 2.22];

  @override
  void initState() {
    super.initState();
  }

  Future<MoneyRate> getRate() async {
    var url = Uri.parse("http://10.0.2.2:4200/member");
    var response = await http.get(url);
    ApiData = moneyRateFromJson(response.body);
    names = ApiData.rates.keys;
    currencies = ApiData.rates.values;
    return ApiData;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.purple,
            title: Text("อัตราแลกเปลี่ยนสกุลเงิน"),
          ),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  child: Image.asset(
                    'asset/images/money.png',
                  ),
                  decoration: BoxDecoration(
                    color: Colors.purple,
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.account_circle),
                  title: Text('อัตราการแลกเปลี่ยน'),
                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => Home()));
                  },
                ),
              ],
            ),
          ),
          body: SafeArea(
            child: FutureBuilder(
              future: getRate(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  var result = snapshot.data;
                  return ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: names.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 20)),
                          GestureDetector(
                            onTap: () => {
                              curren = [
                                names.elementAt(index).toString(),
                                currencies.elementAt(index)
                              ],
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Detail(),
                                  settings: RouteSettings(
                                    arguments: curren,
                                  ),
                                ),
                              )
                            },
                            child: Container(
                              width: 300,
                              height: 150,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.purple.shade200),
                              child: Row(
                                children: [
                                  Image.asset(
                                    "asset/images/" +
                                        names.elementAt(index).toString() +
                                        "_flag.png",
                                    width: 80,
                                    height: 80,
                                  ),
                                  Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(50, 0, 0, 0)),
                                  Text(
                                    names.elementAt(index).toString(),
                                    style: TextStyle(fontSize: 50),
                                  ),
                                ],
                              ),
                              padding: EdgeInsets.all(20),
                            ),
                          )
                        ],
                      );
                    },
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          )),
    );
  }
}
