class BookModel {
  final String title;
  final String author;
  final String coverUrl;
  final String workKey;
  final String description;

  BookModel({
    required this.title,
    required this.author,
    required this.coverUrl,
    required this.workKey,
    required this.description,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) {
    final coverId = json['cover_i'];

    return BookModel(
      title: json['title'] ?? '',
      author:
          (json['author_name'] != null &&
              (json['author_name'] as List).isNotEmpty)
          ? json['author_name'][0]
          : 'Unknown',
      coverUrl: coverId != null
          ? "https://covers.openlibrary.org/b/id/$coverId-M.jpg"
          : '',
      workKey: json['key'] ?? '',
      description: '',
    );
  }

  factory BookModel.fromDetailsJson(Map<String, dynamic> json, BookModel base) {
    String description = '';

    final desc = json['description'];

    if (desc is String) {
      description = desc;
    } else if (desc is Map && desc['value'] != null) {
      description = desc['value'];
    }

    return BookModel(
      title: base.title,
      author: base.author,
      coverUrl: base.coverUrl,
      workKey: base.workKey,
      description: description,
    );
  }
}
