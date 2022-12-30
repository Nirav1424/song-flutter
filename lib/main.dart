// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// import 'api.dart';
import 'music.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:const MusicScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var mydata = "";
  TextEditingController txt1 =  TextEditingController();
  TextEditingController txt2 =  TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(children: [
          TextField(
            controller: txt1,
          ),
          TextField(
            controller: txt2,
          ),
          ElevatedButton(
              onPressed: () {
                datapass();
              },
              child: Text("Add")),
          ElevatedButton(
              onPressed: () {
                dataget();
              },
              child: Text("Display")),
          Text(mydata)
        ]),
      ),
    );
  }

  datapass() async {
    var url = Uri.https('akashsir.in', 'myapi/crud/todo-add-api.php');
    var response = await http
        .post(url, body: {'todo_title': txt1.text, 'todo_details': txt2.text});
    // print('Record Added');
    // print('Response status: ${response.statusCode}');
    // print('Response body: ${response.body}');
    setState(() {
      mydata = response.body;
    });
  }

  dataget() async {
    var url = Uri.https('akashsir.in', 'myapi/crud/todo-list-api.php');
    var response = await http.get(url);
    // print('Record Display');
    // print('Response status: ${response.statusCode}');
    // print('Response body: ${response.body}');
    setState(() {
      mydata = response.body;
    });
  }
}
