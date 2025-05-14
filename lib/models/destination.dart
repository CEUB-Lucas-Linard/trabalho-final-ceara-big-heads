class Destination {
  final String id;
  final String name;
  final String description;
  final String imagePath;
  final double rating;
  final double estimatedCost;
  final List<String> bestDates;
  final String location;
  final String currency;
  final String language;

  Destination({
    required this.id,
    required this.name,
    required this.description,
    required this.imagePath,
    required this.rating,
    required this.estimatedCost,
    required this.bestDates,
    required this.location,
    required this.currency,
    required this.language,
  });

  // Converte um objeto Destination para um Map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'imagePath': imagePath,
      'rating': rating,
      'estimatedCost': estimatedCost,
      'bestDates': bestDates,
      'location': location,
      'currency': currency,
      'language': language,
    };
  }

  // Cria um objeto Destination a partir de um Map
  factory Destination.fromJson(Map<String, dynamic> json) {
    return Destination(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      imagePath: json['imagePath'],
      rating: json['rating'],
      estimatedCost: json['estimatedCost'],
      bestDates: List<String>.from(json['bestDates']),
      location: json['location'],
      currency: json['currency'],
      language: json['language'],
    );
  }
}

// Lista de destinos de exemplo
final List<Destination> destinations = [
  Destination(
    id: '1',
    name: 'Rio de Janeiro',
    description: 'Cidade maravilhosa com praias deslumbrantes e o famoso Cristo Redentor.',
    imagePath: 'assets/images/rio.jpg',
    rating: 4.8,
    estimatedCost: 2500.0,
    bestDates: ['Dezembro a Março', 'Carnaval (Fevereiro)'],
    location: 'Brasil',
    currency: 'Real (BRL)',
    language: 'Português',
  ),
  Destination(
    id: '2',
    name: 'Paris',
    description: 'Cidade luz com a icônica Torre Eiffel e museus renomados.',
    imagePath: 'assets/images/paris.jpg',
    rating: 4.7,
    estimatedCost: 5000.0,
    bestDates: ['Abril a Junho', 'Setembro a Outubro'],
    location: 'França',
    currency: 'Euro (EUR)',
    language: 'Francês',
  ),
  Destination(
    id: '3',
    name: 'Tóquio',
    description: 'Metrópole vibrante com uma mistura perfeita de tradição e tecnologia.',
    imagePath: 'assets/images/tokyo.jpg',
    rating: 4.9,
    estimatedCost: 6000.0,
    bestDates: ['Março a Maio (Cerejeiras)', 'Setembro a Novembro'],
    location: 'Japão',
    currency: 'Iene (JPY)',
    language: 'Japonês',
  ),
  Destination(
    id: '4',
    name: 'Nova York',
    description: 'A cidade que nunca dorme, com arranha-céus e uma vida cultural rica.',
    imagePath: 'assets/images/newyork.jpg',
    rating: 4.6,
    estimatedCost: 4500.0,
    bestDates: ['Abril a Junho', 'Setembro a Novembro'],
    location: 'Estados Unidos',
    currency: 'Dólar (USD)',
    language: 'Inglês',
  ),
  Destination(
    id: '5',
    name: 'Roma',
    description: 'Cidade eterna com monumentos históricos e comida incrível.',
    imagePath: 'assets/images/rome.jpg',
    rating: 4.7,
    estimatedCost: 4000.0,
    bestDates: ['Abril a Junho', 'Setembro a Outubro'],
    location: 'Itália',
    currency: 'Euro (EUR)',
    language: 'Italiano',
  ),
];
