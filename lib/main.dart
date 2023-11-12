import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Meetings Planning"),
        ),
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
            // Image(image: AssetImage('assets/images/apple.jpg'))
                SvgPicture.asset(
                    ("assets/images/bread.svg")),
               Text("Meetings ",
                  style: TextStyle(
                    fontSize: 42,
                    fontFamily: 'Poppins'
                  )
                ),
                Text("You will planificate your future meet here",
                style: TextStyle(
                  fontSize: 24,
                ),
                textAlign: TextAlign.center,)
              ],
            )
        ),
      ),
    );
  }
}
