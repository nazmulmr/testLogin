import 'package:flutterapplogintest/models/user.dart';

import './User.dart';

class AuthResponse {
  final String token;
  User user;

  AuthResponse({
    this.token,
    this.user,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> parsedJson){
    return AuthResponse(
        token: parsedJson['token'],
        user: User.fromJson(parsedJson['user'])
    );
  }


  Map<String, dynamic> toJson() => {
    'token': token,
    'user':user,
  };
}