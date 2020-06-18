import 'package:flutterapplogintest/models/user.dart';
import 'package:flutterapplogintest/screen/user.dart';
import 'package:shared_preferences/shared_preferences.dart';




saveCurrentLogin(Map responseJson) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();


  var token = (responseJson != null && !responseJson.isEmpty) ? AuthResponse.fromJson(responseJson).token : "";

  var id = (responseJson != null && responseJson.isNotEmpty) ? User.fromJson(responseJson).id : 0;
  var name = (responseJson != null && !responseJson.isEmpty) ? User.fromJson(responseJson).name : "";
  var email = (responseJson != null && !responseJson.isEmpty) ? User.fromJson(responseJson).email : "";
  var mobile = (responseJson != null && !responseJson.isEmpty) ? User.fromJson(responseJson).mobile : "";
  var active = (responseJson != null && !responseJson.isEmpty) ? User.fromJson(responseJson).active : 0;
  var confirmation_code = (responseJson != null && !responseJson.isEmpty) ? User.fromJson(responseJson).confirmation_code : "";
  var confirmed = (responseJson != null && !responseJson.isEmpty) ? User.fromJson(responseJson).confirmed : 0;

  await preferences.setString('token', (token != null && token.length > 0) ? token : "");

  await preferences.setInt('id', (id != null && id > 0) ? id : 0);
  await preferences.setString('name', (name != null && name.length > 0) ? name : "");
  await preferences.setString('email', (email != null && email.length > 0) ? email : "");
  await preferences.setString('mobile', (mobile != null && mobile.length > 0) ? mobile : "");
  await preferences.setInt('active', (active != null && active > 0) ? active : 0);
  await preferences.setString('confirmation_code', (confirmation_code != null && confirmation_code.length > 0) ? confirmation_code : "");
  await preferences.setInt('confirmed', (confirmed != null && confirmed > 0) ? confirmed : 0);


}