import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_application/cubits/newscubit/news_cubit.dart';
import 'package:news_application/widgets/news_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<NewsCubit>().getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News app"),
      ),
      body: BlocBuilder<NewsCubit,NewsState>(
        builder: (context,state){
          if(state is NewsLoading){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if(state is NewsFailed){
            return Center(child: Text("Failed in progress!!!!!!!!!"));
          }
          if(state is NewsSuccess){
            final data=state.data;
            return ListView.separated(
                itemBuilder: (context,index){
                  final article=state.data.articles[index];
                  return NewsCard(article: article,);
                },
                separatorBuilder:(context,index){
                  return SizedBox(height: 16,);
                } ,
                itemCount:30
            );
          }
          return SizedBox();
        }
      )
    );
  }
}
