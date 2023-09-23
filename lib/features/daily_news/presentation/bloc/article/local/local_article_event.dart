import 'package:equatable/equatable.dart';
import 'package:news_app/features/daily_news/domain/entities/article.dart';

abstract class LocalArticlesEvent extends Equatable {
  final ArticleEntity? article;

  const LocalArticlesEvent({this.article});

  @override
  List<Object> get props => [article!];
}

class GetSavedArticlesEvent extends LocalArticlesEvent {
  const GetSavedArticlesEvent();
}

class RemoveArticleEvent extends LocalArticlesEvent {
  const RemoveArticleEvent(ArticleEntity article) : super(article: article);
}

class SaveArticleEvent extends LocalArticlesEvent {
  const SaveArticleEvent(ArticleEntity article) : super(article: article);
}