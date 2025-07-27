import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:p11_mvvm_solid_principle_api_provider/data/model/user_model.dart';
import 'package:p11_mvvm_solid_principle_api_provider/utils/routes/routes_name.dart';
import 'package:p11_mvvm_solid_principle_api_provider/view_model/user_view_model.dart';

class SplashServices {
  // getter method
  Future<UserModel> getUserData() => UserViewModel().getUser();

  void checkAuthentication(BuildContext context) {
    getUserData().then((value) async {
      print(value.token);

      if (value.token == 'null' || value.token == '') {
        await Future.delayed(Duration(seconds: 3));
        Navigator.pushNamed(context, RoutesName.login);
      } else {
        await Future.delayed(Duration(seconds: 3));
        Navigator.pushNamed(context, RoutesName.home);
      }
    }).onError((error, StackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}
