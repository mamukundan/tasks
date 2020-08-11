import 'package:flutter/material.dart';
import 'package:tasks/screens/new-task.dart';

void main() {
  runApp(MaterialApp(title: "Tasks", theme: ThemeData.dark(), home: App()));
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  int currentMenuIdx = 0;

  final tabs = [
    Center(
      child: Text("home"),
    ),
    Center(
      child: Text("todo"),
    ),
    Center(
      child: Text("done"),
    ),
    Center(
      child: Text(''),
    )
  ];

  updateMenuIdx(int idx) {
    if (idx == tabs.length - 1) {
      idx = idx - 1;
    }
    setState(() {
      currentMenuIdx = idx;
    });
  }

  PopupMenuButton createPopupMenuButton() {
    const popupMenuItemsTitle = [
      'Sort by',
      'Rename list',
      'Delete list',
      'Delete all completed tasks',
      'Settings'
    ];
    List<PopupMenuItem> popupMenuItems = [];
    PopupMenuItem popupMenuItem;
    for (String popupMenuItemTitle in popupMenuItemsTitle) {
      popupMenuItem = PopupMenuItem(
        child: Text(popupMenuItemTitle),
        value: popupMenuItemTitle,
      );
      popupMenuItems.add(popupMenuItem);
    }
    PopupMenuButton popupMenuButton = PopupMenuButton(
      itemBuilder: (BuildContext context) => popupMenuItems,
    );
    return popupMenuButton;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Tasks App")),
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 24.0),
              child: ListTile(
                title: Text(
                  "Task Menu",
                  style: TextStyle(fontSize: 24.0),
                ),
              ),
            ),
            Divider(
              thickness: 2.0,
            ),
            FlatButton(
              child: ListTile(
                title: Text(
                  "    My Tasks",
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
            ),
            Divider(
              thickness: 1.0,
            ),
            FlatButton(
              child: ListTile(
                title: Text(
                  "+  Create new list",
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
            ),
            Divider(
              thickness: 1.0,
            ),
            FlatButton(
              child: ListTile(
                title: Text(
                  "   Help and Feedback",
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
            ),
            Divider(
              thickness: 1.0,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        hoverElevation: 900.0,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NewTask()),
          );
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
        elevation: 2.0,
      ),
      body: tabs[currentMenuIdx],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            title: Text("Home"),
            icon: Icon(Icons.home),
            backgroundColor: Colors.transparent,
          ),
          BottomNavigationBarItem(
            title: Text("Todo"),
            backgroundColor: Colors.transparent,
            icon: Icon(Icons.timer),
          ),
          BottomNavigationBarItem(
            title: Text("Done"),
            icon: Icon(Icons.check_circle),
            backgroundColor: Colors.transparent,
          ),
          BottomNavigationBarItem(
            title: Text(''),
            icon: createPopupMenuButton(),
          )
        ],
        currentIndex: currentMenuIdx,
        onTap: (value) {
          print('nav bar tapped: $value');
          updateMenuIdx(value);
        },
      ),
    );
  }
}
