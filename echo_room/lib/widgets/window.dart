// ignore_for_file: non_constant_identifier_names, avoid_unnecessary_containers, prefer_const_constructors, sized_box_for_whitespace, unnecessary_new, deprecated_member_use, unused_import

import 'dart:ui';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:echo_room/pages/room.dart';
import 'package:flutter/material.dart';

Widget new_card(String name, var color, var img) {
  return Container(
    decoration: BoxDecoration(
      border: Border.all(
        width: 2,
        color: color,
      ),
      // borderRadius: BorderRadius.circular(20),
    ),
    margin: EdgeInsets.symmetric(vertical: 10),
    child: SizedBox(
      height: 100,
      child: Stack(
        fit: StackFit.expand,
        overflow: Overflow.clip,
        children: [
          ClipRect(
            child: Container(child: Image.asset(img, fit: BoxFit.cover)),
          ),
          ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
              child: Container(
                color: Colors.transparent.withOpacity(0.5),
                alignment: Alignment.center,
                child: Text(
                  name,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
