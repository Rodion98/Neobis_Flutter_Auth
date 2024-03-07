// import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:romaingirou_firebase_auth/packages/src/user_repo.dart';

import '../../src/models/models.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

// class AuthenticationBloc
//     extends Bloc<AuthenticationEvent, AuthenticationState> {
//   AuthenticationBloc({required this.user})
//       : super(const AuthenticationState.unknown()) {
//     _userSubscription = userRepository.user.listen((user) {
//       add(AuthenticationUserChanged(user));
//     });

//     on<AuthenticationUserChanged>(_authUserChanged);

//     // on<AuthenticationUserChanged>((event, emit) {
//     //   if (event.user != null) {
//     //     emit(AuthenticationState.authenticated(event.user!));
//     //   } else {
//     //     emit(const AuthenticationState.unauthenticated());
//     //   }
//     // });
//   }

//   void _authUserChanged(
//       AuthenticationUserChanged event, Emitter<AuthenticationState> emit) {
//     if (event.user != null) {
//       emit(AuthenticationState.authenticated(event.user!));
//     } else {
//       emit(const AuthenticationState.unauthenticated());
//     }
//   }

//   @override
//   Future<void> close() {
//     _userSubscription.cancel();
//     return super.close();
//   }
// }
