class QuotesModel {
  String? text;
  String? author;

  QuotesModel({this.text, this.author});

  QuotesModel.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    author = json['author'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['text'] = text;
    data['author'] = author;
    return data;
  }
}