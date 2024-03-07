import 'dart:convert';
import 'dart:developer';

import '../../src/models/models.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'user_repo.dart';

abstract class SharedPrefUserRepo implements UserRepository {
  // final FirebaseAuth _firebaseAuth;
  // final usersCollection = FirebaseFirestore.instance.collection('users');

  late MyUser _currentUser;

  SharedPrefUserRepo(
      {
      // FirebaseAuth? firebaseAuth,
      MyUser? currentUser})
      : _currentUser =
            currentUser ?? MyUser(password: 'HJKHJK', email: 'HJKHJK');

  // @override
  // Stream<User?> get user {
  //   return _firebaseAuth.authStateChanges().map((firebaseUser) {
  //     return firebaseUser;
  //   });
  // }

  Future<bool> findEmail(String email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    late String? tryFind = prefs.getString(email);
    if (tryFind != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> findPassword(String password, String email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? tryFind = prefs.getString(email);
    MyUser myUser = MyUser.fromJson(
      json.decode(tryFind!),
    );
    if (password == myUser.password) {
      print(myUser);
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<void> _signIn(String password, String email) async {
    await findEmail(email);
    await findPassword(password, email);

    try {
      bool tryfindEmail = await findEmail(email);
      bool tryfindPassword = await findPassword(password, email);

      if (tryfindEmail && tryfindPassword) {
        _currentUser = MyUser(password: password, email: email);
      } else if (tryfindEmail || tryfindPassword) {
        print('check field');
        return;
      }
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  MyUser get user {
    return _currentUser;
  }
}

    // emit(
    //   SignInSuccess(),
    // );
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // try {
    //   bool tryfindEmail = await findEmail(event.email);
    //   bool tryfindPassword = await findPassword(event.password, event.email);

    //   if (tryfindEmail && tryfindPassword) {
    //     print('success');
    //     emit(
    //       SignInSuccess(),
    //     );
    //   } else if (tryfindEmail || tryfindPassword) {
    //     emit(SignInFailure(message: 'check field'));
    //     // print('check field');
    //     return;
    //   }
    // } catch (e) {
    //   emit(
    //     SignInFailure(),
    //   );
    // }
  

  // @override
  // Future<MyUser> signUp(MyUser myUser, String password) async {
  //   try {
  //     UserCredential user = await _firebaseAuth.createUserWithEmailAndPassword(
  //         email: myUser.email, password: password);

  //     myUser = myUser.copyWith(userId: user.user!.uid);

  //     return myUser;
  //   } catch (e) {
  //     log(e.toString());
  //     rethrow;
  //   }
  // }

  // @override
  // Future<void> setUserData(MyUser myUser) async {
  //   try {
  //     await usersCollection
  //         .doc(myUser.userId)
  //         .set(myUser.toEntity().toDocument());
  //   } catch (e) {
  //     log(e.toString());
  //     rethrow;
  //   }
  // }

  // @override
  // Future<void> logOut() async {
  //   await _firebaseAuth.signOut();
  // }

