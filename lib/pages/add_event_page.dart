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
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  String selectedConfType = 'talk';
  DateTime selectedConfDate = DateTime.now();
  @override
  void dispose() {
    super.dispose();

    titleController.dispose();
    descriptionController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Form(
        key: _formkey,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: GradientOutlineInputBorder(
                    gradient: LinearGradient(colors: [Colors.orange, Colors.blue]),
                    width: 2,
                  ),
                  focusedBorder: GradientOutlineInputBorder(
                      gradient: LinearGradient(colors: [Colors.blue, Colors.orange]),
                      width: 3
                  ),
                  labelText: 'Title',
                  hintText: "Enter title",
                  // border: OutlineInputBorder(
                  //   borderRadius: BorderRadius.circular(50)
                  //
                  // ),
                ),
                validator: (value) {
                  // if (value!.isEmpty) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title 😒';
                  }
                  return null;
                } ,
                controller: titleController,
              ),

            ),
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: GradientOutlineInputBorder(
                    gradient: LinearGradient(colors: [Colors.orange, Colors.blue]),
                    width: 2,
                  ),
                  focusedBorder: GradientOutlineInputBorder(
                      gradient: LinearGradient(colors: [Colors.blue, Colors.orange]),
                      width: 3
                  ),
                  labelText: 'Description',
                  hintText: "Enter description",
                  // border: OutlineInputBorder(
                  //   borderRadius: BorderRadius.circular(100),
                  // ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a description 😒';
                  }
                  return null;
                } ,
                controller: descriptionController,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              child: DropdownButtonFormField(
                items: const [
                  DropdownMenuItem(value: 'talk', child: Text("Talk Show")),
                  DropdownMenuItem(value: 'demo', child: Text("Demo Code")),
                  DropdownMenuItem(value: 'partner', child: Text("Partner")),
                ],
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
                elevation: 50,
                value: selectedConfType,
                onChanged: (value) {
                  setState(() {
                    selectedConfType = value!;
                  });
                },
              ),
            ),

            Container(
              margin: const EdgeInsets.only(bottom: 20),
              child: DateTimeFormField(
                decoration: const InputDecoration(
                  hintStyle: TextStyle(color: Colors.black45),
                  errorStyle: TextStyle(color: Colors.redAccent),
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.event_note),
                  labelText: 'Choose the date',
                ),
                mode: DateTimeFieldPickerMode.dateAndTime,
                autovalidateMode: AutovalidateMode.always,
                validator: (e) => (e?.day ?? 0) == 1 ? 'Please not the first day' : null,
                onDateSelected: (DateTime value) {
                  setState(() {
                    selectedConfDate = value;
                  });
                },
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton.icon(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.orange),
                  ),
                  onPressed: (){
                    if (_formkey.currentState!.validate()) {
                      final title = titleController.text;
                      final description = descriptionController.text;
                      ScaffoldMessenger.of(context).showSnackBar(
                         SnackBar(
                          content: Text("Event in adding...($title/$description/$selectedConfType/$selectedConfDate"),
                          backgroundColor: Colors.blueGrey,
                          elevation: 25,
                          duration: const Duration(seconds: 2)),
                      );
                      FocusScope.of(context).requestFocus(FocusNode());
                    }
                  },
                  label: const Text("Send",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  ),
                  icon: const Icon(Icons.send, color: Colors.white,)
              ),
            )
          ],
        ),
      ),
    );
  }
}

