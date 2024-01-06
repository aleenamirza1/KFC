import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kfc/button.dart';
import 'package:kfc/food_detail.dart';
import 'package:kfc/food_tile.dart';
import 'package:kfc/products.dart';
import 'package:kfc/shop.dart';
import 'package:provider/provider.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  TextEditingController _textEditingController = TextEditingController();
  bool showInitialText = true;

  void navigateToFoodDetails(int index, String category) {
    final shop = context.read<Shop>();
    // ignore: unused_local_variable
    List<Products> products = [
      ...shop.beverages,
      ...shop.burgers,
      ...shop.everydayValue
    ];
    List<Products> selectedList;

    switch (category) {
      case 'Ala-Carte-&-Combos':
        selectedList = shop.burgers;
        break;
      case 'Everyday Value':
        selectedList = shop.everydayValue;
        break;
      case 'Snack & Beverages':
        selectedList = shop.beverages;
        break;
      default:
        selectedList = shop.burgers;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FoodDetails(
          food: selectedList[index],
          category: category,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(
          Icons.menu,
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Spacer(),
            Text(
              "KFC",
              style: GoogleFonts.archivoBlack(
                color: Colors.red,
                fontSize: 28,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 150,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 135, 40, 33),
                borderRadius: BorderRadius.circular(20),
              ),
              margin: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              padding: EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        "Get 25% Promo ",
                        style:
                            GoogleFonts.acme(fontSize: 20, color: Colors.white),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      MyButton(text: "Redeem", onTap: () {}),
                    ],
                  ),
                  Image.asset(
                    'assets/Images/28.png',
                    height: 80,
                  ),
                ],
              ),
            ),
            SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: TextField(
                controller: _textEditingController,
                onChanged: (text) {
                  setState(() {
                    showInitialText = text.isEmpty;
                  });
                },
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 135, 40, 33)),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  hintText: showInitialText ? 'Search your item' : '',
                  hintStyle: TextStyle(color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 25),
            buildCategorySection(
                "Ala-Carte-&-Combos", context.watch<Shop>().burgers),
            buildCategorySection(
                "Everyday Value", context.watch<Shop>().everydayValue),
            buildCategorySection(
                "Snack & Beverages", context.watch<Shop>().beverages),
          ],
        ),
      ),
      floatingActionButton: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: Colors.white,
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              spreadRadius: 2,
              blurRadius: 10,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/cartpage');
          },
          backgroundColor: Colors.black,
          child: Icon(
            Icons.shopping_cart,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget buildCategorySection(String title, List<Products> productList) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
        SizedBox(height: 10),
        Container(
          height: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: productList.asMap().entries.map((entry) {
              int index = entry.key;
              Products product = entry.value;
              return Foodtile(
                food: product,
                OnTap: () {
                  navigateToFoodDetails(index, title);
                },
              );
            }).toList(),
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
