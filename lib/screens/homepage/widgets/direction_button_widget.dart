import 'package:flutter/material.dart';

enum ButtonDirection{left,right,up,down}

class DirectionButtonWidget extends StatefulWidget {

  const DirectionButtonWidget({
    super.key,
    required this.buttonDirection
  });

  final ButtonDirection buttonDirection;

  @override
  State<DirectionButtonWidget> createState() => _DirectionButtonWidgetState();
}

class _DirectionButtonWidgetState extends State<DirectionButtonWidget> {

  bool isButtonPressed = false;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) {
        setState(() {
          if(!isButtonPressed) {
            isButtonPressed = true;
          }
        });
      },
      onTapUp: (details) {
        setState(() {
          if(isButtonPressed) {
            isButtonPressed = false;
          }
        });
      },
      onTapCancel: () {
        setState(() {
          if(isButtonPressed) {
            isButtonPressed = false;
          }
        });
      },
      child: Container(
        width: 64,
        height: 76,
        // color: Colors.blue,
        child: Stack(
          children: [
            Positioned(
                bottom: 0,
                child:Image.asset(
                  'assets/home_page/arrow_button/button_Shadow.png',
                  height: 64,
                  width: 64,
                )
            ),
            Positioned(
                bottom: 4,
                child:Image.asset(
                  isButtonPressed?
                  'assets/home_page/arrow_button/button_Depth_Pressed.png':
                  'assets/home_page/arrow_button/button_Depth.png',
                  height: 64,
                  width: 64,
                )
            ),
            Positioned(
                bottom: 10,
                child:
                Container(
                    width: 64,
                    height: 64,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        // shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage(
                                isButtonPressed?
                                'assets/home_page/arrow_button/button_Top_Pressed.png':
                                'assets/home_page/arrow_button/button_Top.png'
                            )
                        )
                    ),
                    // padding: EdgeInsets.all(8),

                    child: Transform.rotate(
                      angle: switch(widget.buttonDirection){
                        ButtonDirection.left => -90 * 3.141592653589793 / 180,
                        ButtonDirection.right => 90 * 3.141592653589793 / 180,
                        ButtonDirection.up =>   0,
                        ButtonDirection.down => 180 * 3.141592653589793 / 180,
                      },
                      child: Image.asset(
                        isButtonPressed?
                        'assets/home_page/arrow_button/button_Arrow_Pressed.png':
                        'assets/home_page/arrow_button/button_Arrow.png',
                        height: 36,
                        width: 36,

                      ),
                    )),

            ),
          ],
        ),

      ),
    );
  }
}
