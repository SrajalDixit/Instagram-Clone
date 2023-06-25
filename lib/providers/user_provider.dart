 import 'package:flutter/foundation.dart';
import 'package:instagram_clone/models/user.dart';

class userProvider with ChangeNotifier{
  User? _user;

  User get getUser => _user!;

  Future<void> refreshUser() async{
  
  
  }
}