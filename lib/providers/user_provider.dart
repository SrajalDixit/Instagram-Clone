 import 'package:flutter/foundation.dart';
import 'package:instagram_clone/models/user.dart';
import 'package:instagram_clone/resources/auth_methods.dart';

class userProvider with ChangeNotifier{
  
  User? _user;
  final AuthMethods _authMethods = AuthMethods();

  User get getUser => _user!;

  Future<void> refreshUser() async{
  User user =await _authMethods.getUserDetail();
  _user = user;
  notifyListeners();
  
  }
}