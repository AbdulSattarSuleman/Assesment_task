import 'dart:convert';

import 'package:hashlob_task/services/utils/app_urls.dart';
import 'package:http/http.dart' as http;

import '../models/product_model.dart';

class APIService {
  Future<ApiModel> getData() async {
    try {
      // var response = await http.get(Uri.parse(
      //     "http://165.227.69.207/rehmat-e-sheree/public/api/products/hashlob/web-data/products/get/all/auth"));
      var response = await http.get(Uri.parse(AppUrl.baseUrl));
      var data = jsonDecode(response.body);
      print(data);
      if (response.statusCode == 200) {
        return ApiModel.fromJson(data);
      } else {
        throw Exception("Failed to load data");
      }
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }
}
