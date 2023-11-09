import 'package:flutter/material.dart';
import 'package:news_application/models/news_model.dart';
import 'package:news_application/screens/content_screen.dart';

class NewsCard extends StatelessWidget {
  final Article article;
    NewsCard({super.key,required this.article});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.network(article.urlToImage??"",width: 40,height: 40,),
        title: Text(article.title??""),
        subtitle: Text(article.author??""),
        trailing: Icon(Icons.arrow_circle_right_rounded),
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (_) => ContentScreen(article: article,)));
        },
      ),
    );
  }
}

