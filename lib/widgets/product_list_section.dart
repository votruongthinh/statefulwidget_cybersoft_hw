import 'package:flutter/material.dart';
import 'package:stateful_homework/models/product.dart';
import 'package:stateful_homework/widgets/product_card.dart';

class ProductListSection extends StatelessWidget {
  final List<Product> products;
  final ValueChanged<Product> onAdd;
  const ProductListSection({
    super.key,
    required this.products,
    required this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 340,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        itemBuilder: (context, index) =>
            ProductCard(product: products[index], onAdd: onAdd),
        separatorBuilder: (_, _) => const SizedBox(width: 8),
      ),
    );
  }
}
