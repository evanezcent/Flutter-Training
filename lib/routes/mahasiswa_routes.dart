import 'dart:convert';
import 'package:http/http.dart' as http;

class Mahasiswa {

  Future<List> getData() async {
    // 10.0.2.2 = default localhost for android emulator
    final response = await http.get('http://10.0.2.2:8000/data');
    return json.decode(response.body);
  }
  
}