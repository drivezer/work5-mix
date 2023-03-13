class ContactModel {
  String? contactFirstName;
  String? contactLastName;
  String? contactPhoneNumber;

  ContactModel(
      {this.contactFirstName, this.contactLastName, this.contactPhoneNumber});

  factory ContactModel.fromJson(Map<String, dynamic> parsedJson) {
    try {
      return ContactModel(
          contactFirstName: parsedJson['contactFirstName'],
          contactLastName: parsedJson['contactLastName'],
          contactPhoneNumber: parsedJson['contactPhoneNumber']);
    } catch (ex) {
      print('ContactModel ====> $ex');
      throw ('factory ContactModel.fromJson ====> $ex');
    }
  }

  Map<String, dynamic> toJson() => {
        'contactFirstName': contactFirstName,
        'contactLastName': contactLastName,
        'contactPhoneNumber': contactPhoneNumber,
      };
}
