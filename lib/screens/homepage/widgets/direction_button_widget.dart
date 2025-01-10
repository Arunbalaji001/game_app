import 'package:flutter/material.dart';

enum ButtonDirection{left,right,up,down}

class DirectionButtonWidget extends StatefulWidget {

  const DirectionButtonWidget({
    super.key,
    required this.buttonDirection,
    required this.containerWidth,
    required this.containerHeight
  });

  final ButtonDirection buttonDirection;
  final double containerHeight;
  final double containerWidth;


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
        width: widget.containerWidth,
        height: widget.containerHeight,
        // color: Colors.blue,
        child: AnimatedScale(
          duration: Duration(milliseconds: 100),
          scale: isButtonPressed?0.94:1,
          child: Stack(
            children: [
              Positioned(
                  bottom: 0,
                  child:Image.asset(
                    'assets/home_page/arrow_button/button_Shadow.png',
                    height: widget.containerHeight-10,
                    width: widget.containerWidth,
                  )
              ),
              Positioned(
                  bottom: 4,
                  child:Image.asset(
                    isButtonPressed?
                    'assets/home_page/arrow_button/button_Depth_Pressed.png':
                    'assets/home_page/arrow_button/button_Depth.png',
                    height: widget.containerHeight-10,
                    width: widget.containerWidth,
                  )
              ),
              Positioned(
                  bottom: 10,
                  child:
                  Container(
                      height: widget.containerHeight-10,
                      width: widget.containerWidth,
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
                          height: widget.containerHeight-10-28,
                          width: widget.containerWidth-28,
                          // fit: BoxFit.fitWidth,

                        ),
                      )),

              ),
            ],
          ),
        ),

      ),
    );
  }
}
