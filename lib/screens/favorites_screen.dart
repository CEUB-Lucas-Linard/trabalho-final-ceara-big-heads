import 'package:flutter/material.dart';
import '../models/destination.dart';
import '../services/storage_service.dart';
import '../widgets/destination_card.dart';
import 'destination_detail_screen.dart';

class FavoritesScreen extends StatefulWidget {
  final StorageService storageService;

  const FavoritesScreen({Key? key, required this.storageService}) : super(key: key);

  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  late List<Destination> _favorites;

  @override
  void initState() {
    super.initState();
    _loadFavorites();
  }

  void _loadFavorites() {
    setState(() {
      _favorites = widget.storageService.getFavorites();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus Favoritos'),
      ),
      body: _favorites.isEmpty
          ? const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.favorite_border, size: 64, color: Colors.grey),
            SizedBox(height: 16),
            Text(
              'Sem destinos favoritos',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            SizedBox(height: 8),
            Text(
              'Adicione destinos aos favoritos para vê-los aqui',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      )
          : ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: _favorites.length,
        itemBuilder: (context, index) {
          final destination = _favorites[index];
          return DestinationCard(
            destination: destination,
            isFavorite: true,
            onTap: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DestinationDetailScreen(
                    destination: destination,
                    storageService: widget.storageService,
                  ),
                ),
              );
              // Atualiza a lista de favoritos quando retornar da tela de detalhes
              _loadFavorites();
            },
          );
        },
      ),
    );
  }
}