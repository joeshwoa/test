import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'dart:math';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);
  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  double xstart1 = 0.0;
  double ystart1 = 0.0;
  double xend1 = 0.0;
  double yend1 = 0.0;
  double speed1 = 0.0;
  var lastT1=0;
  var now1=0;
  bool f=true;

  /*double xstart2 = 0.0;
  double ystart2 = 0.0;
  double xend2 = 0.0;
  double yend2 = 0.0;
  double speed2 = 0.0;
  var lastT2;
  var now2;*/
  void _updateLocation(PointerEvent details) {
    setState(() {
      if(f)
        {
          lastT1 = DateTime.now().millisecond;
          xstart1 = details.position.dx;
          ystart1 = details.position.dy;
          f=false;
        }
      now1 = DateTime.now().millisecond;
      xend1 = details.position.dx;
      yend1 = details.position.dy;
      speed1 = sqrt(((xend1 - xstart1) * (xend1 - xstart1) +
              (yend1 - ystart1) * (yend1 - ystart1))) /
          (now1 - lastT1);
      lastT1 = now1;
      xstart1 = xend1;
      ystart1 = yend1;
      /*now2 = DateTime.now().millisecond;
      xend2 = details.position.dx;
      yend2 = details.position.dy;
      speed2 = sqrt(((xend2 - xstart2) * (xend2 - xstart2) +
              (yend2 - ystart2) * (yend2 - ystart2))) /
          (now2 - lastT2);
      lastT2 = now2;
      xstart2 = xend2;
      ystart2 = yend2;*/
    });
  }

  void start(PointerEvent details) {
    lastT1 = DateTime.now().millisecond;
    xstart1 = details.position.dx;
    ystart1 = details.position.dy;
    /*lastT2 = DateTime.now().millisecond;
    xstart2 = details.position.dx;
    ystart2 = details.position.dy;*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ConstrainedBox(
        constraints: BoxConstraints.tight(
            const Size(double.maxFinite, double.maxFinite)),
        child: GestureDetector(
          child: MouseRegion(
            onHover: _updateLocation,
            child: Container(
              color: Colors.lightBlueAccent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'The cursor is here: (${xend1.toStringAsFixed(2)}, ${yend1.toStringAsFixed(2)})\n Speed: ${speed1.toStringAsFixed(2)}',
                  ),
                  /*Text(
                    'The cursor is here: (${xend2.toStringAsFixed(2)}, ${yend2.toStringAsFixed(2)})\n Speed: ${speed2.toStringAsFixed(2)}',
                  ),*/
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
