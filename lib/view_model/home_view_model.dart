import 'package:flutter/cupertino.dart';
import 'package:p11_mvvm_solid_principle_api_provider/data/model/movies_model.dart';
import 'package:p11_mvvm_solid_principle_api_provider/data/response/api_response.dart';
import 'package:p11_mvvm_solid_principle_api_provider/repository/home_repository.dart';

class HomeViewModel with ChangeNotifier {
   final _myRepo = HomeRepository();

   // getter method
   ApiResponse<MoiveListModel> moviesList = ApiResponse.loading();

   // setter method
   setMoviesList(ApiResponse<MoiveListModel> response){
     moviesList = response;
     notifyListeners();
   }

   Future<void> fetchMoviesListApi() async {
     setMoviesList(ApiResponse.loading());

     _myRepo.fetchMoviesList().then((value){

       setMoviesList(ApiResponse.completed(value));

     }).onError((error, stackTrace){

       setMoviesList(ApiResponse.error(error.toString()));

     });
   }
}