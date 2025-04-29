import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/product.dart';

class FirestoreService {
  final CollectionReference productsRef =
      FirebaseFirestore.instance.collection('products');

  Stream<List<Product>> getProducts() {
    return productsRef.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return Product.fromMap(doc.id, doc.data() as Map<String, dynamic>);
      }).toList();
    });
  }

  Future<void> addProduct({
    required String name,
    required double price,
    required String image,
    required String description,
  }) async {
    await productsRef.add({
      'name': name,
      'price': price,
      'image': image,
      'description': description,
    });
  }
}
