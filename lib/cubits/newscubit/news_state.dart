part of 'news_cubit.dart';

@immutable
abstract class NewsState {}

class NewsInitial extends NewsState {}
class NewsSuccess extends NewsState {
  final NewsGenralResponse data;

  NewsSuccess(this.data);
}
class NewsLoading extends NewsState {}
class NewsFailed extends NewsState {}
