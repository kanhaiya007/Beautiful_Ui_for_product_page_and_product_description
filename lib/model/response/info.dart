
class Info {

  String _postman_id;
  String name;
  String schema;

	Info.fromJsonMap(Map<String, dynamic> map): 
		_postman_id = map["_postman_id"],
		name = map["name"],
		schema = map["schema"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['_postman_id'] = _postman_id;
		data['name'] = name;
		data['schema'] = schema;
		return data;
	}
}
