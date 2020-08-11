import 'package:flutter/material.dart';
import 'package:tasks/main.dart';

class NewTask extends StatefulWidget {
  @override
  _NewTaskState createState() => _NewTaskState();
}

class _NewTaskState extends State<NewTask> {
  Widget build(BuildContext context) {
    print('inside show');
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(32.0, 48.0, 0, 0),
              child: TextField(
                autofocus: true,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                style: TextStyle(fontSize: 24.0),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'New Task',
                ),
              ),
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(32.0, 20, 0, 0),
              child: TextField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                style: TextStyle(fontSize: 20.0),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Add Description',
                ),
              ),
            ),
          ),
          RaisedButton(
            child: Text("Save"),
            onPressed: () {
              print('about to save task');
              Navigator.pop(
                context,
                MaterialPageRoute(builder: (context) => App()),
              );
            },
          ),
        ],
      ),
    );
  }
}
