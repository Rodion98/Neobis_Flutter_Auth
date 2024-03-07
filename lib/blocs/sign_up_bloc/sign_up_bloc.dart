import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../src/models/models.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  // final UserRepository _userRepository;

  SignUpBloc() : super(const SignUpState()) {
    on<SignUp>(_signUp);
    // on<SignUpRequired>((event, emit) async {
    //   emit(SignUpProcess());
    //   try {
    //     MyUser user = await _userRepository.signUp(event.user, event.password);
    //     await _userRepository.setUserData(user);
    //     emit(SignUpSuccess());
    //   } catch (e) {
    //     emit(SignUpFailure());
    //   }
    // });
  }

  void _signUp(SignUp event, Emitter<SignUpState> emit) async {
    emit(state.copyWith(status: SignUpStatus.loading));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      final user = MyUser(password: event.password, email: event.email);
      await prefs.setString(event.email, json.encode(user));
      emit(state.copyWith(status: SignUpStatus.success));
      print(user);
    } catch (e) {
      emit(state.copyWith(status: SignUpStatus.error));
    }
  }
}
