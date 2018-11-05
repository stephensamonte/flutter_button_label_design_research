
import 'package:flutter/material.dart';

import './TweetListView.dart' as CalSubScheduleView;

// Opened Research View Navigation Drawer
class MainNavigationDrawer extends StatefulWidget {
  MainNavigationDrawer({Key key})
      : super(key: key);

//  final DocumentSnapshot personInformationDocument;

  static const String routeName = "MainNavigationDrawer";

  @override
  MainNavigationDrawerState createState() =>
      new MainNavigationDrawerState();
}

class MainNavigationDrawerState extends State<MainNavigationDrawer> {
  // determines which navigation drawer item was selected.
  int _selectedDrawerIndex = 0;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Button Label InDev"),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.close),
            tooltip: 'Exit',
            onPressed: () {
              Navigator.pop(context);
            }, //
          ),
          new PopupMenuButton<String>(
              padding: EdgeInsets.zero,
              onSelected: showMenuSelection,
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                //              new IconButton(
//                icon: new Icon(Icons.calendar_today),
//                tooltip: 'Calendar',
//                onPressed: () {
//                  Navigator.of(context).pushNamed(CalMainNavigationDrawer
//                      .CalMainNavigationDrawer.routeName);
//                }, //
//              ),
//                    const PopupMenuItem<String>(
//                        value: 'Settings',
//                        child: const ListTile(
//                            leading: const Icon(Icons.settings),
//                            title: const Text('Settings'))),
                const PopupMenuItem<String>(
                    value: 'Feedback',
                    child: const ListTile(
                        leading: const Icon(Icons.feedback),
                        title: const Text('Feedback')))
              ]),
        ],
      ),
      body: _getDrawerItemWidget(_selectedDrawerIndex),
      drawer: new Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the Drawer if there isn't enough vertical
        // space to fit everything.
        child: new ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            new DrawerHeader(
              child: new Text('Drawer Header'),
              decoration: new BoxDecoration(
                color: Colors.orange,
              ),
            ),
            new ListTile(
              title: new Container(
                child: new Row(
                  children: <Widget>[
                    new Container(
                      child: Icon(Icons.view_agenda),

                    ),
                    new Text("Mock 1")
                  ],
                ),
              ),
//              title: new Text('Schedule'),
              onTap: () {
                // Update Fragment
                setState(() {
                  _selectedDrawerIndex = 0;
                });
                // Close Navigation Drawer
                Navigator.pop(context);
              },
            ),
            new ListTile(
              title: new Text('Mock 2'),
              onTap: () {
                // Update Fragment
                setState(() {
                  _selectedDrawerIndex = 1;
                });
                // Close Navigation Drawer
                Navigator.pop(context);
              },
            ),
            new ListTile(
              title: new Text('Mock 3'),
              onTap: () {
                // Update Fragment
                setState(() {
                  _selectedDrawerIndex = 2;
                });
                // Close Navigation Drawer
                Navigator.pop(context);
              },
            ),
            new ListTile(
              title: new Text('Mock 4 or Settings?'),
              onTap: () {
                // Update Fragment
                setState(() {
                  _selectedDrawerIndex = 3;
                });
                // Close Navigation Drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        tooltip: 'Add', // used by assistive technologies
        child: new Icon(Icons.add),
        onPressed: () {
//          DateTime nowUTC = new DateTime.now();
//
//          Duration oneday = new Duration(days: 1);

          // todo add calendar event
        },
      ),
    );
  }

  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        // Schedule View
        return new CalSubScheduleView.TweetListView();
      case 1:
        // Day View
        return new Container(
          child: new Center(child: new Text('Mock 2')),
        );
      case 2:
        // Week View
        return new Container(
          child: new Center(child: new Text('Mock 3')),
        );
      case 3:
        // Month View
        return new Container(
          child: new Center(child: new Text('Mock 4')),
        );

      default:
        return new Container(
          child: new Center(child: new Text('Error')),
        );
    }
  }

  /// App bar action selection.
  showMenuSelection(String value) {
    switch (value) {
      case "Share":
      // todo share intent
        break;
      case "Settings":


//        Navigator.of(context).pushNamed("/SettingsPage");
        break;
      case "Feedback":

        // open feedback url
//        MyUtility.launchURL("https://goo.gl/forms/MLEthJSxgQGgiYQJ2");
        break;
      default:
      // todo notify user that there was an error
    }
//    showInSnackBar('You selected: $value');
  }

}
