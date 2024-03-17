import 'package:controler/componatns/sliderAndMeter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class onOffButton extends StatefulWidget {
  onOffButton({Key? key,required this.name}) : super(key: key);
  String name;
  bool isTapped=true;
  @override
  _onOffButtonState createState() => _onOffButtonState();
}

class _onOffButtonState extends State<onOffButton>
    with TickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () {
            setState(
                  () {
                widget.isTapped = !widget.isTapped;
                HapticFeedback.lightImpact();
                SliderAndMeter(name: '',);
              },
            );
          },
          child: AnimatedContainer(
            duration: Duration(milliseconds: 300),
            curve: Curves.fastLinearToSlowEaseIn,
            height: widget.isTapped ? 64 : 67,
            width: widget.isTapped ? 190 : 200,
            decoration: BoxDecoration(
              color: widget.isTapped ? Color(0xffB23F3F) : Color(0xffFF4E4E),
              borderRadius: BorderRadius.all(Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(widget.isTapped ? 0 : 0.3),
                  blurRadius: widget.isTapped ? 0 : 10,
                  offset: Offset(0, 7),
                ),
              ],
            ),
            child: Center(
              child: Text(
                widget.isTapped ? widget.name+' OFF' : widget.name+' ON',
                style: TextStyle(
                  color: widget.isTapped
                      ? Colors.white.withOpacity(0.5)
                      : Colors.white.withOpacity(0.9),
                  fontWeight: FontWeight.w600,
                  fontSize: 19,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}