import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

bool isWhite = false;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  runApp(MyApp(prefs: prefs));
}

class MyApp extends StatelessWidget {
  late final SharedPreferences prefs;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseStorage firebaseStorage = FirebaseStorage.instance;

  MyApp({required this.prefs});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "csechatApp",
      theme: ThemeData(primaryColor: Colors.black),
      debugShowCheckedModeBanner: false,
      home:
         Scaffold(
      appBar: AppBar(
        title: Text('Csechatapp'),
        centerTitle: true,
      ),
    )
    );
  }
}
