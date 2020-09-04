class VimigoContact {
  // int id;
  String contactName;
  DateTime checkInDate;
  String phoneNo;

  VimigoContact({this.contactName, this.checkInDate, this.phoneNo});

  factory VimigoContact.fromJson(Map<String, dynamic> json) {
    return VimigoContact(
        contactName: json['name'] as String,
        checkInDate: json['check_in'] as DateTime,
        phoneNo: json['phone'] as String);
  }
}
