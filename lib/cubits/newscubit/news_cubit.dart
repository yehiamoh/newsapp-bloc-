import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_application/models/news_model.dart';
import 'package:news_application/repository/news_repo.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());
  final newsRepo=NewsRepo();
  void getNews() async{
    try {
      emit(NewsLoading());
      final res= await newsRepo.fetchNews();
      final model= NewsGenralResponse.fromJson(res.data);
      emit(NewsSuccess(model));
    }  catch (e) {
      emit(NewsFailed());
    }
}
}
