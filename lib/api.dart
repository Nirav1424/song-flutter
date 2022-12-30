// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:audioplayers/audioplayers.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

AudioPlayer myPlayer = AudioPlayer();
var path = 'assets/gana.mp3';

TextEditingController txt1 = TextEditingController();
TextEditingController txt2 = TextEditingController();
var data = '';
bool play = false;

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: txt1,
            ),
            TextField(
              controller: txt2,
            ),
            ElevatedButton(
                onPressed: () {
                  addTodo();
                },
                child: Text('add')),
            ElevatedButton(
                onPressed: () async {
                  setState(() {
                    
                  });
                  play = !play;
                  play ?   myPlayer.play(AssetSource("gana.mp3")): myPlayer.pause();
                },
                child: Text(!play ? 'play' : 'pause')),
            // ElevatedButton(
            //     onPressed: () async {
            //       await myPlayer.pause();
            //     },
            //     child: Text('pause')),
            ElevatedButton(
                onPressed: () async {
                  await myPlayer.resume();
                },
                child: Text('resume')),
            ElevatedButton(
                onPressed: () async {
                  await myPlayer.stop();
                },
                child: Text('stop')),
            ElevatedButton(onPressed: null, child: Text('display')),
            Text(data),
          ],
        ),
      ),
    );
  }

  void addTodo() async {
    var url = Uri.https('akashsir.in', 'myapi/crud/todo-add-api.php');
    var response = await http
        .post(url, body: {'todo_title': txt1.text, 'todo_details': txt2.text});

    // print('Response status: ${response.statusCode}');
    // print('Response body: ${response.body}');
    setState(() {
      data = response.body;
    });
    // print(data);
  }
}
