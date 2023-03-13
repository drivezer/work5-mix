import 'package:flutter/material.dart';
import 'dart:convert' as convert;

import 'contact.model.dart';

class ContactDetail extends StatefulWidget {
  static const routeName = '/contact-detail';

  const ContactDetail({super.key});

  @override
  State<ContactDetail> createState() => _ContactDetailState();
}

class _ContactDetailState extends State<ContactDetail> {
  bool isLoading = true;
  ContactModel _contact = ContactModel();

  @override
  Widget build(BuildContext context) {
    Object? itemContact = ModalRoute.of(context)?.settings.arguments;
    if (isLoading == true) {
      _contact =
          ContactModel.fromJson(convert.jsonDecode(itemContact.toString()));
      isLoading = false;
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('รายละเอียด'),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: Card(
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.lightBlue[300],
                  child: Text(
                    _contact.contactFirstName.toString()[0],
                    style: const TextStyle(fontSize: 50),
                  ),
                ),
                const SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Row(
                    children: [
                      const Text(
                        'ชื่อ: ',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '${_contact.contactFirstName} ${_contact.contactLastName}',
                        style: const TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Row(
                    children: [
                      const Text(
                        'เบอร์โทรศัพท์: ',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '${_contact.contactPhoneNumber}',
                        style: const TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
