import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/cart_model.dart';

class ProductTile extends StatelessWidget {
  final String productName;
  final String productPrice;
  final dynamic productColor;
  final IconData productIcon;
  final String productCategory;

  const ProductTile({
    super.key,
    required this.productName,
    required this.productPrice,
    required this.productColor,
    required this.productIcon,
    required this.productCategory,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          color: productColor[100],
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          children: [
            // etiqueta del precio
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 18,
                  ),
                  decoration: BoxDecoration(
                    color: productColor[200],
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(24),
                      bottomLeft: Radius.circular(24),
                    ),
                  ),
                  child: Text(
                    '\$$productPrice',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: productColor[800],
                    ),
                  ),
                )
              ],
            ),

            // icono del producto
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
              child: Icon(
                productIcon,
                size: 64,
                color: productColor[800],
              ),
            ),

            // nombre del producto
            Text(
              productName,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),

            const SizedBox(height: 4),

            // categoría
            Text(
              productCategory,
              style: TextStyle(color: Colors.grey[600], fontSize: 12),
            ),

            const Spacer(),

            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.build_circle, color: productColor[400]),

                  // AQUÍ se añade al carrito
                  GestureDetector(
                    onTap: () {
                      final price = double.tryParse(productPrice) ?? 0;

                      context.read<CartModel>().addItem(
                            name: productName,
                            price: price,
                            icon: productIcon,
                            color: productColor,
                          );
                      
                      // Opcional: Mostrar feedback de agregado
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('$productName agregado al carrito'),
                          duration: const Duration(milliseconds: 500),
                        ),
                      );
                    },
                    child: const Text(
                      "ADD",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
