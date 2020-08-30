import 'package:vimigoTest/model/Contact/contact.dart';

abstract class ContactDataManager {
  static List<Contact> listOfContacts;

  static registerContactData(List<Contact> data) {
    listOfContacts = data;
  }
}
