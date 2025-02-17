
import 'package:p11_mvvm_solid_principle_api_provider/data/response/staus.dart';

class ApiResponse<T>{
  Status? status;
  T? data;
  String? message;

  ApiResponse(this.status, this.data, this.message);

  // super method use
  ApiResponse.loading() : status = Status.LOADING;

  ApiResponse.completed(this.data) : status = Status.COMPLETED;

  ApiResponse.error(this.message) : status = Status.ERROR;

  @override
  String toString(){
    return "Status : $status \n Message: $message \n Data:  $data";
  }

}