
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:p11_mvvm_solid_principle_api_provider/utils/routes/routes_name.dart';
import 'package:p11_mvvm_solid_principle_api_provider/view/home_screen.dart';
import 'package:p11_mvvm_solid_principle_api_provider/view/signup_view.dart';
import 'package:p11_mvvm_solid_principle_api_provider/view/splash_view.dart';

import '../../view/login_view.dart';

class Routes {
  static Route<dynamic>  generateRoutes(RouteSettings settings){
    // final argume = settings.arguments;
    switch(settings.name){
    //   splsh view
      case RoutesName.splash:
        return MaterialPageRoute(builder: (context) => SplashView());
    // login
      case RoutesName.login:
        return MaterialPageRoute(builder: (context) => const LoginView());
      // signup
      case RoutesName.signUp:
        return MaterialPageRoute(builder: (context) => const SignupView());
      // home
      case RoutesName.home:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      default:
        return MaterialPageRoute(builder: (_){
          return Scaffold(
            body: Center(
              child: Text('No route defined'),
            ),
          );
        });
    }
  }
}