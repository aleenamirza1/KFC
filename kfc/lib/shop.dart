import 'package:flutter/material.dart';
import 'package:kfc/products.dart';

class Shop extends ChangeNotifier {
  final List<Products> burgers = [
    Products(
      name: "Krunch Burger",
      price: "270",
      imagepath: "assets/Images/11.png",
      rating: "4.0",
    ),
    Products(
      name: "Zinger Burger",
      price: "550",
      imagepath: "assets/Images/23.png",
      rating: "4.0",
    ),
    Products(
      name: "Mighty Burger",
      price: "700",
      imagepath: "assets/Images/12.png",
      rating: "4.0",
    ),
    Products(
      name: "Kentucky Burger",
      price: "590",
      imagepath: "assets/Images/10.png",
      rating: "4.0",
    ),
    Products(
      name: "Zinger Stacker",
      price: "590",
      imagepath: "assets/Images/24.png",
      rating: "4.0",
    ),
    Products(
      name: "Zinger Super Charger",
      price: "590",
      imagepath: "assets/Images/25.png",
      rating: "4.0",
    ),
  ];

  List<Products> everydayValue = [
    Products(
      name: "Zingeratha",
      price: "350",
      imagepath: "assets/Images/26.png",
      rating: "4.0",
    ),
    Products(
      name: "Twister",
      price: "400",
      imagepath: "assets/Images/22.png",
      rating: "4.0",
    ),
    Products(
      name: "Salsa Sprinkle Wings bucket",
      price: "580",
      imagepath: "assets/Images/19.png",
      rating: "4.0",
    ),
    Products(
      name: "Thai Sweet Chilli Wings",
      price: "580",
      imagepath: "assets/Images/20.png",
      rating: "4.0",
    ),
    Products(
      name: "Rice & Spice",
      price: "350",
      imagepath: "assets/Images/18.png",
      rating: "4.0",
    ),
    Products(
      name: "Spicy Nuggets",
      price: "530",
      imagepath: "assets/Images/15.png",
      rating: "4.0",
    ),
    Products(
      name: "HotShots",
      price: "420",
      imagepath: "assets/Images/9.png",
      rating: "4.0",
    ),
    Products(
      name: "Fries",
      price: "270",
      imagepath: "assets/Images/16.png",
      rating: "4.0",
    ),
    Products(
      name: "Fries Bucket",
      price: "420",
      imagepath: "assets/Images/8.png",
      rating: "4.0",
    ),
    Products(
      name: "# Pcs Chicken",
      price: "620",
      imagepath: "assets/Images/2.png",
      rating: "4.0",
    ),
  ];

  List<Products> beverages = [
    Products(
      name: "Pepsi Regular",
      price: "140",
      imagepath: "assets/Images/17.png",
      rating: "4.0",
    ),
    Products(
      name: "Mirinda Regular",
      price: "140",
      imagepath: "assets/Images/14.png",
      rating: "4.0",
    ),
    Products(
      name: "Mountain Dew Regular",
      price: "140",
      imagepath: "assets/Images/6.png",
      rating: "4.0",
    ),
    Products(
      name: "7UP Regular",
      price: "140",
      imagepath: "assets/Images/3.png",
      rating: "4.0",
    ),
    Products(
      name: "1.5 Ltr Drink",
      price: "250",
      imagepath: "assets/Images/1.png",
      rating: "4.0",
    ),
    Products(
      name: "Corn On The Cob",
      price: "250",
      imagepath: "assets/Images/2.png",
      rating: "4.0",
    ),
    Products(
      name: "Dinner Roll",
      price: "50",
      imagepath: "assets/Images/7.png",
      rating: "4.0",
    ),
    Products(
      name: "Coloslaw",
      price: "100",
      imagepath: "assets/Images/4.png",
      rating: "4.0",
    ),
  ];

  final Map<String, List<Products>> _cart = {};

  List<Products> get cart =>
      _cart.values.expand((products) => products).toList();

  void addtocart(Products product, int quantity, String category) {
    if (!_cart.containsKey(category)) {
      _cart[category] = [];
    }

    final List<Products> categoryCart = _cart[category]!;

    for (int i = 0; i < quantity; i++) {
      categoryCart.add(
        Products(
          name: product.name,
          price: product.price,
          imagepath: product.imagepath,
          rating: product.rating,
          quantity: 1, // Set quantity to 1 for each added product
        ),
      );
    }

    notifyListeners();
  }

  void removefromcart(Products food) {
    for (var categoryCart in _cart.values) {
      final existingProductIndex =
          categoryCart.indexWhere((p) => p.name == food.name);
      if (existingProductIndex != -1) {
        print("Removing ${food.name} from cart.");
        categoryCart.removeAt(existingProductIndex);
        notifyListeners();
        return;
      }
    }
  }
}
