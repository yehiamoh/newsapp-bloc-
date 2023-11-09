import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_application/cubits/newscubit/news_cubit.dart';
import 'package:news_application/screens/home_screen.dart';


void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
  return MultiBlocProvider(
      providers: [
        BlocProvider(
            create:(context) =>NewsCubit()
        ),
      ],
      child:MaterialApp(
      title: 'News app',
       home: HomeScreen(),
    theme: ThemeData(
        useMaterial3: true
    ),
    color: Color(0xff000000),
  )
  );
  }
}
