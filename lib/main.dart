import 'package:flutter/material.dart';
import 'package:fluttersearchviewpk/Constants.dart';
import 'package:page_transition/page_transition.dart';
import 'package:fluttersearchviewpk/DataListScreen.dart';
import 'package:flutter/services.dart';

import 'package:fluttersearchviewpk/SearchScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Country List", textAlign: TextAlign.center)),
        backgroundColor: Colors.deepPurple,
        leading: Icon(
          Icons.menu,
          size: 26.0,
        ),
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          duration: const Duration(milliseconds: 500),
                          alignment: Alignment.topRight,
                          type: PageTransitionType.scale, child: SearchScreen(countryModelListGlobal)
                      ));
                },
                child: Icon(
                  Icons.search,
                  size: 26.0,
                ),
              )),
        ],
        actionsIconTheme:
        IconThemeData(size: 26.0, color: Colors.white, opacity: 10.0),
      ),
      body: DataListScreen(),
    );
  }
}
