import 'package:mini_task/models/item_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ItemRepository {
  Future<List<ItemModel>> fetchItems() async {
    await Future.delayed(Duration(seconds: 1));
    final prefs = await SharedPreferences.getInstance();
    final saved = prefs.getStringList('favorites') ?? [];

    List<Map<String, dynamic>> mockData = [
      {
        'id': '1',
        'title': 'Item 1',
        'createdAt': DateTime.now().toIso8601String(),
        'tag': 'new',
      },
      {
        'id': '2',
        'title': 'Item 2',
        'createdAt': DateTime.now()
            .subtract(const Duration(days: 50))
            .toIso8601String(),
        'tag': 'old',
      },
      {
        'id': '3',
        'title': 'Item 3',
        'createdAt': DateTime.now().toIso8601String(),
        'tag': 'hot',
      },
      {
        'id': '1',
        'title': 'Item 4',
        'createdAt': DateTime.now().toIso8601String(),
        'tag': 'hot',
      },
    ];

    return mockData.map((json) {
      final item = ItemModel.fromJson(json);
      item.isFavorite = saved.contains(item.id);
      return item;
    }).toList();
  }

  Future<void> saveFavorites(List<ItemModel> items) async {
    final prefs = await SharedPreferences.getInstance();
    final favs = items
        .where((item) => item.isFavorite)
        .map((e) => e.id)
        .toList();
    await prefs.setStringList('favorites', favs);
  }
}
