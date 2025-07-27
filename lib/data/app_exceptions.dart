
class AppException implements Exception {
 final _message ;
 final _prefix;
 AppException([this._message, this._prefix]);

 String toString(){
   return '$_prefix$_message';
 }
}

// network on request send , that request timeout then exception show
class FetchDataException extends AppException {
  FetchDataException([String? message]) : super(message, 'Error During Communication');
}

//  base url that not exit on server
class BadRequestException extends AppException {
  BadRequestException([String? message]) : super(message, 'Invalid request');
}

// login or sinup krte hai token aata hai when request send,
//  that token valid that user he want to access the data
class UnauthorisedException extends AppException {
  UnauthorisedException([String? message]) : super(message, 'Unauthorised request');
}

class InvalidInputException extends AppException {
  InvalidInputException([String? message]) : super(message, 'Invalid Input');
}