import 'package:flutter/material.dart';
import '../models/destination.dart';
import '../services/storage_service.dart';

class DestinationDetailScreen extends StatefulWidget {
  final Destination destination;
  final StorageService storageService;

  const DestinationDetailScreen({
    Key? key,
    required this.destination,
    required this.storageService,
  }) : super(key: key);

  @override
  _DestinationDetailScreenState createState() => _DestinationDetailScreenState();
}

class _DestinationDetailScreenState extends State<DestinationDetailScreen> {
  late bool _isFavorite;

  @override
  void initState() {
    super.initState();
    _isFavorite = widget.storageService.isFavorite(widget.destination.id);
  }

  void _toggleFavorite() async {
    if (_isFavorite) {
      await widget.storageService.removeFavorite(widget.destination.id);
    } else {
      await widget.storageService.addFavorite(widget.destination);
    }
    setState(() {
      _isFavorite = !_isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(widget.destination.name),
              background: Image.asset(
                widget.destination.imagePath,
                fit: BoxFit.cover,
              ),
            ),
            actions: [
              IconButton(
                icon: Icon(
                  _isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: _isFavorite ? Colors.red : Colors.white,
                ),
                onPressed: _toggleFavorite,
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.location_on, color: Colors.red),
                          const SizedBox(width: 4),
                          Text(widget.destination.location),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Icons.star, color: Colors.amber),
                          const SizedBox(width: 4),
                          Text('${widget.destination.rating}'),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Sobre o destino',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(widget.destination.description),
                  const SizedBox(height: 16),
                  const Text(
                    'Informações do destino',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  _buildInfoItem(Icons.attach_money, 'Custo estimado',
                      'R\$ ${widget.destination.estimatedCost.toStringAsFixed(2)}'),
                  _buildInfoItem(Icons.calendar_today, 'Melhores épocas',
                      widget.destination.bestDates.join(', ')),
                  _buildInfoItem(
                      Icons.language, 'Idioma', widget.destination.language),
                  _buildInfoItem(
                      Icons.monetization_on, 'Moeda', widget.destination.currency),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoItem(IconData icon, String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 20),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(value),
            ],
          ),
        ],
      ),
    );
  }
}
