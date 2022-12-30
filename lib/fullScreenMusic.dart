// ignore_for_file: prefer_const_constructors, must_be_immutable
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model.dart';
import 'package:flutter_application_1/music.dart';

class FullMusicScreen extends StatefulWidget {
  FullMusicScreen({super.key, required this.index, required this.music});
  int index;
  final List<Music> music;
  @override
  State<FullMusicScreen> createState() => _FullMusicScreenState();
}

AudioPlayer myPlayer = AudioPlayer();
int n = 0;
// List song = [
//   'a.mp3',
//   'b.mp3',
//   'c.mp3',
//   'd.mp3',
//   'g.mp3',
//   'f.mp3',
//   'h.mp3',
//   'i.mp3',
// ];

class _FullMusicScreenState extends State<FullMusicScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Songs'),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset(widget.music[widget.index].imageurl),
          Text(widget.music[widget.index].tital),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    if (widget.index != 0) {
                      widget.index--;
                      n--;
                    }
                  });
                },
                child: Icon(Icons.arrow_back_ios),
              ),
              ElevatedButton(
                onPressed: () async {
                  setState(() {});
                  play = !play;
                  play
                      ? myPlayer
                          .play(AssetSource(widget.music[widget.index].song))
                      : myPlayer.pause();
                },
                child: Icon(
                  !play ? Icons.play_arrow : Icons.pause,
                  size: 35,
                ),
              ),
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    if (widget.index !=
                        widget.music[widget.index].imageurl.length - 1) {
                      widget.index++;
                      n++;
                    }
                  });
                },
                child: Icon(Icons.arrow_forward_ios),
              ),
            ],
          )
        ],
      ),
    );
  }
}
