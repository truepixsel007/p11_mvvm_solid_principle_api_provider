
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:p11_mvvm_solid_principle_api_provider/utils/routes/routes_name.dart';
import 'package:p11_mvvm_solid_principle_api_provider/utils/utils.dart';
import 'package:p11_mvvm_solid_principle_api_provider/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

import '../res/components/round_button.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(true);

  TextEditingController _editingController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _editingController.dispose();
    _passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    _obsecurePassword.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: _editingController,
              keyboardType: TextInputType.emailAddress,
              focusNode: emailFocusNode,
              decoration: InputDecoration(
                hintText: 'Email',
                labelText: 'Email',
                  prefixIcon : Icon(Icons.alternate_email),
              ),
              onFieldSubmitted: (value){
                Utils.fieldFocusChange(context, emailFocusNode, passwordFocusNode);
              },
            ),

            ValueListenableBuilder(
                valueListenable: _obsecurePassword,
                builder:(context, value, child){
                   return  TextFormField(
                     controller: _passwordController,
                     obscureText: _obsecurePassword.value,
                     focusNode: passwordFocusNode,
                     obscuringCharacter: "*",
                     decoration: InputDecoration(
                         hintText: 'Password',
                         labelText: 'Password',
                         prefixIcon: Icon(Icons.lock_open_outlined),
                         suffixIcon: InkWell(
                             onTap: (){
                               _obsecurePassword.value =! _obsecurePassword.value;
                             },
                             child: _obsecurePassword.value ? Icon(Icons.visibility_off_outlined) :
                                     Icon(Icons.visibility)
                         ),
                     )
                   );
                }
            ),

            SizedBox(height: height * .1,),
            RoundButton(
              loading: authViewModel.loading,
              onPress: () {
                if(_editingController.text.isEmpty){
                  Utils.flushBarErrorMessage('Please enter email', context);
                } else if (_passwordController.text.isEmpty){
                  Utils.flushBarErrorMessage('Please enter password', context);
                } else{
                  // Map  data = {
                  //   'email' : _editingController.text.toString(),
                  //    'password' : _passwordController.text.toString()
                  // };

                  Map  data = {
                    'email' : 'eve.holt@reqres.in',
                    'password' : 'cityslicka'
                  };

                  authViewModel.loginApi(data, context);
                  print('api call');
                }
              },
              title: 'Login',),
            SizedBox(height: height * .02,),
            InkWell(
              onTap: (){
                Navigator.pushNamed(context, RoutesName.signUp);
              },
                child: Text("Don't have an account? Sign Up")
            )
          ],
        ),
      ),
    );
  }
}
