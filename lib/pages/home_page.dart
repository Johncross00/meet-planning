import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'event_page.dart';
class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meetings Planning"),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Image(image: AssetImage('assets/images/apple.jpg')),
              //     Image.asset("assets/images/apple.jpg"),
              SvgPicture.asset(
                  ("assets/images/bread.svg")),
              const Text("Meetings ",
                  style: TextStyle(
                      fontSize: 42,
                      fontFamily: 'Poppins'
                  )
              ),
              const Text("You will planificate your future meet here",
                style: TextStyle(
                  fontSize: 24,
                ),
                textAlign: TextAlign.center,),
              Padding(padding: EdgeInsets.only(top: 50)),
              ElevatedButton.icon(
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(EdgeInsets.all(15)),
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.orange),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EventPage()),
                  );
                },
                // child: Text("Afficher le planning",
                label: Text("Afficher le planning",
                  style: TextStyle(
                      fontSize: 20
                  ),
                ),
                icon: Icon(Icons.calendar_month),
              )
            ],
          )
      ),
    );
  }
}