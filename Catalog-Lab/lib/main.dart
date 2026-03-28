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
      theme: ThemeData(
        primarySwatch: Colors.orange,
        useMaterial3: false, // Matches the look in your slides
      ),
      home: const CatalogScreen(),
    );
  }
}

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Defining the list inside the build method prevents the "Const class" error
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
            childAspectRatio: 0.8, // Adjusted ratio to fit text and smaller image
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            final product = products[index];
            return Card(
              elevation: 2,
              clipBehavior: Clip.antiAlias,
              color: product.color.withOpacity(0.05),
              child: InkWell(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Selected: ${product.name}'),
                      duration: const Duration(milliseconds: 500),
                    ),
                  );
                },
                child: Column(
                  children: [
                    // Image Container with Padding to decrease image size
                    Expanded(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0), // Makes image smaller
                        child: Image.network(
                          product.imageUrl,
                          fit: BoxFit.contain, // Ensures image isn't cropped
                          errorBuilder: (context, error, stackTrace) =>
                              const Icon(Icons.broken_image),
                        ),
                      ),
                    ),
                    // Product Details
                    Expanded(
                      flex: 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            product.name,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            product.price,
                            style: TextStyle(color: Colors.grey[700]),
                          ),
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