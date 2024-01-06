import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kfc/button.dart';
import 'package:kfc/products.dart';
import 'package:kfc/shop.dart';
import 'package:provider/provider.dart';

class FoodDetails extends StatefulWidget {
  final Products food;
  final String category;
  const FoodDetails({super.key, required this.food, required this.category});

  @override
  State<FoodDetails> createState() => _FoodDetailsState();
}

class _FoodDetailsState extends State<FoodDetails> {
  int quantityCount = 0;
  void decrementQuantity() {
    setState(() {
      if (quantityCount > 0) {
        quantityCount--;
      }
    });
  }

  void inccrementQuantity() {
    setState(() {
      if (quantityCount < 20) {
        quantityCount++;
      }
    });
  }

  void addtocart() {
    if (quantityCount > 0) {
      final shop = context.read<Shop>();
      shop.addtocart(widget.food, quantityCount, widget.category);
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => AlertDialog(
                  backgroundColor: Color.fromARGB(255, 135, 40, 33),
                  content: Text(
                    "Successfully added to cart",
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  actions: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.done,
                        color: Colors.white,
                      ),
                    )
                  ]));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: ListView(
              children: [
                Image.asset(
                  widget.food.imagepath,
                  height: 200,
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.yellow[800],
                    ),
                    SizedBox(width: 5),
                    Text(
                      widget.food.rating,
                      style: TextStyle(
                        color: Colors.grey[200],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Text(
                  widget.food.name,
                  style: GoogleFonts.acme(fontSize: 28, color: Colors.white),
                ),
                SizedBox(height: 25),
                Text(
                  "Description",
                  style: GoogleFonts.acme(
                      color: Colors.grey[200],
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Delight in the symphony of flavors and textures with this exquisite culinary creation—a whimsical fusion of the familiar and the unexpected. Picture a velvety medley of roasted butternut squash and caramelized shallots, bathed in a luscious balsamic reduction that adds a tantalizing touch of sweetness.",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                    height: 2,
                  ),
                )
              ],
            ),
          )),
          Container(
            color: const Color.fromARGB(255, 135, 40, 33),
            padding: EdgeInsets.all(25),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Rs " + widget.food.price,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 100, 29, 24),
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            icon: Icon(
                              Icons.remove,
                              color: Colors.white,
                            ),
                            onPressed: decrementQuantity,
                          ),
                        ),
                        SizedBox(width: 5),
                        Text(
                          quantityCount.toString(),
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                        SizedBox(width: 5),
                        Container(
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 100, 29, 24),
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            icon: Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                            onPressed: inccrementQuantity,
                          ),
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(height: 25),
                MyButton(text: "Add To Cart", onTap: addtocart)
              ],
            ),
          )
        ],
      ),
    );
  }
}
