import 'package:flutter/material.dart';
import 'package:stateful_homework/models/cart_item.dart';

class CartItemTile extends StatelessWidget {
  final CartItem cartItem;
  final VoidCallback onDelete;
  const CartItemTile({
    super.key,
    required this.cartItem,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),

      child: ListTile(
        leading: Image.asset(
          cartItem.product.imageUrl!,
          width: 50,
          height: 50,
          fit: BoxFit.cover,
        ),
        title: Text(
          cartItem.product.name!,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  'Giá: ${cartItem.product.price}',
                  style: const TextStyle(color: Colors.green, fontSize: 16),
                ),
                Icon(
                  Icons.attach_money_outlined,
                  size: 20,
                  color: Colors.green,
                ),
              ],
            ),

            const SizedBox(width: 16),
            Text(
              'Số lượng: ${cartItem.quantity}',
              style: const TextStyle(color: Colors.blue),
            ),
          ],
        ),
        trailing: IconButton(
          onPressed: onDelete,
          icon: Icon(Icons.delete, color: Colors.red),
        ),
      ),
    );
  }
}
