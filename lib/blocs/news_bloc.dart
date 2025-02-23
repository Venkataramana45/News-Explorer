import 'package:bloc/bloc.dart';
import '../services/news_services.dart';
import 'news_event.dart';
import 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsService newsService;

  NewsBloc(this.newsService) : super(NewsInitial()) {
    on<FetchTopHeadlines>(_onFetchTopHeadlines);
    on<FetchCategoryNews>(_onFetchCategoryNews);
  }

  Future<void> _onFetchTopHeadlines(
      FetchTopHeadlines event, Emitter<NewsState> emit) async {
    try {
      emit(NewsLoading());
      final articles = await newsService.fetchTopHeadlines();
      emit(NewsLoaded(articles));
    } catch (e) {
      emit(NewsError(e.toString()));
    }
  }

  Future<void> _onFetchCategoryNews(
      FetchCategoryNews event, Emitter<NewsState> emit) async {
    try {
      emit(NewsLoading());
      final articles = await newsService.fetchCategoryNews(event.category);
      emit(NewsLoaded(articles));
    } catch (e) {
      emit(NewsError(e.toString()));
    }
  }
}
