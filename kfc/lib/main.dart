import 'package:flutter/material.dart';
import 'package:kfc/cart_page.dart';
import 'package:kfc/intropage.dart';
import 'package:kfc/menu.dart';
import 'package:kfc/shop.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Shop(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => Shop(),
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: IntroPage(),
            routes: {
              '/intropage': (context) => const IntroPage(),
              '/menupage': (context) => const MenuPage(),
              '/cartpage': (context) => const CartPage()
            }));
  }
}
