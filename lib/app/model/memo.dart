class Memo {
  int? id;
  String? title;
  String? detail;
  DateTime? date;

  Memo({
      this.id,
      this.title,
      this.detail,
      DateTime? date,})
      : date = date ?? DateTime.now();

  Memo.fromJson(json) {
    id = json['id'];
    title = json['title'];
    detail = json['detail'];
    if (json['date'] != null) {
      date = DateTime.parse(json['date']);
    }
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['detail'] = detail;
    map['date'] = date;
    return map;
  }
}