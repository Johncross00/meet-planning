import 'package:flutter/material.dart';
import 'package:meet/pages/add_event_page.dart';
import 'package:meet/pages/event_page.dart';
import 'package:meet/pages/home_page.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;

  setCurrentIndex(int index) {
    // setState(() {
    //   _currentIndex = index;
    // });
    setState (() =>_currentIndex = index);
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          elevation: 10,
          title: [
            const Text("Home"),
            const Text("Planning"),
            const Text("Event Adding"),
          ][_currentIndex],
        ),
        body: [
          const HomePage(),
          const EventPage(),
          const AddEventPage()
        ][_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: Colors.orange,
            unselectedItemColor: Colors.grey,
            currentIndex: _currentIndex,
            type: BottomNavigationBarType.fixed,
            // onTap: (index) {
            //   setCurrentIndex(index);
            // },
            onTap: (index) => setCurrentIndex(index),
            iconSize: 30,
            elevation: 10,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.calendar_month_outlined),
                label: "Planning",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.add_alarm_sharp),
                label: "Add Event",
              ),
            ]
        ),
      ),
    );
}

}





