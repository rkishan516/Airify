import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class sensorsData extends StatefulWidget {
  @override
  _sensorsDataState createState() => _sensorsDataState();
}

class _sensorsDataState extends State<sensorsData> {
  final _databaseReference =
      FirebaseDatabase.instance.reference().child('SURAT1');
  int _temperature;
  int _humidity;
  int _gasLevel;
  int _airQuality;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _databaseReference.onValue,
      builder: (context, snap) {
        if (snap.hasData &&
            !snap.hasError &&
            snap.data.snapshot.value != null) {
          DataSnapshot snapshot = snap.data.snapshot;
          _temperature = snapshot.value['Temp'];
          _humidity = snapshot.value['Humidity'];
          _gasLevel = snapshot.value['Pressure'];
          _airQuality = snapshot.value['Air Quality'];
          return snap.data.snapshot.value == null
              ? SizedBox()
              : Container(
                  padding: EdgeInsets.all(32.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Expanded(
                            flex: 2,
                            child: Container(
                              padding: EdgeInsets.only(top: 28.0),
                              height: (MediaQuery.of(context).size.height) / 4,
                              decoration: BoxDecoration(
                                  color: (_temperature == null)
                                      ? Theme.of(context).primaryColor
                                      : (_temperature > 40 || _temperature < 0)
                                          ? Colors.red
                                          : (_temperature > 30)
                                              ? Colors.orange
                                              : Colors.green,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0))),
                              child: Column(
                                children: <Widget>[
                                  Text('Temperature',
                                      style: TextStyle(color: Colors.white)),
                                  SizedBox(
                                      height:
                                          (MediaQuery.of(context).size.height) /
                                              32),
                                  Text(
                                    '$_temperature°C',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 32.0,
                                        color: Colors.white),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: SizedBox(
                              height: (MediaQuery.of(context).size.height) / 4,
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              padding: EdgeInsets.only(top: 28.0),
                              height: (MediaQuery.of(context).size.height) / 4,
                              decoration: BoxDecoration(
                                  color: (_humidity == null)
                                      ? Theme.of(context).primaryColor
                                      : (_humidity < 30)
                                          ? Colors.green
                                          : (_humidity < 70)
                                              ? Colors.orange
                                              : Colors.red,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0))),
                              child: Column(
                                children: <Widget>[
                                  Text('Humidity',
                                      style: TextStyle(color: Colors.white)),
                                  SizedBox(
                                      height:
                                          (MediaQuery.of(context).size.height) /
                                              32),
                                  Text(
                                    '$_humidity%',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 32.0,
                                        color: Colors.white),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            flex: 2,
                            child: Container(
                              padding: EdgeInsets.only(top: 28.0),
                              height: (MediaQuery.of(context).size.height) / 4,
                              decoration: BoxDecoration(
                                  color: (_gasLevel == null)
                                      ? Theme.of(context).primaryColor
                                      : (_gasLevel < 100)
                                          ? Colors.green
                                          : (_gasLevel < 170)
                                              ? Colors.orange
                                              : Colors.red,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0))),
                              child: Column(
                                children: <Widget>[
                                  Text('Pressure',
                                      style: TextStyle(color: Colors.white)),
                                  SizedBox(
                                      height:
                                          (MediaQuery.of(context).size.height) /
                                              32),
                                  Text(
                                    '${_gasLevel} atm',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 32.0,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: SizedBox(
                              height: (MediaQuery.of(context).size.height) / 4,
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              padding: EdgeInsets.only(top: 28.0),
                              height: (MediaQuery.of(context).size.height) / 4,
                              decoration: BoxDecoration(
                                  color: (_airQuality == null)
                                      ? Theme.of(context).primaryColor
                                      : (_airQuality < 100)
                                          ? Colors.green
                                          : (_airQuality < 170)
                                              ? Colors.orange
                                              : Colors.red,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0))),
                              child: Column(
                                children: <Widget>[
                                  Text('Air Quality',
                                      style: TextStyle(color: Colors.white)),
                                  SizedBox(
                                      height:
                                          (MediaQuery.of(context).size.height) /
                                              32),
                                  Text(
                                    '$_airQuality',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 32.0,
                                        color: Colors.white),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
