import 'package:sampleapp/model/response/protocol_profile_behavior.dart';

import 'info.dart';
import 'item.dart';

class ResponseInitial {
  Info info;
  List<Item> item;
  ProtocolProfileBehavior protocolProfileBehavior;

  ResponseInitial.fromJsonMap(Map<String, dynamic> map)
      : info = Info.fromJsonMap(map["info"]),
        item = List<Item>.from(map["item"].map((it) => Item.fromJsonMap(it))),
        protocolProfileBehavior =
            ProtocolProfileBehavior.fromJsonMap(map["protocolProfileBehavior"]);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['info'] = info == null ? null : info.toJson();
    data['item'] =
        item != null ? this.item.map((v) => v.toJson()).toList() : null;
    data['protocolProfileBehavior'] = protocolProfileBehavior == null
        ? null
        : protocolProfileBehavior.toJson();
    return data;
  }
}
