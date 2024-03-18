import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:news_app/model/news_model.dart';
import 'package:news_app/repositories/news_repository.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final Newsrepository newsRepository;

  NewsBloc({required this.newsRepository}) : super(Newsloadingstate()) {
    on<StartEvent>(
      (event, emit) async {
        emit(Newsloadingstate());

        try {
          final List<NewsModel> listNews = await newsRepository.fetchNews();

          emit(Newsloadedstate(newsmodel: listNews));
        } catch (e) {
          emit(NewsErrorstate(errormessage: e.toString()));
        }
      },
    );
  }
}
