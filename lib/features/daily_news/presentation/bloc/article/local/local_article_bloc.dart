import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:news_app/features/daily_news/domain/usecases/get_saved_article.dart';
import 'package:news_app/features/daily_news/domain/usecases/remove_article.dart';
import 'package:news_app/features/daily_news/domain/usecases/save_article.dart';

import 'local_article_event.dart';
import 'local_article_state.dart';

class LocalArticleBloc extends Bloc<LocalArticlesEvent, LocalArticlesState> {
  final GetSavedArticleUseCase _getSavedArticleUseCase;
  final RemoveArticleUseCase _removeArticleUseCase;
  final SaveArticleUseCase _saveArticleUseCase;

  LocalArticleBloc(
    this._getSavedArticleUseCase,
    this._removeArticleUseCase,
    this._saveArticleUseCase,
  ) : super(const LocalArticlesLoadingState()) {
    on<GetSavedArticlesEvent>(onGetSavedArticles);
    on<RemoveArticleEvent>(onRemoveArticle);
    on<SaveArticleEvent>(onSaveArticle);
  }

  void onGetSavedArticles(
      GetSavedArticlesEvent event, Emitter<LocalArticlesState> emit) async {
    final articles = await _getSavedArticleUseCase();
    emit(LocalArticlesDoneState(articles));
  }

  void onRemoveArticle(
      RemoveArticleEvent event, Emitter<LocalArticlesState> emit) async {
    await _removeArticleUseCase(params: event.article);
    final articles = await _getSavedArticleUseCase();
    emit(LocalArticlesDoneState(articles));
  }

  void onSaveArticle(SaveArticleEvent event, Emitter<LocalArticlesState> emit) async {
    await _saveArticleUseCase(params: event.article);
  }
}
