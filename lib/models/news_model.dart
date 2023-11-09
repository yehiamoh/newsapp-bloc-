// To parse this JSON data, do
//
//     final newsGenralResponse = newsGenralResponseFromJson(jsonString);

import 'dart:convert';

NewsGenralResponse newsGenralResponseFromJson(String str) => NewsGenralResponse.fromJson(json.decode(str));

String newsGenralResponseToJson(NewsGenralResponse data) => json.encode(data.toJson());

class NewsGenralResponse {
  final String status;
  final int totalResults;
  final List<Article> articles;

  NewsGenralResponse({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  factory NewsGenralResponse.fromJson(Map<String, dynamic> json) => NewsGenralResponse(
    status: json["status"],
    totalResults: json["totalResults"],
    articles: List<Article>.from(json["articles"].map((x) => Article.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "totalResults": totalResults,
    "articles": List<dynamic>.from(articles.map((x) => x.toJson())),
  };
}

class Article {
  final Source source;
  final String? author;
  final String title;
  final String description;
  final String url;
  final String? urlToImage;
  final DateTime publishedAt;
  final String content;

  Article({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory Article.fromJson(Map<String, dynamic> json) => Article(
    source: Source.fromJson(json["source"]),
    author: json["author"]??"Anonymus author",
    title: json["title"]??"No title ",
    description: json["description"]??"No description",
    url: json["url"],
    urlToImage: json["urlToImage"]??"https://upload.wikimedia.org/wikipedia/commons/b/b7/TechCrunch_favicon_gradient.png",
    publishedAt: DateTime.parse(json["publishedAt"]??'12-12-2012'),
    content: json["content"],
  );

  Map<String, dynamic> toJson() => {
    "source": source.toJson(),
    "author": author,
    "title": title,
    "description": description,
    "url": url,
    "urlToImage": urlToImage,
    "publishedAt": publishedAt.toIso8601String(),
    "content": content,
  };
}

class Source {
  final String? id;
  final String name;

  Source({
    required this.id,
    required this.name,
  });

  factory Source.fromJson(Map<String, dynamic> json) => Source(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
