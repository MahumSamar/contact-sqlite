import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import '../models/contact.dart';
import '../views/base_view.dart';
import '../presenters/contacts_presenter.dart';
import 'contact_details.dart';
import 'contact_list.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, required this.title}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> implements BaseView {
  late ContactsPresenter contactsPresenter;

  @override
  void initState() {
    super.initState();
    contactsPresenter = ContactsPresenter.withView(this);
  }

  displayRecord() {
    setState(() {});
  }

  Widget _buildTitle(BuildContext context) {
    var horizontalTitleAlignment =
        Platform.isIOS ? CrossAxisAlignment.center : CrossAxisAlignment.center;

    return InkWell(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: horizontalTitleAlignment,
          children: const <Widget>[
            Text(
              'Contacts',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future _openAddUserDialog() async {
    showDialog(
      context: context,
      builder: (BuildContext context) =>
          ContactDialog().build(context, this, false, null),
    );

    screenUpdate();
  }

  List<Widget> _buildActions() {
    return <Widget>[
      IconButton(
        icon: const Icon(
          Icons.group_add,
          color: Colors.white,
        ),
        onPressed: _openAddUserDialog,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _buildTitle(context),
        actions: _buildActions(),
      ),
      body: FutureBuilder<List<Contact>>(
        future: contactsPresenter.getAll(),
        builder: (context, snapshot) {
          return ContactList(snapshot.data ?? [], contactsPresenter);
        },
      ),
    );
  }

  @override
  void screenUpdate() {
    setState(() {});
  }
}
