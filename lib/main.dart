import 'package:flutter/material.dart';
import 'package:meet/pages/add_event_page.dart';
import 'package:meet/pages/event_page.dart';
import 'package:meet/pages/home_page.dart';
import 'package:meet/pages/camera_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
      theme: ThemeData(
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // backgroundColor: Colors.blue,
        appBar: AppBar(
          backgroundColor: Colors.blue,
          elevation: 10,
          title: [
            const Text("Home", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),),
            const Text("Planning",  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),),
            const Text("Event Adding",  style: TextStyle(color: Colors.white,  fontWeight: FontWeight.bold, fontSize: 30),),
            const Text("Camera",  style: TextStyle(color: Colors.white,  fontWeight: FontWeight.bold, fontSize: 30),),
          ][_currentIndex],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SingleChildScrollView(
              child: [
                const HomePage(),
                const EventPage(),
                const AddEventPage(),
                const CameraPage(),
              ][_currentIndex],
            ),
          ],
        ),
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
              BottomNavigationBarItem(
                icon: Icon(Icons.camera_alt),
                label: "Start Meeting",
              ),
            ]
        ),
      ),
    );
}

}





