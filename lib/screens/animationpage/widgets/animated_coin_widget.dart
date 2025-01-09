import 'package:flutter/material.dart';

class AnimatedCoinWidget extends StatefulWidget {
  const AnimatedCoinWidget({
    super.key,
    required this.flipController,
    required this.jumpAnimation,
    required this.jumpController
  });

  final AnimationController flipController;
  final AnimationController jumpController;
  final Animation<double> jumpAnimation;

  @override
  State<AnimatedCoinWidget> createState() => _AnimatedCoinWidgetState();
}

class _AnimatedCoinWidgetState extends State<AnimatedCoinWidget> with TickerProviderStateMixin{



  final double frameWidth = 102.0;
  final double frameHeight = 124.0;
  final int totalFrames = 27;
  bool isCompleted = true;

  @override
  void initState() {


      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        widget.jumpController.addStatusListener((status) {
          if(status == AnimationStatus.forward || status == AnimationStatus.reverse){
            setState(() => isCompleted=false);
          }
          else if(status == AnimationStatus.dismissed){
            setState(() => isCompleted=true);
          }
        });
        });


    super.initState();


  }





  @override
  Widget build(BuildContext context) {
    return Container(

      child: LayoutBuilder(
        builder: (context, constraints) {
          return isCompleted?SizedBox(
            width: 0,
            height: 0,
          ):SizedBox(
            width: 102,
            height: 124,
            child: AnimatedBuilder(
              animation: Listenable.merge([widget.flipController, widget.jumpAnimation]),
              builder: (context, child) {
                final int currentFrame = (widget.flipController.value * totalFrames).floor();

                return Transform.translate(
                  offset: Offset(0, widget.jumpAnimation.value),
                  child: ClipRect(
                    child: Stack(
                      children: [
                        Positioned(
                          left: -currentFrame * frameWidth,
                          child: Image.asset(
                            'assets/animation_page/coin_anim.png',
                            width: totalFrames * frameWidth,
                            height: frameHeight,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        }
      ),
    );
  }
}
