import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
class EventPage extends StatelessWidget {
  const EventPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Event Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SvgPicture.asset('assets/images/event.svg'),
            const SizedBox(height: 20),
            Text('Event Page'),
          ],
        ),
      ),
    );
  }
}