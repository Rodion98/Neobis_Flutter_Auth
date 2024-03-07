part of 'sign_in_bloc.dart';

// enum SignInStatus { initial, loading, success, error }

class SignInState extends Equatable {
  const SignInState();

  @override
  List<Object> get props => [];

  // final SignInStatus status;

  // const SignInState({this.status = SignInStatus.initial});

  // SignInState copyWith({SignInStatus? status}) {
  //   return SignInState(status: status ?? this.status);
  // }

  // @override
  // List<Object> get props => [status];
}

final class SignInInitial extends SignInState {}

class SignInSuccess extends SignInState {}

class SignInFailure extends SignInState {
  final String? message;

  const SignInFailure({this.message});
}

class SignInProcess extends SignInState {}
