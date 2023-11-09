import 'package:dio/dio.dart';
import 'package:news_application/utils/constants.dart';

class NewsRepo{
 final Dio _dio= Dio(
  BaseOptions(
   baseUrl: baseUrl,
  )
 );
  Future<Response> fetchNews()async{
   final res=  await _dio.get('everything?q=tesla&from=2023-10-09&sortBy=publishedAt&apiKey=$apiKey');
   return res;
  }
}