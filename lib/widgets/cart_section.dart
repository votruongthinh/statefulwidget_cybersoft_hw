import 'package:flutter/material.dart';
import 'package:stateful_homework/models/cart_item.dart';
import 'package:stateful_homework/widgets/cart_item_tile.dart';

class CartSection extends StatelessWidget {
  final List<CartItem> cartItems;
  final ValueChanged<String> onMove;

  const CartSection({super.key, required this.cartItems, required this.onMove});

  @override
  Widget build(BuildContext context) {
    if (cartItems.isEmpty) {
      return const Padding(
        padding: EdgeInsetsGeometry.symmetric(vertical: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("Giỏ hàng trống")],
        ),
      );
    }
    return Column(
      children: cartItems
          .map(
            (item) => CartItemTile(
              cartItem: item,
              onDelete: () => onMove(item.product.id!),
            ),
          )
          .toList(),
    );
  }
}
