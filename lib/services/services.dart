import 'dart:async';
import 'dart:convert';
import 'package:amaizi_test/models/UserModel.dart';
import 'package:amaizi_test/utils/constants.dart';
import 'package:http/http.dart' as http;

class Service{

Future <List<UserModel>> fetchData() async {
  final response =
      await http.get(Uri.parse(URLCONST.API_URL));
  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((user) => new UserModel.fromJson(user)).take(5).toList(); 
     //returns a list of 5 users
    
  } else {
    throw Exception('Unexpected error occured!');
  }
}
  
}

