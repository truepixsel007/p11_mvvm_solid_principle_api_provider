

import 'package:p11_mvvm_solid_principle_api_provider/data/network/BaseApiServices.dart';
import 'package:p11_mvvm_solid_principle_api_provider/data/network/NetworkApiService.dart';

import '../res/app_url.dart';

class AuthReposotiry {

  // BaseApiServices class hme NetworkApiServices access dedigi
  BaseApiServices _apiServices = NetworkApiService();

  // 1 login api
  Future<dynamic> loginApi(dynamic data) async {
    try{
      dynamic response = await _apiServices.getPostApiResponse(AppUrl.loginEndPoint, data);
      print("API Response: $response"); // Debugging
      // return response;\
      if (response != null) {
        print("Login API Response: $response");
        return response;
      } else {
        throw Exception("Received null response from API");
      }
    }catch(e){
      throw (e);
    }
  }

  // 2 register api ya signup
  Future<dynamic> signUpApi(dynamic data) async {
    try{
      dynamic response = await _apiServices.getPostApiResponse(AppUrl.registerApiEndPoint, data);
      return response;
    }catch(e){
      throw (e);
    }
  }

}