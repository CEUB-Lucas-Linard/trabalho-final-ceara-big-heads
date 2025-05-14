import 'package:flutter/material.dart';
import '../models/destination.dart';
import '../services/storage_service.dart';
import '../widgets/destination_card.dart';
import 'destination_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  final StorageService storageService;

  const HomeScreen({Key? key, required this.storageService}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Descubra Destinos'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Destinos Populares',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: destinations.length,
              itemBuilder: (context, index) {
                final destination = destinations[index];
                return DestinationCard(
                  destination: destination,
                  isFavorite: storageService.isFavorite(destination.id),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DestinationDetailScreen(
                          destination: destination,
                          storageService: storageService,
                        ),
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
