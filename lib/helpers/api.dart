import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:lapak_tech/helpers/user_info.dart';
import 'app_exception.dart';

class Api {
  Future<dynamic> post(dynamic url, dynamic data) async {
    var token = await userInfo().getToken();
    var responseJson;

    try {
      final response = await http.post(Uri.parse(url),
      body: data,
      headers: {HttpHeaders.authorizationHeader: "Bearer $token"});
      responseJson = _returnresponse(response);
    } on SocketException {
      throw FetchDataException("No Internet connection");
    }
    return responseJson;
  }

  Future<dynamic> get(dynamic url) async {
    var token = await userInfo().getToken();
    var responseJson;

    try {
      final response = await http.get(url,
      headers: {HttpHeaders.authorizationHeader: "Bearer $token"});
      responseJson = _returnresponse(response);
    } on SocketException {
      throw FetchDataException("No Internet connection");
    }
    return responseJson;
  }

  dynamic _returnresponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = response.body.toString();
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 422:
        throw UnprocessableException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            "Error occured while Communication with Server with StatusCode : ${response.statusCode}");
    }
  }
}