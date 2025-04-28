import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';
import '../providers/cart_provider.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(title: Text(product.name)),
      body: Column(
        children: [
          Image.asset(product.image), // ✅ Image locale
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Text(product.description),
                SizedBox(height: 20),
                Text('${product.price.toStringAsFixed(0)} FCFA',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                ElevatedButton(
                  onPressed: () {
                    cart.add(product);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Ajouté au panier')),
                    );
                  },
                  child: Text('Ajouter au panier'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
