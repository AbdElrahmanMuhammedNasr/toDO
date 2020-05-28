import 'package:flutter/material.dart';
import 'package:todo/Model/task.dart';
import 'package:todo/ToDoes.dart';
import 'package:todo/main.dart';
import 'package:intl/intl.dart';

import 'db/database.dart';

class FormF extends StatefulWidget {
  @override
  _FormFState createState() => _FormFState();
}

class _FormFState extends State<FormF> {
  String _title;
  String _task;
  String _character;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // @override
  // void initState(){

  // }

  Databaseprovider databaseprovider = Databaseprovider();

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
        margin: EdgeInsets.symmetric(horizontal: 25, vertical: 50),
        child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Text(
                    'Add new Task',
                    style: TextStyle(fontSize: 20),
                  ),
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
                  // maxLines: 2,
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
                // ListTile(
                //   title: const Text(''),
                //   leading: Radio(
                //     value: 1,
                //     groupValue: _character,
                //     onChanged: ( value) {
                //       setState(() {
                //         _character = value;
                //       });
                //     },
                //   ),
                  
                // ),
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

                    var now = new DateTime.now();
                    var formatter = new DateFormat('yyyy-MM-dd');
                    String formatted = formatter.format(now);

                    Task t = new Task(
                        {'title': _title, 'task': _task, 'time': formatted});
                    databaseprovider.insertTask(t);
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ToDoesList(),
                    ));
                  },
                )
              ],
            )),
      ),
    );
  }
}
