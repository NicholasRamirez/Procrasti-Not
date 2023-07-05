// imported packages to provide functional code from other files
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fluttertoast/fluttertoast.dart';

// Class removes checklist from list
class RemoveChecklist extends StatefulWidget {
  const RemoveChecklist({Key? key, required this.listID, required this.listName}) : super(key: key);
  final String listID, listName;

  @override
  State<RemoveChecklist> createState() => _RemoveChecklistState();
}

class _RemoveChecklistState extends State<RemoveChecklist> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      title: const Text(
        'Remove List',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 16, color: Colors.black),
      ),
      actions: [
        // Button provides cancellation of removing list
        ElevatedButton(
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop();
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.grey,
            alignment: Alignment.center,
          ),
          child: const Text('Cancel'),
        ),

        // Button deletes current list
        ElevatedButton(
          onPressed: () {
            _deleteList();
            Navigator.of(context, rootNavigator: true).pop();
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.grey,
            alignment: Alignment.center,
          ),
          child: const Text('Delete'),
        ),
      ],
    );
  }

  // Deletion of list method
  Future _deleteList() async {
    var collection = FirebaseFirestore.instance.collection('list');
    collection
        .doc(widget.listID)
        .delete()
        .then(
          (_) => Fluttertoast.showToast(
            msg: "List deleted",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.SNACKBAR,
            backgroundColor: Colors.black54,
            textColor: Colors.white,
            fontSize: 14.0),
        )
        .catchError(
          (error) => Fluttertoast.showToast(
              msg: "Deletion failed",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.SNACKBAR,
              backgroundColor: Colors.black54,
              textColor: Colors.white,
              fontSize: 14.0),
        );
  }
}

