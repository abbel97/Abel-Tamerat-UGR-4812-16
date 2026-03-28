import 'package:flutter/material.dart';

void main() {
  runApp(CatalogApp());
}

class CatalogApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product Catalog',
      theme: ThemeData(primarySwatch: Colors.orange),
      home: CatalogScreen(),
    );
  }
}

class Product {
  final String name;
  final double price;
  final String image;
  final Color color;

  Product({
    required this.name, 
    required this.price, 
    required this.image,
    required this.color});
}


class CatalogScreen extends StatelessWidget {

  final List<Product> products = [
  Product(name: "Notebook", price: 1200, image: "assets/images/Laptop.png", color: Colors.blue),
  Product(name: "Cofee-Mug", price: 800, image: "assets/images/Coffee.png", color: Colors.brown),
  Product(name: "Pen-set", price: 150, image: "assets/images/Pen-set.png", color: Colors.green),
  Product(name: "Backpack", price: 100, image: "assets/images/Backpack.png", color: Colors.red),
  Product(name: "Headphone", price: 100, image: "assets/images/Headphone.png", color: Colors.grey),
  Product(name: "Smartwatch", price: 100, image: "assets/images/Smartwatch.png", color: Colors.black),
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Catalog")),
      body: Padding(
        padding: EdgeInsets.all(7.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.75,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemCount: products.length,
          itemBuilder: (context, index){
            final product = products[index];
            return Card(
              color: product.color.withValues(alpha: 0.1),
              child: InkWell(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('You selected ${product.name}')),
                  );
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Image.network(product.image, fit: BoxFit.cover),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        product.name,
                        style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(product.price.toString()),
                      SizedBox(height: 8)
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



   