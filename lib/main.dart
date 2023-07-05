// imported packages to provide functional code from other files
import 'package:flutter/material.dart';
import 'package:procrasti_not/checklistMenu.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:procrasti_not/checklist.dart';
import 'package:procrasti_not/timer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Procrasti-Not',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey.shade50),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Procrasti-Not Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // top of page
      appBar: AppBar(),
      // center of page
      body: Center(
        child: Column(
          children: <Widget>[

            // Container provides Title text
            Container(
              margin: const EdgeInsets.all(25.0),
              color: Colors.grey[200],
              alignment: Alignment.center,
              width: 300.0,
              height: 100.0,
              child: const Text('Procrasti-Not',
                style: TextStyle(fontSize: 40, color: Colors.black),
              ),
            ),

            // Container provides Checklists Button functionalities
            Container(
              margin: const EdgeInsets.all(25.0),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const checklistMenuPage()),
                  );
                },
                style: TextButton.styleFrom(
                    backgroundColor: Colors.grey[200],
                    alignment: Alignment.center,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)
                    )
                ),
                child: const Text("Checklists",
                  style: TextStyle(fontSize: 35, color: Colors.black),
                ),
              ),
            ),

            // TextButton provides Timer Button functionalities
            TextButton(
              // Button press functionalities
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TimerPage()),
                );
              },
              style: TextButton.styleFrom(
                  backgroundColor: Colors.grey[200],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)
                  )
              ),
              child: const Text("Timer",
                style: TextStyle(fontSize: 35, color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
