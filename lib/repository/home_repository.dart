

import '../data/model/movies_model.dart';
import '../data/network/BaseApiServices.dart';
import '../data/network/NetworkApiService.dart';
import '../res/app_url.dart';

class HomeRepository {
  // BaseApiServices class hme NetworkApiServices access dedigi
  BaseApiServices _apiServices = NetworkApiService();

  // 1 login api
  Future<MoiveListModel> fetchMoviesList() async {
    try{
      dynamic response = await _apiServices.getGetApiResponse(AppUrl.moivesListEndPoint);
      print("API Response: $response"); // Debugging
      // json data in moiveListModel in pass
      return response = MoiveListModel.fromJson(response) ;
    }catch(e){
      throw (e);
    }
  }

}