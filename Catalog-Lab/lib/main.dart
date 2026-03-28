import 'package:flutter/material.dart';

void main() {
  runApp(const CatalogApp());
}

class Product {
  final String name;
  final String price;
  final String imageUrl;
  final Color color;

  Product({
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.color,
  });
}

class CatalogApp extends StatelessWidget {
  const CatalogApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Product Catalog',
      // PrimarySwatch is a MaterialColor, using orange for the theme
      theme: ThemeData(primarySwatch: Colors.orange, useMaterial3: false),
      home: const CatalogScreen(),
    );
  }
}

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({super.key});

  // Correctly defined the list as a final property of the class
  final List<Product> products = const [
    // Note: I added 'const' to the Product objects for better performance
  ];

  @override
  Widget build(BuildContext context) {
    // Re-defining the list here or ensuring it's accessible
    final List<Product> products = [
      Product(name: 'Coffee Mug', price: '\$12.99', imageUrl: 'https://picsum.photos/id/1/200/200', color: Colors.brown),
      Product(name: 'Notebook', price: '\$5.99', imageUrl: 'https://picsum.photos/id/2/200/200', color: Colors.blue),
      Product(name: 'Pen Set', price: '\$8.49', imageUrl: 'https://picsum.photos/id/3/200/200', color: Colors.green),
      Product(name: 'Backpack', price: '\$49.99', imageUrl: 'https://picsum.photos/id/4/200/200', color: Colors.red),
      Product(name: 'Headphones', price: '\$89.99', imageUrl: 'https://picsum.photos/id/5/200/200', color: Colors.grey),
      Product(name: 'Smart Watch', price: '\$199.99', imageUrl: 'https://picsum.photos/id/6/200/200', color: Colors.black),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Catalog'),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: products.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.75,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemBuilder: (context, index) {
            final product = products[index];
            return Card(
              clipBehavior: Clip.antiAlias, // Ensures image doesn't bleed past rounded corners
              color: product.color.withOpacity(0.1),
              child: InkWell(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('You selected ${product.name}'),
                      duration: const Duration(seconds: 1),
                    ),
                  );
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Image.network(
                        product.imageUrl,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        // Loading placeholder to prevent errors if internet is slow
                        errorBuilder: (context, error, stackTrace) => const Icon(Icons.broken_image),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            product.name,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(product.price),
                          const SizedBox(height: 4),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}