
import 'dart:convert';

import 'package:http/http.dart' as http;

class PostServices {
  String baseUrl = "https://jsonplaceholder.typicode.com/posts";
  Future<List> getPost() async {
    try {
      var response = await http.get(Uri.parse(baseUrl));
      print('this is respons body ${response.body}');

      if (response == 200) {
        return jsonDecode(response.body);
      } else {
        return jsonDecode(response.body);
      }
    } catch (SocketException) {
      return Future.error("Error Fetching");
    }
  }
}