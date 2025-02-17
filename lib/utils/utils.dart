
import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils{
  // 1 toastMessage
  static toastMessage(String message){
    Fluttertoast.showToast(
        msg: message,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        toastLength: Toast.LENGTH_LONG,
        timeInSecForIosWeb: 1,
    );
  }

  // 2 flushBarErrorMessage
  static void flushBarErrorMessage(String message, BuildContext context){
    // print('flushBar');
    showFlushbar(
        context: context,
        flushbar: Flushbar(
           message: message,
          title: 'Msg',
          backgroundColor: Colors.red,
          flushbarPosition: FlushbarPosition.TOP,
          forwardAnimationCurve: Curves.decelerate,
          reverseAnimationCurve: Curves.easeInOut,
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          positionOffset: 20,
          icon: Icon(Icons.error,size: 20, color: Colors.white,),
          titleColor: Colors.white,
          duration: Duration(seconds: 3),
          messageColor: Colors.black,
        )..show(context),
    );
  }

// 3 snackbar
//   static void snackBar(String message, BuildContext context){
//     return ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text(message))
//     );
//   }

  static void snackBar(String message, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: Text(message),
          backgroundColor: Colors.red,
      ),
    );
  }

//   4 focus node
   static void fieldFocusChange(
       BuildContext context,
       FocusNode current,
       FocusNode nextFocus){
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
   }

//  5 averageRating
   static double averageRating(List<int> rating){
    var avgRating = 0;
    for(int i= 0; i< rating.length; i++){
      avgRating = avgRating + rating[i];
    }
    return double.parse((avgRating/rating.length).toStringAsFixed(1));
   }

}