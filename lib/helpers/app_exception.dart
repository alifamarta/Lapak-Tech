class AppExcetion implements Exception {
  final _message;
  final _prefix;

  AppExcetion([this._message, this._prefix]);

  @override 
  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends AppExcetion {
  FetchDataException([String? message]) : super(message, "Error During Communication: ");
}

class BadRequestException extends AppExcetion {
  BadRequestException([message]) : super(message, "Invalid Request: ");
}

class UnauthorisedException extends AppExcetion {
  UnauthorisedException([message]) : super(message, "Unauthorised: ");
}

class UnprocessableException extends AppExcetion {
  UnprocessableException([message]) : super(message, "Unprocessable Entity: ");
}

class InvalidInputException extends AppExcetion {
  InvalidInputException([String? message]) : super(message, "Invalid Input: ");
}