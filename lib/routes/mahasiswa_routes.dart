
import 'package:dio/dio.dart';

class Mahasiswa {

  Future<List> getData() async {
    Dio dio = new Dio();
    // 10.0.2.2 = default localhost for android emulator
    Response<List> response = await dio.get('http://10.0.2.2:7000/myapi/getData');
    List responseBody = response.data;
    // print(response.statusCode);
    return responseBody;
  }
  
}