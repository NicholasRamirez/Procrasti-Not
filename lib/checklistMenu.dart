// imported packages to provide functional code from other files
import 'package:flutter/material.dart';
import 'package:procrasti_not/createChecklist.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:procrasti_not/checklist.dart';

class checklistMenuPage extends StatefulWidget {
  const checklistMenuPage({super.key});

  @override
  State<checklistMenuPage> createState() => _checklistMenuPageState();
}

class _checklistMenuPageState extends State<checklistMenuPage> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: Colors.black,
        ),
        body: Column(
          children: [
            // Container provides title text on page
            Container(
              margin: const EdgeInsets.all(25.0),
              color: Colors.grey[200],
              alignment: Alignment.center,
              width: 300.0,
              height: 100.0,
              child: const Text(
                'Checklists',
                style: TextStyle(fontSize: 40, color: Colors.black),
              ),
            ),
            Expanded(
              child: Checklist(),
            ),
          ],
        ),

        // Button to create new lists
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const CreateChecklistPage();
                }
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
