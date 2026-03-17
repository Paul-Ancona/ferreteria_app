import 'package:flutter/material.dart';

class CartItem {
  final String name;
  final double price;
  final dynamic visual; // Can be String (imagePath) or IconData
  final MaterialColor color;
  int quantity;

  CartItem({
    required this.name,
    required this.price,
    required this.visual,
    required this.color,
    this.quantity = 1,
  });
}

class CartModel extends ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  int get totalItems => _items.fold(0, (sum, item) => sum + item.quantity);

  double get subtotal =>
      _items.fold(0, (sum, item) => sum + (item.price * item.quantity));
      
  double get iva => subtotal * 0.16;
  
  double get shippingFee => _items.isEmpty ? 0.0 : 150.0;

  double get totalPrice => subtotal + iva + shippingFee;

  void addItem({
    required String name,
    required double price,
    required dynamic visual, // Can be String (imagePath) or IconData
    required MaterialColor color,
  }) {
    final index = _items.indexWhere((i) => i.name == name);
    if (index != -1) {
      _items[index].quantity++;
    } else {
      _items.add(CartItem(
        name: name,
        price: price,
        visual: visual,
        color: color,
      ));
    }
    notifyListeners();
  }

  void increment(CartItem item) {
    item.quantity++;
    notifyListeners();
  }

  void decrement(CartItem item) {
    item.quantity--;
    if (item.quantity <= 0) {
      _items.remove(item);
    }
    notifyListeners();
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }
}