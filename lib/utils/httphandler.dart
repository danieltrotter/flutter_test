import 'dart:convert';

import 'package:flutter_ptb/models/data_model.dart';
import 'package:http/http.dart' as http;

class HttpHandler {
  Uri url =
      Uri.parse("https://on-air-campaigns.firebaseio.com/ptb-challenge.json");
  Future<DataModel> getData() async {
    var response = await http.get(url);
    DataModel decodedResp = DataModel.fromJson(jsonDecode(response.body));
    return decodedResp;
  }
}
