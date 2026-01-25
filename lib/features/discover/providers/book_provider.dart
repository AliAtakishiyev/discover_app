import 'dart:async';

import 'package:discover_app/features/core/network/dio_client.dart';
import 'package:discover_app/features/discover/data/models/book_model.dart';
import 'package:discover_app/features/discover/data/repositories/book_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final bookRepositoryProvider = Provider<BookRepository>((ref) {
  return BookRepository(DioClient());
});

final bookProvider = AsyncNotifierProvider<BookNotifier, List<BookModel>>(
  BookNotifier.new,
);

class BookNotifier extends AsyncNotifier<List<BookModel>> {
  late final BookRepository _repository;

  @override
  Future<List<BookModel>> build() async {
    _repository = ref.read(bookRepositoryProvider);
    return [];
  }

  Future<void> searchBooks(String query) async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() => _repository.getBooks(query));
  }
}
