import 'package:flutter/foundation.dart';
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

  final ValueNotifier<bool> isButtonPressed = ValueNotifier<bool>(false);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24,right: 12),
      child: AspectRatio(
        aspectRatio: 0.86,
        child: LayoutBuilder(
          builder: (context, constraints) {
            double maxWidth = constraints.maxWidth;
            double maxHeight = constraints.maxHeight;
            double widthUnit= maxWidth/100;
            double heightUnit= maxHeight/100;

            return Container(
              alignment: Alignment.center,
              // color: Colors.lightGreenAccent,
              child: GestureDetector(
                onTapDown: (details) {
                  isButtonPressed.value=true;
                },
                onTapUp: (details) {
                  isButtonPressed.value=false;

                },
                onTapCancel: () {
                  isButtonPressed.value=false;
                },
                child: AnimatedBuilder(
                  animation: isButtonPressed,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: isButtonPressed.value?0.96:1,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Positioned(
                            bottom: 0,
                              child: Image.asset(
                                'assets/home_page/action_button/redButton_Shadow.png',
                                height: maxHeight-16,
                                width: maxWidth,
                                // width: maxWidth*114,
                              )
                          ),
                          Positioned(
                              bottom: 8,
                              child: Image.asset(
                                isButtonPressed.value?
                                'assets/home_page/action_button/redButton_Depth_Pressed.png':
                                'assets/home_page/action_button/redButton_Depth.png',
                                height: maxHeight-16,
                                width: maxWidth,
                              )
                          ),
                        Positioned(
                          bottom: 18,
                          child:Container(
                            width: maxWidth,
                            height: maxHeight-16,
                            alignment: Alignment.topCenter,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: AssetImage(
                                      isButtonPressed.value?
                                      'assets/home_page/action_button/redButton_Top_Pressed.png':
                                    'assets/home_page/action_button/redButton_Top.png'
                                  )
                              )
                            ),
                            padding: EdgeInsets.only(top: 4),
                            // padding: EdgeInsets.all(8),
                            child: Image.asset(
                              isButtonPressed.value?
                              'assets/home_page/action_button/redButton_Icon_Pressed.png':
                              'assets/home_page/action_button/redButton_Icon.png',
                              height:  maxHeight-36,
                              width: maxWidth-36,
                            ),
                          )),
                        ],
                      ),
                    );
                  }
                ),
              ),
            );
          }
        ),
      ),
    );
  }
}
