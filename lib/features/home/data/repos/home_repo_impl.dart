import 'dart:developer';

import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/utils/api_service.dart';
import 'home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;

  HomeRepoImpl(this.apiService);
  @override
  Future<Either<Failure, List<BookModel>>> fetchNewestBooks() async {
    try {
      var data = await apiService.get(
        endPoint:
            "volumes?Filter=free-ebooks&Sorting=newest&q=Computer Science",
      );

      List<BookModel> books = [];
      for (var item in data["items"]) {
        try {
          books.add(BookModel.fromJson(item));
        } catch (e) {
          books.add(BookModel.fromJson(item));
        }
      }

      return right(books);
    } catch (e) {
      if (e is DioException) {
        log("First Request From Newest Books");
        log("${e.response?.statusCode}");
        log("${e.response?.statusMessage}");
        log("${e.response?.data}");
        return left(ServerFailure.fromDioError(e));
      }
      log("Not is Dio Exception From Newest Books");
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() async {
    try {
      var data = await apiService.get(
        endPoint: "volumes?Filter=free-ebooks&q=subject:Programming",
      );

      List<BookModel> books = [];
      for (var item in data["items"]) {
        try {
          books.add(BookModel.fromJson(item));
        } catch (e) {
          books.add(BookModel.fromJson(item));
        }
      }

      return right(books);
    } catch (e) {
      if (e is DioException) {
        log("First Request From Featured Books");
        log("${e.response?.statusCode}");
        log("${e.response?.statusMessage}");
        log("${e.response?.data}");
        return left(ServerFailure.fromDioError(e));
      }
      log("Not is Dio Exception From Featured Books");
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks({
    required String category,
  }) async {
    try {
      var data = await apiService.get(
        endPoint:
            "volumes?Filter=free-ebooks&Sorting=relevance&q=subject:$category",
      );

      List<BookModel> books = [];
      for (var item in data["items"]) {
        try {
          books.add(BookModel.fromJson(item));
        } catch (e) {
          books.add(BookModel.fromJson(item));
        }
      }

      return right(books);
    } catch (e) {
      if (e is DioException) {
        log("First Request From Featured Books");
        log("${e.response?.statusCode}");
        log("${e.response?.statusMessage}");
        log("${e.response?.data}");
        return left(ServerFailure.fromDioError(e));
      }
      log("Not is Dio Exception From Featured Books");
      return left(ServerFailure(e.toString()));
    }
  }
}
