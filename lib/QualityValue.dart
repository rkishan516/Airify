import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class qualityValue extends StatefulWidget {
  @override
  _qualityValueState createState() => _qualityValueState();
}

class _qualityValueState extends State<qualityValue> {
  bool _validate = false;
  TextEditingController _controller = TextEditingController();
  final _databaseReference = FirebaseDatabase.instance.reference();

  void _onSubmit(String value) {
    setState(() {
      (int.parse(_controller.text) > 1000)
          ? _validate = true
          : _validate = false;
    });
    if (_validate == false) {
      _databaseReference
          .child('SURAT2')
          .update({'buzzer value': int.parse(_controller.text)});
    }
  }

  void _onChange(String value) {
    setState(() {
      (int.parse(_controller.text) > 1000)
          ? _validate = true
          : _validate = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          TextField(
            onChanged: _onChange,
            onSubmitted: _onSubmit,
            controller: _controller,
            decoration: InputDecoration(
              hintText: 'Ex. 175',
              labelText: 'Quality Value for Buzzer',
              errorText: _validate ? 'Value should be between 0 to 1000' : null,
            ),
            keyboardType: TextInputType.number,
            cursorColor: Theme.of(context).primaryColor,
          ),
        ],
      ),
    );
  }
}
