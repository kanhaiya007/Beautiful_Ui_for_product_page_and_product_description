
class Request {

  String method;
  List<Object> header;
  String url;

	Request.fromJsonMap(Map<String, dynamic> map): 
		method = map["method"],
		header = map["header"],
		url = map["url"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['method'] = method;
		data['header'] = header;
		data['url'] = url;
		return data;
	}
}
