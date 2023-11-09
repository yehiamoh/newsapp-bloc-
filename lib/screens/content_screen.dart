
import 'package:flutter/material.dart';
import 'package:news_application/models/news_model.dart';
class ContentScreen extends StatelessWidget {
  final Article article;
  const ContentScreen({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: false,
            floating: false,
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(article.urlToImage??"",fit:BoxFit.cover,),

            ),

          ),
          SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: 1,
                  (context,index){
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(32.0),
                        child: Column(
                          children: [
                            Text(article.title,style:TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.w600,

                            ),),
                            SizedBox(height: 20,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(article.author??""),
                              ],
                            ),
                            SizedBox(height: 20,),
                            Text(article.content,style:TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w400,

                            ),)
                          ],
                        ),
                      ),
                    );
                  }
              ),
          )

        ],
      ),

    );
  }
}
