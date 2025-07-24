import 'package:mini_task/models/item_model.dart';

class ItemState {
  final List<ItemModel> items;
  final List<ItemModel> filteredItems;
  final bool isLoading;
  final String? error;

  ItemState({
    required this.items,
    required this.filteredItems,
    this.isLoading = false,
    this.error,
  });

  ItemState copyWith({
    List<ItemModel>? items,
    List<ItemModel>? filteredItems,
    bool? isLoading,
    String? error,
  }) {
    return ItemState(
      items: items ?? this.items,
      filteredItems: filteredItems ?? this.filteredItems,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}