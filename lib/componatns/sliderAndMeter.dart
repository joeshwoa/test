import 'package:controler/componatns/onOffButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class SliderAndMeter extends StatefulWidget {
  SliderAndMeter({Key? key,required this.name}) : super(key: key);
  String name;
  bool isTapped=true;
  @override
  State<SliderAndMeter> createState() => _SliderAndMeterState();
}

class _SliderAndMeterState extends State<SliderAndMeter> with TickerProviderStateMixin{
  double slider_value=0;
  double meter_value=0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 250,
          height: 250,
          child: SfRadialGauge(axes: <RadialAxis>[
            RadialAxis(
                minimum: 0,
                maximum: 100,
                labelOffset: 40,
                startAngle: 180,
                endAngle: 270,
                axisLineStyle: AxisLineStyle(
                    thicknessUnit: GaugeSizeUnit.factor, thickness: 0.03),
                majorTickStyle:
                MajorTickStyle(length: 6, thickness: 4, color: Colors.black),
                minorTickStyle:
                MinorTickStyle(length: 3, thickness: 3, color: Colors.black),
                axisLabelStyle: GaugeTextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14),
                ranges: <GaugeRange>[
                  GaugeRange(
                      startValue: 0,
                      endValue: 100,
                      sizeUnit: GaugeSizeUnit.factor,
                      startWidth: 0.00,
                      endWidth: 0.1,
                      gradient: SweepGradient(colors: const <Color>[
                        Colors.green,
                        Colors.yellow,
                        Colors.red
                      ], stops: const <double>[
                        0.0,
                        0.5,
                        1
                      ]))
                ],
                pointers: <GaugePointer>[
                  NeedlePointer(
                      value: meter_value,
                      needleLength: 0.95,
                      enableAnimation: true,
                      animationType: AnimationType.ease,
                      needleStartWidth: 1.5,
                      needleEndWidth: 6,
                      needleColor: Colors.red,
                      knobStyle: KnobStyle(knobRadius: 0.09))
                ],
                annotations: <GaugeAnnotation>[
                  GaugeAnnotation(
                      widget: Container(
                          child: Column(children: <Widget>[
                            Text(meter_value.toInt().toString(),
                                style:
                                TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                            SizedBox(height: 20),
                            Text('${widget.name}',
                                style:
                                TextStyle(fontSize: 14, fontWeight: FontWeight.bold))
                          ])),
                      angle: 90,
                      positionFactor: 0.75)
                ])
          ]),
        ),
        /*Container(
          height: 300,
          width: 50,
          child: SfSlider.vertical(
            min: 0.0,
            max: 100.0,
            value: slider_value.toInt(),
            interval: 20,
            showTicks: true,
            showLabels: true,
            enableTooltip: true,
            minorTicksPerInterval: 1,
            onChanged: (dynamic value) {
              setState(() {
                if(onOffButton(name: '',).isTapped)
                  {
                    slider_value=value;
                    meter_value=value;
                  }
                else
                  {
                    slider_value=value;
                    meter_value=0;
                  }
              });

            },
          ),
        ),
        Container(
          width: 100,
          height: 50,
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
        )*/
      ],
    );
  }
}
