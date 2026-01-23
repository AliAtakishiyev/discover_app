import 'package:dio/dio.dart';
import 'package:discover_app/features/core/network/api_endpoints.dart';
import 'package:discover_app/features/core/network/dio_client.dart';
import 'package:discover_app/features/discover/data/models/book_model.dart';

class BookRepository {
  final Dio _dio;

  BookRepository(DioClient client) : _dio = client.dio;

  Future<List<BookModel>> getBooks(String query) async {
    try {
      final response = await _dio.get(
        ApiEndpoints.baseurl,
        queryParameters: {'title': query, 'limit': 10},
      );

      final List data = response.data['docs'];

      return data.map((json) => BookModel.fromJson(json)).toList();
    } catch (e) {
      throw 'Failed to load books';
    }
  }

  Future getDescription(BookModel book) async {
    try {
      final response = await _dio.get(
        '${ApiEndpoints.work}${book.workKey}.json',
      );

      return BookModel.fromDetailsJson(response.data, book);
    } catch (e) {
      throw Exception('Failed to load description');
    }
  }
}
