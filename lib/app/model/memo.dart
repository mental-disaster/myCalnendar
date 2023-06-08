class Memo {
  String? title;
  String? detail;
  DateTime? date;

  Memo({
      this.title,
      this.detail,
      DateTime? date,})
      : date = date ?? DateTime.now();

  Memo.fromJson(json) {
    title = json['title'];
    detail = json['detail'];
    if (json['date'] != null) {
      date = DateTime.parse(json['date']);
    }
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = title;
    map['detail'] = detail;
    map['date'] = date;
    return map;
  }
}