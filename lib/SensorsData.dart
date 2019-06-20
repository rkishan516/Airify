import 'package:flutter/material.dart';

class sensorsData extends StatefulWidget {
  @override
  _sensorsDataState createState() => _sensorsDataState();
}

class _sensorsDataState extends State<sensorsData> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  child: Column(
                    children: <Widget>[
                      Text('Temperature',
                          style: TextStyle(color: Colors.white)),
                      SizedBox(
                          height: (MediaQuery.of(context).size.height) / 32),
                      Text(
                        '38°C',
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
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  child: Column(
                    children: <Widget>[
                      Text('Humidity', style: TextStyle(color: Colors.white)),
                      SizedBox(
                          height: (MediaQuery.of(context).size.height) / 32),
                      Text(
                        '36%',
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
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  child: Column(
                    children: <Widget>[
                      Text('Gas Level', style: TextStyle(color: Colors.white)),
                      SizedBox(
                          height: (MediaQuery.of(context).size.height) / 32),
                      Text(
                        '120',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 32.0,
                            color: Colors.white),
                      ),
                      Text('ppm', style: TextStyle(color: Colors.white))
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
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  child: Column(
                    children: <Widget>[
                      Text('Air Quality',
                          style: TextStyle(color: Colors.white)),
                      SizedBox(
                          height: (MediaQuery.of(context).size.height) / 32),
                      Text(
                        '150',
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
  }
}
