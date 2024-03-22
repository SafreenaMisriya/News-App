class NewsModel {
  Source source;
  String? author;
  String title;
  String description;
  String url;
  String urlToImage;
  DateTime publishedAt;
  String? content;

  NewsModel({
    required this.source,
    this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    this.content,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      source: Source.fromJson(json['source']),
      author: json['author'] ?? "",
      title: json['title'] ?? "What Ajit Agarkar-led BCCI selectors will be looking for in IPL 2024 for India's T20 World Cup selection",
      description: json['description'] ?? "",
      url: json['url'] ?? "https://www.hindustantimes.com/ht-img/img/2024/03/21/550x309/GJNWARZWQAES2bf_1711048078975_1711048087122.jpg",
      urlToImage: json['urlToImage'] ?? "https://www.hindustantimes.com/ht-img/img/2024/03/21/550x309/GJNWARZWQAES2bf_1711048078975_1711048087122.jpg",
      publishedAt: DateTime.parse(json['publishedAt']),
      content: json['content'] ?? "",
    );
  }
}

class Source {
  String? id;
  String name;

  Source({
    this.id,
    required this.name,
  });

  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(
      id: json['id'],
      name: json['name'],
    );
  }
}
