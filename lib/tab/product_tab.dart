import 'package:ferreteria_app/utils/product_tile.dart';
import 'package:flutter/material.dart';

class ProductTab extends StatelessWidget {
  final List itemsList;

  const ProductTab({super.key, required this.itemsList});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: itemsList.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio:
            1 / 1.5, // Ajustado para que quepa bien el icono y textos
      ),
      itemBuilder: (context, index) {
        return ProductTile(
          productName: itemsList[index][0],
          productPrice: itemsList[index][1],
          productColor: itemsList[index][2],
          productIcon: itemsList[index][3],
          productCategory: itemsList[index][4],
        );
      },
    );
  }
}
