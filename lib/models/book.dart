class Book {
  final int? id;
  final String name;
  final String author;

  Book({
    required this.id,
    required this.name,
    required this.author,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'author': author,
    };
  }

  @override
  String toString() {
    return 'Book{id: $id, Name: $name, Author: $author}';
  }
}
