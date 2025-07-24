import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_task/blocs/item_cubit.dart';
import 'package:mini_task/blocs/item_state.dart';

class ItemListScreen extends StatelessWidget {
  const ItemListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ItemCubit>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Items'),
        actions: [
          BlocBuilder<ItemCubit, ItemState>(
            builder: (context, state) {
              final favCount = state.items.where((e) => e.isFavorite).length;
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(child: Text('❤️ $favCount')),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          TextField(
            decoration: InputDecoration(hintText: 'Search...'),
            onChanged: cubit.search,
          ),
          Expanded(
            child: BlocBuilder<ItemCubit, ItemState>(
              builder: (context, state) {
                if (state.isLoading) {
                  return Center(child: CircularProgressIndicator());
                }
                if (state.error != null) {
                  return Center(child: Text(state.error!));
                }

                return ListView.builder(
                  itemCount: state.filteredItems.length,
                  itemBuilder: (_, i) {
                    final item = state.filteredItems[i];
                    final createdAt = DateTime.parse(item.createdAt);
                    final duration = DateTime.now().difference(createdAt);
                    return ListTile(
                      title: Text(item.title),
                      subtitle: Text('${duration.inMinutes} min ago'),
                      leading: Chip(label: Text(item.tag)),
                      trailing: IconButton(
                        icon: Icon(
                          item.isFavorite
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: item.isFavorite ? Colors.red : null,
                        ),
                        onPressed: () {
                          cubit.toggleFavorite(item.id);
                        },
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
