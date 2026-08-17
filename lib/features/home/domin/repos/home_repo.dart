import 'package:bookly_app/features/home/domin/entities/book_entity.dart';

abstract class HomeRepo {
  Future<List<BookEntity>> fetchFeaturedBooks();

  Future<List<BookEntity>> fetchNewestBooks();
}
