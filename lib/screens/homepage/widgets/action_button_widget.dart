import 'package:flutter/material.dart';

class ActionButtonWidget extends StatefulWidget {
  const ActionButtonWidget({
    super.key,
  });

  @override
  State<ActionButtonWidget> createState() => _ActionButtonWidgetState();
}

class _ActionButtonWidgetState extends State<ActionButtonWidget> {

  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) {
        setState(() {
          if(!isPressed) {
            isPressed = true;
          }
        });
      },
      onTapUp: (details) {
        setState(() {
        if(isPressed) {
          isPressed = false;
        }
        });
      },
      onTapCancel: () {
        setState(() {
          if(isPressed) {
            isPressed = false;
          }
        });
      },
      child: SizedBox(
        width: 114,
        height: 132,
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
                child: isPressed? Container():Image.asset(
                  'assets/home_page/action_button/redButton_Shadow.png',
                  height: 114,
                  width: 114,
                )
            ),
            Positioned(
                bottom: isPressed?12:9,
                child: Image.asset(
                  isPressed?
                  'assets/home_page/action_button/redButton_Depth_Pressed.png':
                  'assets/home_page/action_button/redButton_Depth.png',
                  height: 114,
                  width: 114,
                )
            ),
          Positioned(
            bottom: 18,
            child:Container(
              width: 114,
              height: 114,
              alignment: Alignment.topCenter,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage(
                        isPressed?
                        'assets/home_page/action_button/redButton_Top_Pressed.png':
                      'assets/home_page/action_button/redButton_Top.png'
                    )
                )
              ),
              // padding: EdgeInsets.all(8),
              child: Image.asset(
                isPressed?
                'assets/home_page/action_button/redButton_Icon_Pressed.png':
                'assets/home_page/action_button/redButton_Icon.png',
                height: 96,
                width: 96,
              ),
            )),
          ],
        ),
      ),
    );
  }
}
