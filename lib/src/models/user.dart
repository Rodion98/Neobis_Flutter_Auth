import 'package:equatable/equatable.dart';
import '../entities/entities.dart';

class MyUser extends Equatable {
  final String password;
  final String email;

  const MyUser({
    required this.password,
    required this.email,
  });

  static const empty = MyUser(
    password: '',
    email: '',
  );

  MyUser copyWith({
    String? password,
    String? email,
    // String? name
  }) {
    return MyUser(
      password: password ?? this.password,
      email: email ?? this.email,
    );
  }

  MyUser.fromJson(Map<String, dynamic> json)
      : password = json['password'],
        email = json['email'];

  Map<String, dynamic> toJson() => {'password': password, 'email': email};

  // MyUserEntity toEntity() {
  //   return MyUserEntity(
  //     userId: userId,
  //     email: email,
  //   );
  // }

  // static MyUser fromEntity(MyUserEntity entity) {
  //   return MyUser(
  //     userId: entity.userId,
  //     email: entity.email,
  //   );
  // }

  @override
  List<Object?> get props => [password, email];
}
