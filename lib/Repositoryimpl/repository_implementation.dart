import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;


class RepositoryImplementation{

  //handle success response and exception here
  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return response;
    // you can handel all your exception here
      default:
        debugPrint("Error with Connection");
    }
  }

  Future<http.Response> postApi(String url, dynamic data) async {
    dynamic responseJson;
    final headers = {HttpHeaders.contentTypeHeader: 'application/json'};
    try {
      final response = await http
          .post(Uri.parse(url), body: json.encode(data), headers: headers)
          .timeout(const Duration(seconds: 30));
      return responseJson = returnResponse(response);
    } on SocketException {
      throw SocketException('No Internet Connection');
    } catch (e) {
      log('error$e');
    }
    return responseJson;
  }


}

