import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper({required this.url});
  final String url;

  Future getData() async {
    Uri url_ = Uri.parse(url);
    http.Response resp = await http.get(url_);

    if (resp.statusCode == 200) {
      String data = resp.body;
      // decoding the json data coming from API
      return jsonDecode(data);
    } else {
      print(resp.statusCode);
    }
  }
}
