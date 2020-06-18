import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gradient_widgets/gradient_widgets.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';
import 'login_api.dart';



class UserLoginPage extends StatefulWidget {
  static const routeName = '/home';
  @override
  State<StatefulWidget> createState() {
    return _UserLoginPage();
  }
}

class _UserLoginPage extends State<UserLoginPage> {
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();



  @override
  void initState() {
    super.initState();
    _saveCurrentRoute('/UserLogin');
  }

  _saveCurrentRoute(String lastRoute) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString('LastScreenRoute', lastRoute);
  }

  void _gloginButton() {
    Navigator.pushReplacementNamed(context, '/Home');
  }

  void _registerButton() {
    Navigator.pushNamed(context, '/UserRegister');
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          if (Navigator.canPop(context)) {
            Navigator.of(context).pushNamedAndRemoveUntil(
                '/Home', (Route<dynamic> route) => false);
          } else {
            Navigator.of(context).pushReplacementNamed('/Home');
          }
        },
        child: Scaffold(
          body: Column(
            children: <Widget>[
              Image.asset('assets/img/LRUI.png'),
              Form(
                child: Container(
                  //padding: EdgeInsets.only(top: 100.0),
                  margin: EdgeInsets.all(35.0),
                  child: Center(
                    child: Center(
                      child: SingleChildScrollView(
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 99.0,
                            ),
                            TextFormField(
                              controller: _mobileController,
                              decoration: InputDecoration(
                                labelText: 'رقم الجوال',
                                hintText: "رقم الجوال يجب أن يكون عشر ارقام",
                              ),
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 11.0),
                            TextFormField(
                              controller: _passwordController,
                              decoration: InputDecoration(
                                labelText: 'الرقم السري',
                              ),
                              obscureText: true,
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 40.0,
                            ),
                            GradientButton(
                              gradient: const LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomCenter,
                                colors: const <Color>[
                                  Color(0xff4caf4e),
                                  Color(0xff71c071),
                                ],
                              ),
                              callback: () {
                                SystemChannels.textInput
                                    .invokeMethod('TextInput.hide');
                                requestLoginAPI(context, _mobileController.text,
                                    _passwordController.text);
                              },
                              textStyle: TextStyle(
                                  color: Colors.white, fontSize: 16.0),
                              shapeRadius: BorderRadius.circular(10.0),
                              child: Text(
                                "دخول",
                              ),
                              increaseHeightBy: 20.0,
                              increaseWidthBy: 140.0,
                            ),
                            SizedBox(
                              height: 35.0,
                            ),
                            FlatButton(
                              child: Text('دخول كضيف'),
                              onPressed: _gloginButton,
                            ),
                            FlatButton(
                              child: Text('تسجيل حساب جديد'),
                              onPressed: _registerButton,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
