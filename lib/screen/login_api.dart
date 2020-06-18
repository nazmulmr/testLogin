import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutterapplogintest/models/login.dart';
import 'package:flutterapplogintest/screen/user.dart';
import 'package:flutterapplogintest/widgets/gradient_widgets.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';




Future<Login> requestLoginAPI(BuildContext context, String login, String password) async {
  final url = "http://103.234.27.188:8088/money/api.php?apicall=login";

  Map<String, String> body = {
    'login': login,
    'password': password,
  };

  final response = await http.post(
    url,
    body: body,
  );

  if (response.statusCode == 200) {
    final responseJson = json.decode(response.body);
    var token = new AuthResponse.fromJson(responseJson);

    saveCurrentLogin(responseJson);
    Navigator.of(context).pushReplacementNamed('/About');




    return Login.fromJson(responseJson);
  } else {
    final responseJson = json.decode(response.body);

    saveCurrentLogin(responseJson);
   // showDialogSingleButton(context: "خطأ", "تأكد من معلومات الدخول", "موافق");
    showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text("Alert Dialog"),
            content: Text("Dialog Content"),
          );
        }
    );

    return null;
  }
}