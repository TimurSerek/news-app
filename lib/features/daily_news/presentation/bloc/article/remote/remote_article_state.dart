import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:news_app/features/daily_news/domain/entities/article.dart';

abstract class RemoteArticleState extends Equatable {
    final List<ArticleEntity>? articles;
    final DioException? error;

  const RemoteArticleState({this.articles, this.error});

    @override
    List<Object> get props => [articles!, error!];
}

class RemoteArticlesLoadingState extends RemoteArticleState{
  const RemoteArticlesLoadingState();
}

class RemoteArticlesDoneState extends RemoteArticleState{
  const RemoteArticlesDoneState(List<ArticleEntity> articles) : super(articles: articles);
}

class RemoteArticlesErrorState extends RemoteArticleState{
  const RemoteArticlesErrorState(DioException error) : super(error: error);
}