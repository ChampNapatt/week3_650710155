import 'package:flutter/material.dart';

void main() {
  runApp(const AnswerPage3());
}

class AnswerPage3 extends StatelessWidget {
  const AnswerPage3({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const ProductLayout(),
    );
  }
}

class ProductLayout extends StatelessWidget {
  const ProductLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Layout'),
        backgroundColor: Colors.orange,
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Category Header
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16.0),
            color: Colors.grey[200],
            child: const Text(
              'Category: Electronics',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 16),

          // Product Grid Section
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Two products per row
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 3 / 4, // Adjust aspect ratio
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return ProductCard(
                  name: product['name']!,
                  price: product['price']!,
                  imagePath: product['imagePath']!,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String name;
  final String price;
  final String imagePath;

  const ProductCard({
    super.key,
    required this.name,
    required this.price,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            imagePath,
            width: 150,
            height: 150,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => const Icon(
              Icons.broken_image,
              size: 150,
              color: Colors.grey,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          name,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          price,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.green,
          ),
        ),
      ],
    );
  }
}

// Sample product data
final List<Map<String, String>> products = [
  {
    'name': 'Laptop',
    'price': '999 THB',
    'imagePath': 'https://m.media-amazon.com/images/I/510uTHyDqGL._AC_UF1000,1000_QL80_.jpg',
  },
  {
    'name': 'Smartphone',
    'price': '699 THB',
    'imagePath': 'https://mediam.dotlife.store/media/catalog/product/cache/3b7e899159f673788675d87d1d929a98/p/o/power_support_air_jacket_mag_hybrid_for_iphone_16_pro_max_-_clear.003.jpeg',
  },
  {
    'name': 'Tablet',
    'price': '499 THB',
    'imagePath': 'https://cdn.thewirecutter.com/wp-content/media/2024/06/besttablets-2048px-9875.jpg',
  },
  {
    'name': 'Camera',
    'price': '299 THB',
    'imagePath': 'https://www.dpreview.com/files/p/articles/6269402639/canon_eosr8.jpeg',
  },
];