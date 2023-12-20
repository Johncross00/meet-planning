import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/input_borders/gradient_outline_input_border.dart';

class AddEventPage extends StatefulWidget {
  const AddEventPage({super.key});

  @override
  State<AddEventPage> createState() => _AddEventPageState();
}

class _AddEventPageState extends State<AddEventPage> {
  final _formkey = GlobalKey<FormState>();
  final eventTitleController = TextEditingController();
  final speakerNameController = TextEditingController();
  final descriptionController = TextEditingController();
  String selectedEventType = 'talk';
  DateTime selectedEventDate = DateTime.now();
  @override
  void dispose() {
    super.dispose();
    speakerNameController.dispose();
    eventTitleController.dispose();
    descriptionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30, right: 5, bottom: 20, left: 5),
      decoration: BoxDecoration(
          color: const Color.fromRGBO(0, 0, 0, 0.2), borderRadius: BorderRadius.circular(30)),
      child: Container(
        margin: const EdgeInsets.only(top: 50, right: 20, bottom: 20, left: 20),
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                child: TextFormField(
                  decoration: InputDecoration(
                    suffixIcon: const Icon(Icons.event),
                    prefixIconColor: Colors.white,
                    border: GradientOutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      gradient: const LinearGradient(
                          colors: [Colors.orange, Colors.blue]),
                      width: 2,
                    ),
                    focusedBorder: const GradientOutlineInputBorder(
                      gradient:
                          LinearGradient(colors: [Colors.blue, Colors.orange]),
                      width: 4,
                    ),
                    labelText: 'Event Title',
                    hintText: "Enter the event title",
                  ),
                  validator: (value) {
                    // if (value!.isEmpty) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the event title';
                    }
                    return null;
                  },
                  controller: eventTitleController,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                child: TextFormField(
                  decoration: InputDecoration(
                    suffixIcon: const Icon(Icons.person),
                    border: GradientOutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      gradient: const LinearGradient(
                          colors: [Colors.orange, Colors.blue,]),
                      width: 2,
                    ),
                    focusedBorder: const GradientOutlineInputBorder(
                        gradient: LinearGradient(
                            colors: [Colors.blue, Colors.orange]),
                        width: 4),
                    labelText: 'Speaker Name',
                    hintText: "Enter the speaker name",
                  ),
                  validator: (value) {
                    // if (value!.isEmpty) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the speaker name';
                    }
                    return null;
                  },
                  controller: speakerNameController,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                child: TextFormField(
                  decoration: InputDecoration(
                    suffixIcon: const Icon(Icons.event_note),
                    border: GradientOutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      gradient: const LinearGradient(
                          colors: [Colors.orange, Colors.blue]),
                      width: 2,
                    ),
                    focusedBorder: const GradientOutlineInputBorder(
                        gradient: LinearGradient(
                            colors: [Colors.blue, Colors.orange]),
                        width: 4),
                    labelText: 'Description',
                    hintText: "Enter description",
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a description';
                    }
                    return null;
                  },
                  controller: descriptionController,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                child: DropdownButtonFormField(
                  borderRadius: BorderRadius.circular(30),
                  dropdownColor: Colors.white,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Poppins",
                  ),
                  autofocus: true,
                  items: const [
                    DropdownMenuItem(value: 'talk', child: Text("Talk Show")),
                    DropdownMenuItem(value: 'demo', child: Text("Demo Code")),
                    DropdownMenuItem(value: 'partner', child: Text("Partner")),
                  ],
                  decoration: InputDecoration(
                    suffixText: ("Event Type"),
                    border: GradientOutlineInputBorder(
                        gradient: const LinearGradient(
                        colors: [Colors.orange, Colors.blue]),
                        width: 2,
                        borderRadius: BorderRadius.circular(
                      20,
                    )),
                  ),
                  elevation: 50,
                  value: selectedEventType,
                  onChanged: (value) {
                    setState(() {
                      selectedEventType = value!;
                    });
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 50),
                child: DateTimeFormField(
                  decoration: InputDecoration(
                    border: GradientOutlineInputBorder(
                      gradient: const LinearGradient(
                              colors: [Colors.orange, Colors.blue]),
                          width: 2,
                      borderRadius: BorderRadius.circular(20)
                    ),
                    suffixIcon: const Icon(Icons.date_range),
                    labelText: 'Choose the date',
                  ),
                  mode: DateTimeFieldPickerMode.dateAndTime,
                  autovalidateMode: AutovalidateMode.always,
                  validator: (e) =>
                      (e?.day ?? 0) == 1 ? 'Please not the first day' : null,
                  onDateSelected: (DateTime value) {
                    setState(() {
                      selectedEventDate = value;
                    });
                  },
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton.icon(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.orange),
                    ),
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {
                        final title = eventTitleController.text;
                        final description = descriptionController.text;
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text(
                                  "Event in adding...($title/$description/$selectedEventType/$selectedEventDate"),
                              backgroundColor: Colors.blueGrey,
                              elevation: 25,
                              duration: const Duration(seconds: 2)),
                        );
                        FocusScope.of(context).requestFocus(FocusNode());

                        CollectionReference eventsRef =
                            FirebaseFirestore.instance.collection("Events");
                        eventsRef.add({
                          'speaker': title,
                          'date': selectedEventDate,
                          'subject': description,
                          'avatar': 'germain',
                          'type': selectedEventType
                        });
                      }
                    },
                    label: const Text(
                      "Send",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    icon: const Icon(
                      Icons.send,
                      color: Colors.white,
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
