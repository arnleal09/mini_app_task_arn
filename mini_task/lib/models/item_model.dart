class ItemModel {
  final String id;
  final String title;
  final String createdAt;
  final String tag;
  bool isFavorite;

  ItemModel({
    required this.id,
    required this.title,
    required this.createdAt,
    required this.tag,
    this.isFavorite = false,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(
      id: json['id'] as String,
      title: json['title'] as String,
      createdAt: json['createdAt'] as String,
      tag: json['tag'] as String,
      isFavorite: json['isFavorite'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'createdAt': createdAt,
      'tag': tag,
      'isFavorite': isFavorite,
    };
  }
}