import 'package:flutter/material.dart';
import 'package:stateful_homework/data/mock_product.dart';
import 'package:stateful_homework/models/cart_item.dart';
import 'package:stateful_homework/widgets/cart_section.dart';
import 'package:stateful_homework/widgets/cart_total_bar.dart';
import 'package:stateful_homework/widgets/product_list_section.dart';

class ShoeStoreScreen extends StatefulWidget {
  const ShoeStoreScreen({super.key});

  @override
  State<ShoeStoreScreen> createState() => _ShoeStoreScreenState();
}

class _ShoeStoreScreenState extends State<ShoeStoreScreen> {
  final List<CartItem> _cartItems = [];

  double get _totalPrice =>
      _cartItems.fold(0.0, (sum, item) => sum + item.totalPrice);

  void _addToCart(product) {
    setState(() {
      final index = _cartItems.indexWhere(
        (item) => item.product.id == product.id,
      );
      if (index >= 0) {
        _cartItems[index].quantity++;
      } else {
        _cartItems.add(CartItem(product: product));
      }
    });
  }

  void _removeFromCart(String productId) {
    setState(() {
      _cartItems.removeWhere((item) => item.product.id == productId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue, title: Text("Shoe store")),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          const Text(
            'Giỏ hàng',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const SizedBox(height: 20),
          CartSection(cartItems: _cartItems, onMove: _removeFromCart),
          const SizedBox(height: 20),
          CartTotalBar(total: _totalPrice),
          const Divider(),
          const SizedBox(height: 16),
          const Text(
            "Danh sách giày",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const SizedBox(height: 8),
          ProductListSection(products: product, onAdd: _addToCart),
        ],
      ),
    );
  }
}
