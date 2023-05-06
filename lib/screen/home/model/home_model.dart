// To parse this JSON data, do
//
//     final trainmodel = trainmodelFromJson(jsonString);

import 'dart:convert';

List<Trainmodel> trainmodelFromJson(String str) => List<Trainmodel>.from(json.decode(str).map((x) => Trainmodel.fromJson(x)));

String trainmodelToJson(List<Trainmodel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Trainmodel {
  int? trainNum;
  String? name;
  String? trainFrom;
  String? trainTo;
  Data? data;

  Trainmodel({
    this.trainNum,
    this.name,
    this.trainFrom,
    this.trainTo,
    this.data,
  });

  factory Trainmodel.fromJson(Map<String, dynamic> json) => Trainmodel(
    trainNum: json["train_num"],
    name: json["name"],
    trainFrom: json["train_from"],
    trainTo: json["train_to"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "train_num": trainNum,
    "name": name,
    "train_from": trainFrom,
    "train_to": trainTo,
    "data": data?.toJson(),
  };
}

class Data {
  String? id;
  Days? days;
  String? toId;
  List<Class>? classes;
  String? fromId;
  String? arriveTime;
  String? departTime;

  Data({
    this.id,
    this.days,
    this.toId,
    this.classes,
    this.fromId,
    this.arriveTime,
    this.departTime,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    days: json["days"] == null ? null : Days.fromJson(json["days"]),
    toId: json["to_id"],
    classes: json["classes"] == null ? [] : List<Class>.from(json["classes"]!.map((x) => classValues.map[x]!)),
    fromId: json["from_id"],
    arriveTime: json["arriveTime"],
    departTime: json["departTime"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "days": days?.toJson(),
    "to_id": toId,
    "classes": classes == null ? [] : List<dynamic>.from(classes!.map((x) => classValues.reverse[x])),
    "from_id": fromId,
    "arriveTime": arriveTime,
    "departTime": departTime,
  };
}

enum Class { THE_3_A, THE_2_A, THE_1_A }

final classValues = EnumValues({
  "1A": Class.THE_1_A,
  "2A": Class.THE_2_A,
  "3A": Class.THE_3_A
});

class Days {
  dynamic fri;
  dynamic mon;
  dynamic sat;
  dynamic sun;
  dynamic thu;
  dynamic tue;
  dynamic wed;

  Days({
    this.fri,
    this.mon,
    this.sat,
    this.sun,
    this.thu,
    this.tue,
    this.wed,
  });

  factory Days.fromJson(Map<String, dynamic> json) => Days(
    fri: json["Fri"],
    mon: json["Mon"],
    sat: json["Sat"],
    sun: json["Sun"],
    thu: json["Thu"],
    tue: json["Tue"],
    wed: json["Wed"],
  );

  Map<String, dynamic> toJson() => {
    "Fri": fri,
    "Mon": mon,
    "Sat": sat,
    "Sun": sun,
    "Thu": thu,
    "Tue": tue,
    "Wed": wed,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
