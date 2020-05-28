
import 'dart:convert';

class Product {
  int id;
  String name;
  String description;
  String code;
  String price;
  String img;
  int status;

	Product.fromJsonMap(Map<String, dynamic> map): 
		id = map["id"],
		name = map["name"],
		description = map["description"],
		code = map["code"],
		price = map["price"],
		img = map["img"],
		status = map["status"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = id;
		data['name'] = name;
		data['description'] = description;
		data['code'] = code;
		data['price'] = price;
		data['img'] = img;
		data['status'] = status;
		return data;
	}

	List<Product> modelProducts(String str) => List<Product>.from(json.decode(str).map((x) => Product.fromJsonMap(x)));
}
