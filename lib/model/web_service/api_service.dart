import 'dart:convert';

import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> fetchPost2( ) async {

  var client = new http.Client();
  var  key= "9RSm3KDZhH3Ptdw022L2uBuwjqM6O0JQ";
  var url = "https://api.nytimes.com/svc/topstories/v2/science.json?api-key=$key";

  var response = await client.get(url
    //headers: {'Authorization': token}, body: json.encode(body)
  );
  print(response);
  /*print("token $token");*/

  if (response.statusCode == 200) {
    // If server returns an OK response, parse the JSON
    return json.decode(response.body);
  } else {
    // If that response was not OK, throw an error.
    throw Exception('Failed to load post');
  }
}