import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final GoRouter _router = GoRouter(
    routes: [
      // Home
      GoRoute(
        path: '/',
        builder: (context, state) => const HomeScreen(),
      ),

      GoRoute(
        path: '/product/:id',
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          final filter = state.uri.queryParameters['filter'] ?? 'all';
          return ProductDetailScreen(id: id, filter: filter);
        },
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.go('/product/42?filter=popular');
          },
          child: const Text('Go to Details'),
        ),
      ),
    );
  }
}

class ProductDetailScreen extends StatelessWidget {
  final String id;
  final String filter;

  const ProductDetailScreen({super.key, required this.id, required this.filter});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product $id'),
      ),
      body: Center(
        child: Text(
          'Showing Product ID: $id\nFilter: $filter',
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}