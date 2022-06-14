import 'package:chat/allConstants/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum Status{
  uninitialized,
  authenticated,
  authenticating,
  authenticateError,
  authenticateCanceled,
}
class AuthProvider extends ChangeNotifier{
final GoogleSignIn googleSignIn;
final FirebaseAuth firebaseAuth;
final FirebaseFirestore firebaseFirestore;
final SharedPreferences  prefs;
Status _status=Status.uninitialized; 
Status get status => _status;
AuthProvider({
required this.googleSignIn,
required this.firebaseAuth,
required this.firebaseFirestore,
required this.prefs,

});
 String? getUserFurebaseId()
 {
  return prefs.getString(FirestoreConstants.id);
 }
Future<bool>isLoggedIn() async{
  bool isLoggedIn=await googleSignIn.isSignedIn();
  if(isLoggedIn && prefs.getString(FirestoreConstants.id)?.isNotEmpty==true)
  {
    return true;
  }
  else
  {
    return false;
  }
}
}