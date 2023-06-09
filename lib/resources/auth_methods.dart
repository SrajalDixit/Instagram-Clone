import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> signupUser({
    required String email,
    required String password,
    required String username,
    required String Bio,
    //required Uint8List file,
  }) async {
    String res = "Some error occurred";
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          username.isNotEmpty ||
          Bio.isNotEmpty 
         // file != null
         ) {
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        print(cred.user!.uid);
       await _firestore.collection('users').doc(cred.user!.uid).set({
          'username':username,
          'uid':cred.user!.uid,
          'email':email,
          'bio':Bio,
          'followers':[],
          'following':[],
          
        });
        res='success';
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
