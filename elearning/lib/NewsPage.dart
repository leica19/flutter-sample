import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' show jsonDecode;

class NewsArticle {
  final String author;
  final String title;

  NewsArticle({this.author, this.title});

  factory NewsArticle.fromJson(Map<String, dynamic> json) {
    return NewsArticle(
      author: json['author'],
      title: json['title'],
      );
  }
}

class News {
  final String status;
  final int totalResults;
  final List<NewsArticle> articles;

  News({this.status, this.totalResults, this.articles});

  factory News.fromJson(Map<String, dynamic> json) {
    var list = json['articles'] as List;
    List<NewsArticle> articlesList =
        list.map((i) => NewsArticle.fromJson(i)).toList();

    return News(
        status: json['status'],
        totalResults: json['totalResults'],
        // articles: json['articles']);
        articles: articlesList);
  }
}

Future<News> fetchNews() async {
  var url =
      'https://newsapi.org/v2/everything?q=bitcoin&from=2019-12-25&sortBy=publishedAt&apiKey=4229c5e42c4440809b2dd4443b0576c5';
  final response = await http.get(url);
  if (response.statusCode != 200) {
    throw Exception('failed to fetch data on http...');
  }
  return News.fromJson(jsonDecode(response.body));
}

class NewsPage extends StatefulWidget {
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  Future<News> news;

  @override
  void initState() {
    super.initState();
    news = fetchNews();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<News>(
      future: news,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text("${snapshot.error}");
        } else if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data.totalResults,
            itemBuilder: (context, index) {
              return Column(
                children: <Widget>[
                  Text(snapshot.data.articles[index].author??'unknown author'),
                  Text(snapshot.data.articles[index].title)
                ],
              );
            },
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
        // return CircularProgressIndicator();
      },
    );
  }
}
