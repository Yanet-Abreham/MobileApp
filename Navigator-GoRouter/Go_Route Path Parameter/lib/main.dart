import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
    );
  }
}

/* Home Screen */
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Path + Query parameter navigation
            context.go('/product/42?filter=electronics');
          },
          child: const Text('Go to Product 42'),
        ),
      ),
    );
  }
}

/* Product Screen */
class ProductScreen extends StatelessWidget {
  final String id;
  final String filter;

  const ProductScreen({
    super.key,
    required this.id,
    required this.filter,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Product $id')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Product ID: $id'),
            Text('Filter: $filter'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => context.go('/'),
              child: const Text('Back to Home'),
            ),
          ],
        ),
      ),
    );
  }
}

/* Routes */
final GoRouter _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/product/:id',
      builder: (context, state) {
        // Get path parameter
        final id = state.pathParameters['id'] ?? '0';

        // Get query parameter
        final filter = state.uri.queryParameters['filter'] ?? 'none';

        return ProductScreen(id: id, filter: filter);
      },
    ),
  ],
);