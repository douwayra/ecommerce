import 'package:flutter/material.dart';
import '../models/product.dart';

class CartItemWidget extends StatelessWidget {
  final Product product;

  CartItemWidget({required this.product});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(product.name),
      subtitle: Text('${product.price.toStringAsFixed(0)} FCFA'),
    );
  }
}
