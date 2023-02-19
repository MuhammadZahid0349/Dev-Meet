import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dev_meets/Constants/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';

// final FirebaseAuth _auth = FirebaseAuth.instance;
// final FirebaseFirestore _firestore = FirebaseFirestore.instance;

var _auth = FirebaseAuth.instance;
var _firestore = FirebaseFirestore.instance;
var fStorage = FirebaseStorage.instance;

Stream<User?> get authChanges =>
    _auth.authStateChanges(); //check user login or not

User get user => _auth.currentUser!;

Future<bool> signInWithGoogle() async {
  bool res = false;
  try {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    UserCredential userCredential =
        await _auth.signInWithCredential(credential);

    User? user = userCredential.user;

    if (user != null) {
      if (userCredential.additionalUserInfo!.isNewUser) {
        await _firestore.collection('users').doc(user.uid).set({
          'username': user.displayName,
          'uid': user.uid,
          'profilePhoto': user.photoURL,
        });
      }
      res = true;
    }
  } on PlatformException catch (e) {
    CustomizedSnackBar("Error!!  ", e.message);
    res = false;
  }
  return res;
}

void signOut() async {
  try {
    _auth.signOut();
  } catch (e) {
    print(e);
  }
}
