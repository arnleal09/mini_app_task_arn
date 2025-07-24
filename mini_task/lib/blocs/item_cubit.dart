import 'package:mini_task/blocs/item_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_task/repository/item_repository.dart';

class ItemCubit extends Cubit<ItemState> {
  final ItemRepository repository;

  ItemCubit(this.repository)
      : super(ItemState(items: [], filteredItems: [], isLoading: true)) {
    loadItems();
  }

  Future<void> loadItems() async {
    emit(state.copyWith(isLoading: true));
    try {
      final items = await repository.fetchItems();
      emit(ItemState(items: items, filteredItems: items, isLoading: false));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: 'Failed to load items'));
    }
  }

  void toggleFavorite(String itemId) {
    final updatedItems = state.items.map((item) {
      if (item.id == itemId) {
        item.isFavorite = !item.isFavorite;
      }
      return item;
    }).toList();

    repository.saveFavorites(updatedItems);

    emit(state.copyWith(
      items: updatedItems,
      filteredItems: updatedItems,
    ));
  }

  void search(String query) {
    final filtered = state.items
        .where((item) =>
            item.title.toLowerCase().contains(query.toLowerCase()))
        .toList();

    emit(state.copyWith(filteredItems: filtered));
  }
}
