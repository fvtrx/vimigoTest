import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
// import 'package:vimigoTest/indicator/plane_indicator.dart';
import 'package:vimigoTest/model/contactsManager.dart';
import 'package:vimigoTest/model/Contact/contact.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:share/share.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MainContactPage extends StatefulWidget {
  @override
  _MainContactPageState createState() => _MainContactPageState();
}

class _MainContactPageState extends State<MainContactPage> {
  void initState() {
    super.initState();
    initializeApp();
  }

  List<VimigoContact> listOfContacts;
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          title: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(
                  "Vimigo Contacts",
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
              ],
            ),
          ),
        ),
        body: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.black12)),
              ),
            ),
            Expanded(
                child: SafeArea(
              child: _contactList(),
            ))
          ],
        ));
  }

  Widget _contactList() {
    return Container(
      child: new RefreshIndicator(
        child: ListView.builder(
          padding: EdgeInsets.only(top: 20.0),
          itemCount: listOfContacts.length,
          itemBuilder: (context, index) {
            if (listOfContacts == null || listOfContacts.length == 0)
              return Container(
                  child: Center(
                child: Text("No data is recorded"),
              ));

            VimigoContact contact = listOfContacts[index];

            return Container(
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.black12)),
                ),
                child: ListTile(
                  contentPadding: EdgeInsets.all(15),
                  leading: Icon(Icons.contact_phone),
                  title:
                      Text(contact.contactName, style: TextStyle(fontSize: 16)),
                  subtitle: Text(
                      "${contact.phoneNo} \nCreated at: ${timeago.format(contact.checkInDate)}",
                      style: TextStyle(fontSize: 14)),
                  isThreeLine: true,
                  dense: false,
                  trailing: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.red)),
                    onPressed: () {
                      print('Share button clicked');
                      shareContactButton(context, contact);
                    },
                    color: Colors.red,
                    textColor: Colors.white,
                    child: Text("Share".toUpperCase(),
                        style: TextStyle(fontSize: 14)),
                  ),
                ));
          },
        ),
        onRefresh: () async {
          // return await Future.delayed(Duration(seconds: 3));
          int lastIndex = currentIndex + 5;
          print("CurrentIndex : $currentIndex " );
          print("LastIndex : $lastIndex " );
          if (lastIndex <= ContactDataManager.listOfContacts.length) {
            var updatedContact = ContactDataManager.listOfContacts
                .sublist(0, lastIndex);
            currentIndex = lastIndex;
            setState(() {
              listOfContacts = updatedContact;

              Comparator<VimigoContact> sortContactByDate =
                  (a, b) => b.checkInDate.compareTo(a.checkInDate);

              listOfContacts.sort(sortContactByDate);
            });
          } else {
            Fluttertoast.showToast(
              msg: "That's the end of your contact lists!",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.blueAccent,
              textColor: Colors.white,
              fontSize: 16.0
            );
          }
          
          return await Future.delayed(Duration(seconds: 3));
        },
      ),
    );
  }

  void initializeApp() {
    // await ContactDataManager.registerContactData();
    var contactLists = ContactDataManager.listOfContacts;
    print(contactLists);
    var fiveListContact = contactLists.sublist(0, 5);
    currentIndex = 5;

    // for (var i = 0; i < 5; i++) {
    //   fiveListContact.add(contactLists[i]);
    // }
    setState(() {
      listOfContacts = fiveListContact;

      Comparator<VimigoContact> sortContactByDate =
          (a, b) => b.checkInDate.compareTo(a.checkInDate);

      listOfContacts.sort(sortContactByDate);
    });
  }

  void shareContactButton(BuildContext context, VimigoContact contact) {
    final RenderBox box = context.findRenderObject();

    Share.share("${contact.contactName} - ${contact.phoneNo}",
        subject: contact.phoneNo,
        sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
  }
}
