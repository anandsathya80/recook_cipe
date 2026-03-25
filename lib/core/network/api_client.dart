import 'package:http/http.dart' as http;

class ApiClient {
  static const baseUrl = 'https://dummyjson.com';

  static Future<http.Response> get(String endpoint) async {
    return await http.get(Uri.parse("$baseUrl$endpoint"));
  }
}
