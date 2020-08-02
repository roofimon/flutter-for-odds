class NewsModel {
  int index;
  String title;
  String content;
  String image;

  NewsModel({this.index, this.title, this.content, this.image});

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
        index: json['index'],
        title: json['title'],
        content: json['content'],
        image: json['image']);
  }

  @override
  String toString() {
    return "{ index: $index, title: $title, content: $content, image: $image }";
  }
}
