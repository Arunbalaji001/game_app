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
      width: 184,
      height: 240,
      // color: Colors.green,
      child: Stack(
        children: [
          Positioned(
            top: 0,
              left: 60,
              child: DirectionButtonWidget(
                buttonDirection: ButtonDirection.up,
              )),

          Positioned(
            top: 72,
              left: 0,
              right: 0,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DirectionButtonWidget(
                    buttonDirection: ButtonDirection.left,
                  ),
                  DirectionButtonWidget(
                    buttonDirection: ButtonDirection.right,
                  )
                ],
              )),

          Positioned(
              top: 144,
              left: 60,
              child: DirectionButtonWidget(
                buttonDirection: ButtonDirection.down,
              )),
        ],
      ),
    );
  }
}
