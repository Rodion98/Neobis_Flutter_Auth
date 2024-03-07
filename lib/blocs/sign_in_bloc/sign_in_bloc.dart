import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../src/models/models.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(const SignInState()) {
    on<SignIn>(_signIn);
  }

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

  Future<void> _signIn(SignIn event, Emitter<SignInState> emit) async {
    emit(
      SignInSuccess(),
    );
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      bool tryfindEmail = await findEmail(event.email);
      bool tryfindPassword = await findPassword(event.password, event.email);

      if (tryfindEmail && tryfindPassword) {
        print('success');
        emit(
          SignInSuccess(),
        );
      } else if (tryfindEmail || tryfindPassword) {
        emit(SignInFailure(message: 'check field'));
        // print('check field');
        return;
      }

      // final tryUser = MyUser(password: event.password, email: event.email);
      // final String? myUserString = prefs.getString(tryUser.email);
      // if (myUserString == null) {
      //   return; // No need to return null, just return
      // } else {
      //   MyUser myUser = MyUser.fromJson(
      //     json.decode(myUserString),
      //   );
      //   if (myUser.email == event.email && myUser.password == event.password) {
      //     print(myUser);
      //     emit(
      //       state.copyWith(status: SignInStatus.success),
      //     );
      //   } else {
      //     return;
      //   }
      // }
    } catch (e) {
      emit(
        SignInFailure(),
      );
    }
  }
}

  







//   final UserRepository _userRepository;

//   SignInBloc({required UserRepository userRepository})
//       : _userRepository = userRepository,
//         super(SignInInitial()) {
//     on<SignInRequired>((event, emit) async {
//       emit(SignInProcess());
//       try {
//         await _userRepository.signIn(event.email, event.password);
//         emit(SignInSuccess());
//       } on FirebaseAuthException catch (e) {
//         emit(SignInFailure(message: e.code));
//       } catch (e) {
//         emit(const SignInFailure());
//       }
//     });
//     on<SignOutRequired>((event, emit) async {
//       await _userRepository.logOut();
//     });
//   }
// }
