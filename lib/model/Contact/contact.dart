class Contact {
  // int id;
  String contactName;
  DateTime checkInDate;
  String phoneNo;

  Contact({this.contactName, this.checkInDate, this.phoneNo});

  factory Contact.fromJson(Map<String, dynamic> json) {
    return Contact(
        contactName: json['name'] as String,
        checkInDate: json['check_in'] as DateTime,
        phoneNo: json['phone'] as String);
  }

  
}
