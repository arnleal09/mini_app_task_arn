# Mini Task App

A simple Flutter app to manage a list of items, demonstrating state management with BLoC (Cubit), filtering, and favorites.

## Features

- List items with title, tag, and creation time
- Mark/unmark items as favorite
- Search/filter items by text
- State management using `flutter_bloc`
- Simple and clean UI

## Structure

- `lib/main.dart` — App entry point and root widget
- `lib/models/item_model.dart` — Item data model
- `lib/blocs/item_cubit.dart` — BLoC Cubit for item state management
- `lib/blocs/item_state.dart` — State class for items
- `lib/repository/item_repository.dart` — Repository for fetching/managing items
- `lib/screens/item_list_screen.dart` — Main screen displaying the item list

## Getting Started

1. **Clone the repository:**
   ```sh
   git clone <your-repo-url>
   cd mini_task_app
   ```

2. **Install dependencies:**
   ```sh
   flutter pub get
   ```

3. **Run the app:**
   ```sh
   flutter run
   ```

## Dependencies

- [flutter_bloc](https://pub.dev/packages/flutter_bloc)

## Screenshots

_Add screenshots here if available._

## License

MIT License. See [LICENSE](LICENSE) for details.