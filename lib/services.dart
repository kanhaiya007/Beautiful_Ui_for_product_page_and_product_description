import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sampleapp/model/productModel/product.dart';
import 'package:sampleapp/model/response/ResponseInitial.dart';

class Services {
  ResponseInitial responseInitial;
  List<Product> data = new List<Product>();

  Future<List<Product>> getApiData() async {
    final res = await http
        .get('https://www.postman.com/collections/e16b64ed51d98f7be09f');
    if (res.statusCode == 200) {
      responseInitial = ResponseInitial.fromJsonMap(json.decode(res.body));
      bool status = await getProductData();
      if (status) {
        return data;
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  Future<bool> getProductData() async {
    final res = await http.get(responseInitial.item[0].request.url);
    if (res.statusCode == 200) {
      final data = jsonDecode(res.body);
      for (var i in data) {
        this.data.add(Product.fromJsonMap(i));
      }
      return true;
    } else {
      return false;
    }
  }
}
