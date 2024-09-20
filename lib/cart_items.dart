import 'package:flutter/cupertino.dart';

class CartItems{
  final String productImage;
  final String productTitle;
  final String color;
  final String size;
  final double price;
  int quantity;

  CartItems ({
    required this.productImage,
    required this.productTitle,
    required this.color,
    required this.size,
    required this.price,
    this.quantity = 1,
});

}
