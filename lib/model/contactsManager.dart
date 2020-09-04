import 'package:mongo_dart/mongo_dart.dart';
import 'package:vimigoTest/model/Contact/contact.dart';

abstract class ContactDataManager {
  static List<VimigoContact> listOfContacts;

  static Future registerContactData() async {
    var contactDb = await Db.create(
        "mongodb+srv://fastcut_admin:fastcut123@fastcut-tmuui.azure.mongodb.net/vimigo_contact_db?retryWrites=true&w=majority&useNewUrlParser=true");

    await contactDb.open();

    var contactCollection = contactDb.collection('contacts');

    print(contactCollection);
    listOfContacts = new List<VimigoContact>();
    await contactCollection.find().forEach((element) {
      VimigoContact contact = new VimigoContact();
      if (element != null) {
        contact.contactName = element['name'];
        contact.phoneNo = element['phone'];
        contact.checkInDate = element['check_in'];
        if (contact != null) {
          listOfContacts.add(contact);
        }
      }
    });

    print(listOfContacts.length);

    // var data =
    //     await contactCollection.find(where.lt("name", "Chan Saw Lin")).toList();

    // listOfContacts = data;
  }

  // static List<VimigoContact> sortContactListBasedOnDate(DateTime checkInDate) {
  //   var sortedData = new List<VimigoContact>();
  // }
}
