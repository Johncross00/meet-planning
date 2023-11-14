import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
class EventPage extends StatefulWidget {
  const EventPage({super.key});

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {

  final events = [
    {
      "speaker": "Meet 1",
      "subject": "This is the first meeting",
      "avatar": "germain"
    },
    {
      "speaker": "Meet 2",
      "subject": "This is the second meeting",
      "avatar": "apple"
    },
    {
      "speaker": "Meet 3",
      "subject": "This is the third meeting",
      "avatar": "mac"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Event Page'),
      ),
      body: Center(
          child: ListView.builder(
            itemCount: events.length,
            itemBuilder: (context, index){
              final event = events[index];
              final avatar = event["avatar"];
              final speaker = event["speaker"];
              final subject = event["subject"];

              return Card(
                child: ListTile(
                  leading: Image.asset("assets/images/$avatar.jpg"),
                  title: Text("$speaker"),
                  subtitle: Text("$subject"),
                  trailing: Icon(Icons.more_vert),
                ),
              );
            }
          )
      ),
    );
  }
}
