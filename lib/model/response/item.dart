import 'request.dart';

class Item {

  String name;
  String _postman_id;
  Request request;
  List<Object> response;

	Item.fromJsonMap(Map<String, dynamic> map): 
		name = map["name"],
		_postman_id = map["_postman_id"],
		request = Request.fromJsonMap(map["request"]),
		response = map["response"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['name'] = name;
		data['_postman_id'] = _postman_id;
		data['request'] = request == null ? null : request.toJson();
		data['response'] = response;
		return data;
	}
}
