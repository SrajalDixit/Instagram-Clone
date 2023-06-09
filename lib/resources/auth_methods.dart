import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:instagram_clone/resources/storage_methods.dart';
import 'package:instagram_clone/models/user.dart' as model;


class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<model.User> getUserDetail() async {
    User currentUser = _auth.currentUser!;

    DocumentSnapshot snap = await _firestore.collection('users').doc(currentUser.uid).get();

    return model.User.fromSnap(snap); 
  }

  Future<String> signupUser({
    required String email,
    required String password,
    required String username,
    required String Bio,
    required Uint8List file,
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
        String photoUrl = await StorageMethods().uploadImageToStorage( 'profilePics', file, false);
           
        model.User user = model.User(
          username: username,
          uid : cred.user!.uid,
          email:  email,
          bio:  Bio,
          photoUrl:  photoUrl,
          following: [],
          followers:  [],
        );
        
          

       await _firestore.collection('users').doc(cred.user!.uid).set(user.toJson(),);
        res='success';
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<String> loginUser({required String email , required String password}) async
  {
     String res = "some error occurred";

     try{
      if(email.isNotEmpty || password.isNotEmpty)
      {
        await _auth.signInWithEmailAndPassword(email: email, password: password);
        res = 'success';
      }
      else{
        res = 'Please fill the required fieds';
      }
     
     }
      catch(err){
        res = err.toString();
      }
      return res;
  }
  

  }

