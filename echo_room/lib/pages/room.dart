// ignore_for_file: camel_case_types, prefer_const_constructors, use_key_in_widget_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, prefer_final_fields, unused_field, deprecated_member_use, avoid_print, sized_box_for_whitespace, unused_import, import_of_legacy_library_into_null_safe

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'dart:async';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter/cupertino.dart';

class room extends StatefulWidget {
  final String name;
  final String img;
  final String music;
  const room({
    Key? key,
    required this.name,
    required this.img,
    required this.music,
  }) : super(key: key);

  @override
  State<room> createState() => _roomState();
}

class _roomState extends State<room> with TickerProviderStateMixin {
  bool _play = true;
  late Timer _timer;
  int _start = 100;
  // late CountdownTimerController controller;
  late AnimationController controller1;
  bool isPlaying = false;

  String get countText {
    Duration count = controller1.duration! * controller1.value;
    return controller1.isDismissed
        ? '${controller1.duration!.inHours}:${(controller1.duration!.inMinutes % 60).toString().padLeft(2, '0')}:${(controller1.duration!.inSeconds % 60).toString().padLeft(2, '0')}'
        : '${count.inHours}:${(count.inMinutes % 60).toString().padLeft(2, '0')}:${(count.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  double progress = 1.0;
  void notify() {
    if (countText == '0:00:00') {
      _play = false;
    }
  }

  @override
  void initState() {
    super.initState();
    controller1 = AnimationController(
      vsync: this,
      duration: Duration(seconds: 60),
    );

    controller1.addListener(() {
      notify();
      if (controller1.isAnimating) {
        setState(() {
          progress = controller1.value;
        });
      } else {
        setState(() {
          progress = 1.0;
          isPlaying = false;
        });
      }
    });
  }

  void onEnd() {
    _play = false;
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
      ),
      body: Container(
        // padding: EdgeInsets.all(
        //   10,
        // ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              child: Image.asset(
                widget.img,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              color: Colors.black.withOpacity(0.8),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        width: 300,
                        height: 300,
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.grey.shade300,
                          value: progress,
                          strokeWidth: 6,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // controller1.isDismissed
                          if (true) {
                            showModalBottomSheet(
                              context: context,
                              builder: (context) => Container(
                                height: 300,
                                child: CupertinoTimerPicker(
                                  initialTimerDuration: controller1.duration!,
                                  onTimerDurationChanged: (time) {
                                    setState(() {
                                      controller1.duration = time;
                                    });
                                  },
                                ),
                              ),
                            );
                          }
                        },
                        child: AnimatedBuilder(
                          animation: controller1,
                          builder: (context, child) => Text(
                            countText,
                            style: TextStyle(
                              fontSize: 60,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (controller1.isAnimating) {
                            controller1.stop();
                            setState(() {
                              isPlaying = false;
                              _play = false;
                            });
                          } else {
                            controller1.reverse(
                                from: controller1.value == 0
                                    ? 1.0
                                    : controller1.value);
                            setState(() {
                              isPlaying = true;
                              _play = true;
                            });
                          }
                        },
                        child: isPlaying
                            ? Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(40),
                                  ),
                                  border: Border.all(
                                    width: 3,
                                    color: Colors.cyan,
                                    style: BorderStyle.solid,
                                  ),
                                ),
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  "Pause Timer",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            : Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(40),
                                  ),
                                  border: Border.all(
                                    width: 3,
                                    color: Colors.cyan,
                                    style: BorderStyle.solid,
                                  ),
                                ),
                                padding: EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: 20,
                                ),
                                child: Text(
                                  "Start Timer",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: AudioWidget.assets(
                    play: _play,
                    loopMode: LoopMode.single,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(24),
                      ),
                      child: Icon(
                        _play ? Icons.pause : Icons.play_arrow,
                        size: 50,
                      ),
                      onPressed: () {
                        setState(
                          () {
                            _play = !_play;
                          },
                        );
                      },
                    ),
                    path: widget.music,
                  ),
                ),
                SizedBox(
                  height: 10,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
