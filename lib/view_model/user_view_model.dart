import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:p11_mvvm_solid_principle_api_provider/data/model/user_model.dart';

class UserViewModel with ChangeNotifier {

  // 1. save user
  Future<bool> saveUser(UserModel user) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('token', user.token.toString());
    return true;
  }

    // 2. get user
    Future<UserModel> getUser() async{
      final SharedPreferences sp = await SharedPreferences.getInstance();
      final String? token = sp.getString("token");
    return UserModel(
      token: token.toString(),
       );
    }

//     3. remove
    Future<bool> remove() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove('token');
    return true;
    }

}


