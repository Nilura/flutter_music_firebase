import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:music_player_app/screens/Home.dart';
import 'package:music_player_app/screens/Upload.dart';

import 'package:firebase_core/firebase_core.dart';

import 'screens/main_drawer.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _switch=false;
  ThemeData _dark=ThemeData(brightness: Brightness.dark);
  ThemeData _light=ThemeData(brightness: Brightness.light);
  int currentindex = 0;

  List tabs = [
    Home(),
    Upload(),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Music Player",
        theme:_switch ? _dark: _light,
        home: Scaffold(
          appBar: AppBar(
            title: Text("Music Player"),
            flexibleSpace: Container(
              decoration:BoxDecoration(
                gradient: LinearGradient(
                  colors:[Colors.purpleAccent,Colors.pinkAccent],
                  begin: Alignment.bottomRight,
                  end:Alignment.topLeft,


                ),
              ),
            ),
            actions: [
              Switch(value: _switch, onChanged: (_newvalue){
              setState(() {
                _switch=_newvalue;
              });
              }),

            ],
          ),
          drawer: MainDrawer(),
          body: tabs[currentindex],
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.deepPurple,
            currentIndex: currentindex,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text("Home"),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.cloud_upload),
                title: Text("Upload"),
              )
            ],
            onTap: (index) {
              setState(() {
                currentindex = index;
              });
            },
          ),
        ));
  }
}
