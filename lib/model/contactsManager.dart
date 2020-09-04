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
  }

  // static List<VimigoContact> updateList() {
  //   VimigoContact contact = new VimigoContact();
  //   contact.contactName = "Ahmad Redzuan";
  //   contact.phoneNo = "011277901323";
  //   contact.checkInDate = new DateTime.now();

  //   listOfContacts.add(contact);
  //   return listOfContacts;
  // }
}
