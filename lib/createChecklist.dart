// imported packages to provide functional code from other files
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:procrasti_not/checklistMenu.dart';

class CreateChecklistPage extends StatefulWidget {
  const CreateChecklistPage({super.key});

  @override
  State<CreateChecklistPage> createState() => _CreateChecklistPageState();
}

class _CreateChecklistPageState extends State<CreateChecklistPage> {
  // list name and description controllers
  final TextEditingController checklistNameController = TextEditingController();
  final TextEditingController checklistDescriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    // AlertDialog returns pop up of list information
    return AlertDialog(
      scrollable: true,
      title: const Text(
        'New List',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 20, color: Colors.black),
      ),
      content: SizedBox(
        height: height * 0.35,
        width: width,
        child: Form(
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: checklistNameController,
                style: const TextStyle(fontSize: 15),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 20,
                  ),
                  hintText: 'List',
                  hintStyle: const TextStyle(fontSize: 20),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: checklistDescriptionController,
                style: const TextStyle(fontSize: 15),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 20,
                  ),
                  hintText: 'List Description',
                  hintStyle: const TextStyle(fontSize: 18),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
      actions: [

        // Button to cancel list creation
        ElevatedButton(
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red
          ),
          child: const Text('Cancel',
            style: TextStyle(fontSize: 15, color: Colors.black),
          ),
        ),

        // Button to create list
        ElevatedButton(
          onPressed: () {
            final listName = checklistNameController.text;
            final listDescription = checklistDescriptionController.text;
            _createList(listName: listName, listDescription: listDescription);
            Navigator.of(context, rootNavigator: true).pop();
          },
          child: const Text('Create',
            style: TextStyle(fontSize: 15, color: Colors.black),
          ),
        ),
      ],
    );
  }

  // Create list method using user input
  Future _createList({required String listName, required String listDescription}) async {
    DocumentReference documentRef = await FirebaseFirestore.instance.collection('list').add(
        {
          'listName': listName,
          'listDescription': listDescription,
        },
    );
    String listID = documentRef.id;
    await FirebaseFirestore.instance.collection('list').doc(listID).update(
      {'listID': listID},
    );
  }
}
