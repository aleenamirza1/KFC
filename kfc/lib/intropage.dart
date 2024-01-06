import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kfc/button.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(height: 25),
              RichText(
                text: TextSpan(
                  style: GoogleFonts.acme(
                    color: Colors.white,
                    fontSize: 28,
                  ),
                  children: [
                    TextSpan(text: "K", style: TextStyle(color: Colors.grey)),
                    TextSpan(
                        text: "entucky ",
                        style: TextStyle(color: Colors.white)),
                    TextSpan(text: "F", style: TextStyle(color: Colors.grey)),
                    TextSpan(
                        text: "ried ", style: TextStyle(color: Colors.white)),
                    TextSpan(text: "C", style: TextStyle(color: Colors.grey)),
                    TextSpan(
                        text: "hicken", style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  "assets/Images/27.png",
                ),
              ),
              SizedBox(height: 25),
              Text(
                "Its Finger Lickin' Good",
                style: GoogleFonts.acme(fontSize: 25, color: Colors.white),
              ),
              SizedBox(
                height: 25,
              ),
              MyButton(
                text: "Get Started",
                onTap: () {
                  Navigator.pushNamed(context, '/menupage');
                },
              )
            ],
          ),
        ));
  }
}
