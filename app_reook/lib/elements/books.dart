class Bookss {
  String? id;
  String name;
  String category;
  String page;

  Bookss({
    this.id,
    required this.name,
    required this.category,
    required this.page,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'category': category,
      'page': page,
    };
  }

  factory Bookss.fromMap(Map<String, dynamic> map) {
    return Bookss(
      id: map['id'],
      name: map['name'],
      category: map['category'],
      page: map['page'],
    );
  }
}
