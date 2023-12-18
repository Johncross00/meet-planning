import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class EventPage extends StatefulWidget {
  const EventPage({super.key});

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {

  final events = [
    // {
    //   "speaker": "Meet 1",
    //   "subject": "This is the first meeting",
    //   "avatar": "germain"
    // },
    // {
    //   "speaker": "Meet 2",
    //   "subject": "This is the second meeting",
    //   "avatar": "apple"
    // },
    // {
    //   "speaker": "Meet 3",
    //   "subject": "This is the third meeting",
    //   "avatar": "mac"
    // },
  ];
  @override
  Widget build(BuildContext context) {
    return Center(
        child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("Events").snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting){
              return CircularProgressIndicator();
            }
            if (!snapshot.hasData){
              return Text("No data");
            }
            List<dynamic> events = [];
            snapshot.data!.docs.forEach((element) {
              events.add(element);
            });
            return ListView.builder(
                itemCount: events.length,
                itemBuilder: (context, index){
                  final event = events[index];
                  final avatar = event["avatar"].toString().toLowerCase();
                  final speaker = event["speaker"];
                  final Timestamp timestamp = event["date"];
                  final String date = DateFormat.yMd().add_jm().format(timestamp.toDate());
                  final subject = event["subject"];

                  return Card(
                    child: ListTile(
                      leading: Image.asset("assets/images/$avatar.jpg"),
                      title: Text("$speaker"),
                      subtitle: Text("$subject"),
                      trailing: const Icon(Icons.more_vert),
                    ),
                  );
                }
            );
          },
        )
    );
  }
}
