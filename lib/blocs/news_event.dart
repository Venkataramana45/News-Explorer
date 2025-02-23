import 'package:equatable/equatable.dart';

abstract class NewsEvent extends Equatable {
  const NewsEvent();

  @override
  List<Object> get props => [];
}

class FetchTopHeadlines extends NewsEvent {}

class FetchCategoryNews extends NewsEvent {
  final String category;

  const FetchCategoryNews(this.category);

  @override
  List<Object> get props => [category];
}
