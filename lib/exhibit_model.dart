//Author: Pavlo
//Date: 01/28/2022
//Exhibit model

class Exhibit {
  String title;
  List images;

  Exhibit({required this.title, required this.images});

  Map<String, dynamic> toJoson() {
    return {'title': title, 'images': images};
  }

  factory Exhibit.fromJson(Map<String, dynamic> json) {
    return Exhibit(
      title: json['title'] ?? "",
      images: json['images'],
    );
  }

  static List<Exhibit> fromJsonList(jsonList) {
    return jsonList.map<Exhibit>((obj) => Exhibit.fromJson(obj)).toList();
  }
}
