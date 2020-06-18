class Login {
  final String login;
  final String password;


  Login(this.login, this.password);

  Login.fromJson(Map<String, dynamic> json)
      : login = json['login'],
        password = json['password'];


}