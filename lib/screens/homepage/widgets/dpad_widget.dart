import 'package:flutter/material.dart';
import 'package:game_task/screens/homepage/widgets/direction_button_widget.dart';

class DpadWidget extends StatefulWidget{
  const DpadWidget({super.key});

  @override
  State<DpadWidget> createState() => _DpadWidgetState();
}

class _DpadWidgetState extends State<DpadWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(top: 30, bottom: 24),
    child: AspectRatio(
        aspectRatio: 0.76,
        child: LayoutBuilder(
          builder: (context, constraints) {
            double maxWidth = constraints.maxWidth;
            double maxHeight = constraints.maxHeight;
            double containerWidth = maxWidth/3;
            double containerHeight = maxHeight/3;
            return Container(
              // margin: EdgeInsets.only(top: 30, bottom: 24),
              // width: 184,
              // height: 240,
              // color: Colors.green,
              alignment: Alignment.center,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Positioned.fill(child: Container(color: Colors.lightGreenAccent,)),
                  Positioned(
                    top: (containerHeight/100)*12,
                      left: containerWidth,
                      child: DirectionButtonWidget(
                        buttonDirection: ButtonDirection.up,
                        containerHeight: containerHeight,
                        containerWidth: containerWidth,
                      )),

                  Positioned(
                    top: containerHeight-4,
                      left: 0,
                      right: 0,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          DirectionButtonWidget(
                            buttonDirection: ButtonDirection.left,
                            containerHeight: containerHeight,
                            containerWidth: containerWidth,
                          ),
                          DirectionButtonWidget(
                            buttonDirection: ButtonDirection.right,
                            containerHeight: containerHeight,
                            containerWidth: containerWidth,
                          )
                        ],
                      )),
                  //
                  Positioned(
                      top: (containerHeight*2)-12,
                      left: containerWidth,
                      child: DirectionButtonWidget(
                        buttonDirection: ButtonDirection.down,
                        containerHeight: containerHeight,
                        containerWidth: containerWidth,
                      )),
                ],
              ),
            );
          }
        ),
      ),
    );
  }
}
