import 'package:dio/dio.dart';

class ApiService {
  final String _baseUrl = 'https://www.googleapis.com/books/v1/';
  final String _key = "AIzaSyCRH3k2b0YhOAJqj92tRh8NTlS3VylCR68";
  final Dio dio;

  ApiService(this.dio);

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await dio.get("$_baseUrl$endPoint&key=$_key");
    return response.data;
  }
}
