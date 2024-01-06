import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kfc/products.dart';

class Foodtile extends StatelessWidget {
  final Products food;
  final void Function() OnTap;

  const Foodtile({
    Key? key,
    required this.food,
    required this.OnTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: OnTap,
      child: Container(
          decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.white)),
          margin: EdgeInsets.only(left: 20),
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                food.imagepath,
                height: 100,
              ),
              Text(
                food.name,
                style: GoogleFonts.acme(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                width: 160,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Rs ' + food.price,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(118, 255, 255, 255),
                      ),
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.yellow[800],
                    ),
                    Text(
                      food.rating,
                      style: TextStyle(
                          color: const Color.fromARGB(118, 255, 255, 255)),
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}
