import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'dart:convert' as convert;
import 'contact-detail.screen.dart';
import 'contact.model.dart';
import 'toasts.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController numberController = TextEditingController();

  final List<ContactModel> _contactItems = <ContactModel>[];
  ContactModel _contact = ContactModel();

  @override
  Widget build(BuildContext context) {
    _contactItems.sort((a, b) =>
        a.contactFirstName.toString().compareTo(b.contactFirstName.toString()));
    return Scaffold(
      appBar: AppBar(
        title: const Text('รายชื่อ'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _dialogForm(true, 0),
            color: Colors.white,
          )
        ],
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: _contactItems.isEmpty
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.contact_page_outlined,
                    size: 150,
                    color: Colors.grey[400],
                  ),
                  Text(
                    'ไม่พบรายการข้อมูล',
                    style: TextStyle(fontSize: 24, color: Colors.grey[400]),
                  ),
                ],
              )
            : ListView.builder(
                itemCount: _contactItems.length,
                itemBuilder: (BuildContext context, index) => Card(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                  child: Slidable(
                      key: ValueKey(index),
                      endActionPane: ActionPane(
                        motion: const ScrollMotion(),
                        children: [
                          SlidableAction(
                            onPressed: (context) => _dialogForm(false, index),
                            backgroundColor: Colors.blueAccent,
                            foregroundColor: Colors.white,
                            icon: Icons.edit,
                            label: 'แก้ไข',
                          ),
                          SlidableAction(
                            onPressed: (context) => showDialog<void>(
                                context: context,
                                barrierDismissible: false,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text('ลบข้อมูล'),
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Row(
                                          children: [
                                            const Text('คุณต้องการจะลบข้อมูล '),
                                            Text(
                                              '${_contactItems[index].contactFirstName} ${_contactItems[index].contactLastName}',
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                        const Text(' ใช่หรือไม่?'),
                                      ],
                                    ),
                                    actions: <Widget>[
                                      TextButton(
                                        child: const Text(
                                          'ยกเลิก',
                                          style: TextStyle(color: Colors.black),
                                        ),
                                        onPressed: () =>
                                            Navigator.of(context).pop(),
                                      ),
                                      TextButton(
                                        child: const Text(
                                          'ลบ',
                                          style: TextStyle(
                                              color: Colors.redAccent),
                                        ),
                                        onPressed: () {
                                          _delete(context, index);
                                        },
                                      ),
                                    ],
                                  );
                                }),
                            backgroundColor: Colors.redAccent,
                            foregroundColor: Colors.white,
                            icon: Icons.delete,
                            label: 'ลบ',
                          ),
                        ],
                      ),
                      child: ListTile(
                        onTap: () => Navigator.of(context).pushNamed(
                            ContactDetail.routeName,
                            arguments:
                                convert.jsonEncode(_contactItems[index])),
                        leading: CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.lightBlue[300],
                          child: Text(
                            _contactItems[index].contactFirstName.toString()[0],
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        title: Text(
                            '${_contactItems[index].contactFirstName} ${_contactItems[index].contactLastName}'),
                        subtitle: Text(
                          '${_contactItems[index].contactPhoneNumber}',
                          style: const TextStyle(color: Colors.grey),
                        ),
                      )),
                ),
              ),
      ),
    );
  }

  Future<void> _dialogForm(bool isNew, int index) async {
    _contact = ContactModel();
    if (isNew) {
      firstnameController.text = '';
      lastnameController.text = '';
      numberController.text = '';
    } else {
      firstnameController.text =
          _contactItems[index].contactFirstName.toString();
      lastnameController.text = _contactItems[index].contactLastName.toString();
      numberController.text =
          _contactItems[index].contactPhoneNumber.toString();
    }
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: AlertDialog(
            title: Center(child: Text(isNew ? 'เพิ่มรายชื่อ' : 'แก้ไขรายชื่อ')),
            content: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextFormField(
                    controller: firstnameController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'ไม่ได้กรอก ชื่อ';
                      }
                      return null;
                    },
                    onSaved: (value) =>
                        setState(() => _contact.contactFirstName = value),
                    decoration: const InputDecoration(
                      labelText: 'ชื่อ',
                      hintText: 'ชื่อ',
                    ),
                  ),
                  TextFormField(
                    controller: lastnameController,
                    onSaved: (value) =>
                        setState(() => _contact.contactLastName = value),
                    decoration: const InputDecoration(
                      labelText: 'นามสกุล',
                      hintText: 'นามสกุล',
                    ),
                  ),
                  TextFormField(
                    controller: numberController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'ไม่ได้กรอก เบอร์โทรศัพท์';
                      }
                      return null;
                    },
                    onSaved: (value) =>
                        setState(() => _contact.contactPhoneNumber = value),
                    decoration: const InputDecoration(
                      labelText: 'เบอร์โทรศัพท์',
                      hintText: 'เบอร์โทรศัพท์',
                    ),
                    keyboardType: TextInputType.phone,
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('บันทึก'),
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  _formKey.currentState!.save();
                  Future.delayed(const Duration(milliseconds: 700), () {
                    if (_formKey.currentState!.validate()) {
                      isNew
                          ? _create(context).whenComplete(() =>
                              Toasts.toastSuccess(
                                  context, 'บันทึกข้อมูลสำเร็จ', 2))
                          : _update(context, index).whenComplete(() =>
                              Toasts.toastSuccess(
                                  context, 'แก้ไขข้อมูลสำเร็จ', 2));
                    }
                  });
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _create(BuildContext context) async {
    setState(() {
      _contactItems.add(_contact);
      Navigator.of(context).pop();
    });
  }

  Future<void> _update(BuildContext context, int index) async {
    setState(() {
      _contactItems[index] = _contact;
      Navigator.of(context).pop();
    });
  }

  void _delete(BuildContext context, int index) {
    setState(() {
      _contactItems.removeAt(index);
      Navigator.of(context).pop();
      Toasts.toastError(context, 'ลบข้อมูลสำเร็จ', 2);
    });
  }
}
