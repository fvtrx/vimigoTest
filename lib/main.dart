import 'package:flutter/material.dart';
import 'package:vimigoTest/themes/light_color.dart';
import 'package:vimigoTest/themes/theme.dart';
import 'package:vimigoTest/widgets/title_text.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Vimigo Contact'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Widget _title() {
    return Container(
        margin: AppTheme.padding,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TitleText(
                  text: 'Contact Lists',
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
            Spacer(),
            SizedBox()
          ],
        ));
  }

  Widget _bookingList() {
    return ListView(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      padding: EdgeInsets.all(15),
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(bottom: 15),
          decoration: _tileDecoration(),
          child: ListTile(
            // leading: Image.asset('assets/images/Nike.png'),
            title: Text(
              'Barber Sky - Shafiq',
              style: TextStyle(
                  fontFamily: "WorkSans",
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
           
            subtitle: Text(
              '1 min ago',
              style: TextStyle(
                  fontFamily: "WorkSans", fontWeight: FontWeight.w300),
            ),
            trailing: RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: BorderSide(color: Colors.red)),
              onPressed: () {},
              color: Colors.red,
              textColor: Colors.white,
              child: Text("Call".toUpperCase(),
                style: TextStyle(fontSize: 14)),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 15),
          decoration: _tileDecoration(),
          child: ListTile(
            // leading: Container(
            //   width: 42,
            //   child: Image.asset('assets/images/if_9_avatar_2754584.png'),
            // ),
            title: Text(
              'Barber Sky - Shafiq',
              style: TextStyle(
                  fontFamily: "WorkSans",
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
            subtitle: Text(
              'Jan 18, 2019',
              style: TextStyle(
                  fontFamily: "WorkSans", fontWeight: FontWeight.w300),
            ),
            trailing: Text(
              '+102,00 USD',
              style: TextStyle(fontFamily: "WorkSans"),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 15),
          decoration: _tileDecoration(),
          child: ListTile(
            // leading: ClipOval(
            //   child: Container(
            //     color: LightColor.black,
            //     child: Image.asset(
            //       "assets/images/icon_shop.png",
            //       fit: BoxFit.scaleDown,
            //       width: 35.0,
            //       height: 35.0,
            //     ),
            //   ),
            // ),
            title: Text(
              'Barber Sky - Shafiq',
              style: TextStyle(
                  fontFamily: "WorkSans",
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
            subtitle: Text(
              'Jan 11, 2019',
              style: TextStyle(
                  fontFamily: "WorkSans", fontWeight: FontWeight.w300),
            ),
            trailing: Text(
              '-9,99 USD',
              style: TextStyle(fontFamily: "WorkSans"),
            ),
          ),
        ),
      ],
    );
  }

  BoxDecoration _tileDecoration() {
    return BoxDecoration(
      color: Colors.white,
      border:
          Border.all(color: Colors.white, width: 0, style: BorderStyle.solid),
      borderRadius: BorderRadius.all(
        Radius.circular(5.0),
      ),
      boxShadow: [
        BoxShadow(
            color: LightColor.lightGrey,
            offset: Offset(0, 0),
            blurRadius: 3,
            spreadRadius: 1)
      ],
    );
  }
 
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),

      ),
      body: SafeArea(
        child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          SingleChildScrollView(
            child: Container(
              height: AppTheme.fullHeight(context) - 50,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xfffbfbfb),
                    Color(0xfff7f7f7),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // _title(),
                  _bookingList(),
                ],
              ),
            ),
          ),
        ],
      ),
      ),
    );
  }
}
