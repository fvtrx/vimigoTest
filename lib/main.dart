import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:vimigoTest/model/contactsManager.dart';
import 'package:vimigoTest/view/main_contact_page.dart';

void main() {
  runApp(MaterialApp(
    title: 'Navigation Basics',
    home: MyHomePage(),
  ));
}

BuildContext _mainContext;

class MyHomePage extends StatefulWidget {
  // MyHomePage({Key key, this.title}) : super(key: key);
  // final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void initState() {
    super.initState();
    initializeApp();
  }

  @override
  Widget build(BuildContext context) {
    _mainContext = context;
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new StartupScreen(),
    );
  }
}

class StartupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // Image.asset(
          //   "asset/kwsp.png",
          //   height: 200,
          //   width: 200,
          // ),
          Lottie.asset(
            "asset/loading.json",
            height: 200,
            width: 200,
            // autoplay: true
          ),
          Text(
            "Initializing app..",
            textScaleFactor: 1.2,
          )
        ],
      )),
    );
  }
}

Future<void> initializeApp() async {
  await ContactDataManager.registerContactData();
  await new Future.delayed(const Duration(seconds: 2));
  Navigator.pushAndRemoveUntil(
    _mainContext,
    MaterialPageRoute(builder: (_maincntext) => MainContactPage()),
    (Route<dynamic> route) => false,
  );
}
