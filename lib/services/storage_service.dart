import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/destination.dart';

class StorageService {
  final SharedPreferences _prefs;
  final String _favoriteKey = 'favorite_destinations';

  StorageService(this._prefs);

  // Salva um destino como favorito
  Future<bool> addFavorite(Destination destination) async {
    final favorites = getFavorites();

    // Verifica se o destino já está nos favoritos
    if (favorites.any((element) => element.id == destination.id)) {
      return true; // Destino já é favorito
    }

    favorites.add(destination);
    final List<String> encodedList = favorites.map((item) => jsonEncode(item.toJson())).toList();
    return await _prefs.setStringList(_favoriteKey, encodedList);
  }

  // Remove um destino dos favoritos
  Future<bool> removeFavorite(String destinationId) async {
    final favorites = getFavorites();
    favorites.removeWhere((element) => element.id == destinationId);
    final List<String> encodedList = favorites.map((item) => jsonEncode(item.toJson())).toList();
    return await _prefs.setStringList(_favoriteKey, encodedList);
  }

  // Verifica se um destino é favorito
  bool isFavorite(String destinationId) {
    final favorites = getFavorites();
    return favorites.any((element) => element.id == destinationId);
  }

  // Obtém todos os destinos favoritos
  List<Destination> getFavorites() {
    final List<String>? items = _prefs.getStringList(_favoriteKey);
    if (items == null) {
      return [];
    }
    return items.map((item) => Destination.fromJson(jsonDecode(item))).toList();
  }
}
