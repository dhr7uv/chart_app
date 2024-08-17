import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

const String api = 'https://api.data.gov.in/resource/0cde42d3-5f49-4d2a-996c-4dfc4b2e2596?api-key=579b464db66ec23bdd000001051605a5b8ce43777dfa97532da13c64&format=json';

class ApiServices {
  Future<List<Map<String, dynamic>>>getRecords() async{
    final response = await http.get(Uri.parse(api));
    if(response.statusCode == 200){
      final List data = jsonDecode(response.body)['records'];
      return data.map(((e) => e as Map<String, dynamic>)).toList();
    }else{
      throw Exception(response.reasonPhrase);
    }
  }
}

final dataProvider = Provider<ApiServices>((ref) => ApiServices(),);