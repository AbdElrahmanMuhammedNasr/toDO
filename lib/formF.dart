import 'package:flutter/material.dart';
import 'package:todo/main.dart';

class FormF extends StatefulWidget {
  @override
  _FormFState createState() => _FormFState();
}

class _FormFState extends State<FormF> {
  String _title;
  String _task;
  DateTime _time;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => MyApp(),
              ));
            }),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => FormF(),
                ));
              }),
        ],
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 25,vertical: 50),
        child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Text('Add new Task',style: TextStyle(fontSize: 20),),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Title',
                  ),
                  validator: (String val) {
                    if (val.isEmpty) {
                      return 'Require';
                    }
                  },
                  onSaved: (String val) {
                    _title = val;
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Task',
                  ),
                  validator: (String val) {
                    if (val.isEmpty) {
                      return 'Require';
                    }
                  },
                  onSaved: (String val) {
                    _task = val;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                RaisedButton(
                  child: Text('Add'),
                  color: Colors.blue,
                  colorBrightness: Brightness.dark,
                  onPressed: () {
                    if (!_formKey.currentState.validate()) {
                      return;
                    }
                    _formKey.currentState.save();
                    print(_title);
                  },
                )
              ],
            )),
      ),
    );
  }
}
