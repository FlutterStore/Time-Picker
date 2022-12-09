// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Timepicker(),
    );
  }
}

class Timepicker extends StatefulWidget {
  const Timepicker({super.key});

  @override
  State<Timepicker> createState() => _TimepickerState();
}

class _TimepickerState extends State<Timepicker> {

  TextEditingController time = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: const Text("Time Picker",style: TextStyle(fontSize: 15),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton(
              style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.green)),
              onPressed: () async {
                TimeOfDay? pickedTime =  await showTimePicker(
                  initialTime: TimeOfDay.now(),
                  context: context,
                  builder: (context, child) {
                  return Theme(
                    data: ThemeData.light().copyWith(
                      colorScheme: const ColorScheme.light(
                          primary: Colors.green,
                          onSurface: Colors.green,
                        ),
                        buttonTheme: const ButtonThemeData(
                          colorScheme: ColorScheme.light(
                            primary: Colors.green,
                          ),
                        ),
                      ),
                      child: child!,
                    );
                  },
                );
                if(pickedTime != null ){
                  DateTime parsedTime = DateFormat.jm().parse(pickedTime.format(context).toString());
                  String formattedTime = DateFormat('hh:mm a').format(parsedTime);
                  time.text = formattedTime;
                }
                else{}
              },
              child: const Text("Select Time",style: TextStyle(color: Colors.white),)
              ),
              const SizedBox(height: 15,),
              SizedBox(
                height: 50,
                child: TextField(
                  autocorrect: false,
                  enableSuggestions: false,
                  controller: time,
                  cursorColor: Colors.black,
                  enabled: false,
                  style: const TextStyle(fontSize: 13,height: 1,color: Colors.green),
                  decoration: InputDecoration(
                    prefixIcon: const Padding(
                      padding: EdgeInsets.only(left: 18,right: 18,),
                      child: Icon(Icons.date_range_rounded,color: Colors.green,),
                    ),
                    labelText: 'Time',
                    labelStyle: TextStyle(fontSize: 13,color: Colors.grey.withOpacity(.8)),
                    disabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}