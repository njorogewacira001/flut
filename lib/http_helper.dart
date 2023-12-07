import 'dart:convert';
import 'package:http/http.dart' as http;

class HttpHelper {
  Future<String> fetchPassword(String userCode, String timestamp, String rawPassword) async {
    final url = Uri.parse('https://testbed.flex-money.tech/md5Password');
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };
    final body = jsonEncode({
      'userCode': userCode,
      'timestamp': timestamp,
      'rawPassword': rawPassword,
    });

    final response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['password'];
    } else {
      throw Exception('Failed to fetch password');
    }
  }
}
