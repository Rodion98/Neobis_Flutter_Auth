// import 'package:firebase_auth/firebase_auth.dart';
import 'models/models.dart';

abstract class UserRepository {
  MyUser get user;

  // Future<MyUser> signUp(
  //     // MyUser myUser,
  //     String emasil,
  //     String password);

  // Future<void> setUserData(MyUser user);

  Future<void> signIn(String email, String password);

  // Future<void> logOut();
}
