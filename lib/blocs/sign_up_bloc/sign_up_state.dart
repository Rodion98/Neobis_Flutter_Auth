part of 'sign_up_bloc.dart';

enum SignUpStatus { initial, loading, success, error }

class SignUpState extends Equatable {
  final SignUpStatus status;

  const SignUpState({this.status = SignUpStatus.initial});

  SignUpState copyWith({SignUpStatus? status}) {
    return SignUpState(status: status ?? this.status);
  }

  @override
  List<Object> get props => [status];
}

// final class SignUpInitial extends SignUpState {}

// class SignUpSuccess extends SignUpState {}

// class SignUpFailure extends SignUpState {}

// class SignUpProcess extends SignUpState {}
