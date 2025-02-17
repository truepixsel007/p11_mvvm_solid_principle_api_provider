

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:p11_mvvm_solid_principle_api_provider/data/model/user_model.dart';
import 'package:p11_mvvm_solid_principle_api_provider/repository/auth_repository.dart';
import 'package:p11_mvvm_solid_principle_api_provider/utils/routes/routes_name.dart';
import 'package:p11_mvvm_solid_principle_api_provider/utils/utils.dart';
import 'package:p11_mvvm_solid_principle_api_provider/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class AuthViewModel with ChangeNotifier{
  final _myRepo = AuthReposotiry();
  // _loading is a private variable (since it starts with _).
  // loading is a getter method that allows other parts of the code to access _loading without directly referencing it.
  // Instead of writing someInstance.loading(), you can simply use someInstance.loading.
  bool _loading = false; // Private variable
  bool get loading => _loading; // Getter method

  bool _signUpLoading = false;
  bool get signUpLoading => _signUpLoading;

  setLoading(bool value){
    _loading = value;
    notifyListeners();
  }

  setSignUpLoading(bool value){
    _signUpLoading = value;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data, BuildContext context) async {
        setLoading(true);
       _myRepo.loginApi(data).then((value){
         setLoading(false);
         // code saveUser
         final userPrefernce = Provider.of<UserViewModel>(context, listen: false);
         userPrefernce.saveUser(
           UserModel(
             token: value['token'].toString()
           )
         );
         Utils.flushBarErrorMessage('Login Successfully', context);
         Navigator.pushNamed(context, RoutesName.home);
         
         print(value.toString());
         if(kDebugMode){
           print(value.toString());
         }
       }).onError((error, stackTrace){
         setLoading(false);
         print(error.toString());
         if(kDebugMode){
           print(error.toString());
           Utils.flushBarErrorMessage(error.toString(), context);
         }
       });
  }


  Future<void> signUpApi(dynamic data, BuildContext context) async {
    setSignUpLoading(true);
    _myRepo.signUpApi(data).then((value){
      setSignUpLoading(false);
      Utils.flushBarErrorMessage('SignUp Successfully', context);
      Navigator.pushNamed(context, RoutesName.home);

      print(value.toString());
      if(kDebugMode){
        print(value.toString());
      }
    }).onError((error, stackTrace){
      setSignUpLoading(false);
      print(error.toString());
      if(kDebugMode){
        print(error.toString());
        Utils.flushBarErrorMessage(error.toString(), context);
      }
    });
  }

}
// eve.holt@reqres.in
// cityslicka

//pistol