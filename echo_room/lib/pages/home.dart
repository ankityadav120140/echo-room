// ignore_for_file: camel_case_types, prefer_const_constructors, avoid_unnecessary_containers

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:echo_room/pages/room.dart';
import 'package:echo_room/widgets/window.dart';
import 'package:flutter/material.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  String name = '';
  var color = Colors.black;
  var img = "assets/images/chill.jpg";
  var music = "assets/images/chill.mp3";
  final assetsAudioPlayer = AssetsAudioPlayer();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Echo Room",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(),
          padding: const EdgeInsets.all(
            10,
          ),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => room(
                        name: "Beat",
                        img: "assets/images/beat.jpg",
                        music: "assets/audios/rap_beat.mp3",
                      ),
                    ),
                  );
                },
                child: new_card(
                  "Beat",
                  Colors.black,
                  "assets/images/beat.jpg",
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => room(
                        name: "Chill",
                        img: "assets/images/chill.jpg",
                        music: "assets/audios/chill.mp3",
                      ),
                    ),
                  );
                },
                child: new_card(
                  "Chill",
                  Colors.black,
                  "assets/images/chill.jpg",
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => room(
                        name: "Flute",
                        img: "assets/images/flute.jpg",
                        music: "assets/audios/flute.mp3",
                      ),
                    ),
                  );
                },
                child: new_card(
                  "Flute",
                  Colors.black,
                  "assets/images/flute.jpg",
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => room(
                        name: "Focus",
                        img: "assets/images/focus.jpg",
                        music: "assets/audios/focus.mp3",
                      ),
                    ),
                  );
                },
                child: new_card(
                  "Focus",
                  Colors.black,
                  "assets/images/focus.jpg",
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => room(
                        name: "Meditaion",
                        img: "assets/images/meditation.jpg",
                        music: "assets/audios/meditation.mp3",
                      ),
                    ),
                  );
                },
                child: new_card(
                  "Meditation",
                  Colors.black,
                  "assets/images/meditation.jpg",
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => room(
                        name: "Om",
                        img: "assets/images/om.gif",
                        music: "assets/audios/om.mp3",
                      ),
                    ),
                  );
                },
                child: new_card(
                  "Om",
                  Colors.black,
                  "assets/images/om.gif",
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => room(
                        name: "Rain",
                        img: "assets/images/rain.jpg",
                        music: "assets/audios/rain.mp3",
                      ),
                    ),
                  );
                },
                child: new_card(
                  "Rain",
                  Colors.black,
                  "assets/images/rain.jpg",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
