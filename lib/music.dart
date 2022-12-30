// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_application_1/Model.dart';

import 'fullScreenMusic.dart';



class MusicScreen extends StatefulWidget {
  const MusicScreen({super.key});

  @override
  State<MusicScreen> createState() => _MusicScreenState();
}
// List img = [
//   "https://www.rnbjunk.com/foto/2017/04/Ignite.jpg",
//   "https://tse3.mm.bing.net/th?id=OIP.oKcZId5DFouIibIAadP3kgHaEK&pid=Api&P=0",
//   "https://tse1.mm.bing.net/th?id=OIP.L-ZtGf3nRjuLuOfP87F7ZgHaEK&pid=Api&P=0",
//   "https://tse1.mm.bing.net/th?id=OIP.E_btEM3dl7RJgXd6vDiyMgHaEK&pid=Api&P=0",
//   "https://tse2.mm.bing.net/th?id=OIP.a317ohqyOR_2wMEmas7rOAHaEK&pid=Api&P=0",
//   "https://tse4.mm.bing.net/th?id=OIP.tbtC9TeR7_LrKsGBqkB0ygHaEK&pid=Api&P=0",
//   "https://tse1.mm.bing.net/th?id=OIP.ScMo-IO5avSPFQ4RqaEO5AHaEK&pid=Api&P=0"
// ];


AudioPlayer myPlayer = AudioPlayer();

bool play = false;

class _MusicScreenState extends State<MusicScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
          title: Text('Songs'),
         
        ),
        body: Padding(
      padding: const EdgeInsets.all(12.0),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.9,
            // crossAxisSpacing: 0.2,
            // mainAxisExtent: 0.2,
            crossAxisSpacing: 18),
        shrinkWrap: true,
        itemCount: musics.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => FullMusicScreen(index: index,music :musics),));
            },
            child: Card(
                shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Center(
                      child: Image.asset(
                       musics[index].imageurl,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Text(musics[index].tital)
                  ],
                ),
                
                ),
          );
        },
      ),
    ));
  }
}
