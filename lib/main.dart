import 'package:flutter/material.dart';
import 'package:quiver/time.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calender Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const DaysOfMonth(title: 'Calender App'),
    );
  }
}

class DaysOfMonth extends StatefulWidget {
  const DaysOfMonth({super.key, required this.title});

  final String title;

  @override
  State<DaysOfMonth> createState() => _DaysOfMonthState();
}

class _DaysOfMonthState extends State<DaysOfMonth> {
  final months = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.separated(
          separatorBuilder: (BuildContext context, int index) => const Divider(
                color: Colors.black,
                height: 0.1,
                thickness: 0.2,
              ),
          itemCount: months.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(months.elementAt(index++),
                  style: const TextStyle(fontSize: 20)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          SecondPage(daysInMonth(2022, index))),
                );
              },
            );
          }),
    );
  }
}

class SecondPage extends StatelessWidget {
  // const SecondPage({super.key})
  final days;

  SecondPage(this.days);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Route'),
      ),
      body: Center(
        child: Stack(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              child: Image.asset('assets/shape_yellow1.png'),
            ),
            Container(
                alignment: Alignment.center,
                child: Text(
                  '$days',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                )),
          ],
        ),
      ),
    );
  }
}
