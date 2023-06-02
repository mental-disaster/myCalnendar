class Memo {
  String title = '';
  String detail = '';
  DateTime createdDt = DateTime.now();
  DateTime updatedDt = DateTime.now();

  Memo({
      this.title = '',
      this.detail = '',
      DateTime? createdDt,
      DateTime? updatedDt,})
      : this.createdDt = createdDt ?? DateTime.now()
      , this.updatedDt = updatedDt ?? DateTime.now();

  Memo.fromJson(dynamic json) {
    title = json['title'];
    detail = json['detail'];
    createdDt = json['createdDt'];
    updatedDt = json['updatedDt'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = title;
    map['detail'] = detail;
    map['createdDt'] = createdDt;
    map['updatedDt'] = updatedDt;
    return map;
  }

}