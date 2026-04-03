import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'go_router Lesson 1',
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
    );
  }
}

//Home Screen//
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () => context.goNamed('details'),
              child: const Text('Go to details'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => context.goNamed(
                'product',
                pathParameters: {'id': '42'},
                queryParameters: {'filter': 'electronics'},
              ),
              child: const Text('Go to Product 42'),
            ),
          ],
        ),
      ),
    );
  }
}

//Detailed Screen//
class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Details')),
      body: const Center(
        child: Text('This is the details screen'),
      ),
    );
  }
}

//Product Detailed Screen//
class ProductDetailedScreen extends StatelessWidget {
  final String id;
  final String filter;

  const ProductDetailedScreen({
    super.key,
    required this.id,
    required this.filter,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Product $id')),
      body: Center(
        child: Text('Showing Product $id\nFilter: $filter'),
      ),
    );
  }
}

//The Routes//
final GoRouter _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/details',
      name: 'details',
      builder: (context, state) => const DetailScreen(),
    ),
    GoRoute(
      path: '/product/:id',
      name: 'product',
      builder: (context, state) {
        final id = state.pathParameters['id'] ?? 'Unknown';
        final filter = state.uri.queryParameters['filter'] ?? 'None';
        return ProductDetailedScreen(id: id, filter: filter);
      },
    ),
  ],
);