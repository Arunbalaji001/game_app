import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:game_task/screens/animationpage/widgets/animated_coin_widget.dart';
import 'package:game_task/services/constants.dart';

class AnimationPageWidget extends StatefulWidget {
  const AnimationPageWidget({super.key});

  @override
  State<AnimationPageWidget> createState() => _AnimationPageWidgetState();
}

class _AnimationPageWidgetState extends State<AnimationPageWidget> with TickerProviderStateMixin {

  late AnimationController flipController;
  late AnimationController jumpController;
  late Animation<double> jumpAnimation;

  final double frameWidth = 102.0; 
  final double frameHeight = 124.0; 
  final int totalFrames = 27;
  final ValueNotifier<bool> showButton = ValueNotifier<bool>(true);



  @override
  void initState() {
    flipController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: (940).toInt()),
    );

    jumpController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 520),
    );

    jumpAnimation = Tween<double>(begin: 0.0, end: -480.0).animate(
      CurvedAnimation(parent: jumpController, curve: Curves.easeInOut),
    );
    super.initState();
  }


  void animateCoin(){
    jumpController.forward();
    flipController.reset();
    flipController.forward();
    jumpController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        jumpController.reverse();
      }
      if(jumpController.status == AnimationStatus.forward || jumpController.status == AnimationStatus.reverse){
        showButton.value=false;
      }
      else if(jumpController.status == AnimationStatus.dismissed){
        Future.delayed(Duration(seconds: 3),() {
          showButton.value=true;
        },);
      }
    });
    
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      color: GameConstants.bgColor,
      height: screenHeight,
      width: screenWidth,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: screenWidth,
            height: 96,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      'assets/home_page/appbar_bg.png',
                    ),
                    fit: BoxFit.fill
                )
            ),
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 9),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: ()=> Navigator.of(context).pop(),
                    child: Image.asset(
                      'assets/home_page/backbutton.png',
                      height: 28,
                    ),
                  ),
                  Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        height: 28,
                        child: Container(
                          width: 142,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/home_page/bar.png'
                                  )
                              )
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                'assets/home_page/coinicon.png',
                                height: 28,
                              ),
                              Container(
                                alignment: Alignment.center,
                                child: Text(
                                  '17010',
                                  style: Theme.of(context).textTheme.bodyMedium?.apply(
                                      color: Colors.white
                                  ),
                                ),
                              ),
                              Image.asset(
                                'assets/home_page/add.png',
                                height: 28,
                              )
                            ],
                          ),

                        ),
                      )),
                  Container(
                    height: 28,
                    width: 28,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withAlpha(96),
                    ),
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.settings,
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              // height: screenHeight,
              width: screenWidth,
              alignment: Alignment.center,
              // color: Colors.deepPurple,
              child: Stack(
                children: [
                  Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      height: 276,
                      child: Image.asset(
                        'assets/animation_page/slot.png',
                        width: screenWidth,
                        fit: BoxFit.fill,
                      )
                  ),
                  Positioned(
                      bottom: 164,
                      left: 0,
                      right: 0,
                      child: Container(
                          alignment: Alignment.center,
                          child: AnimatedCoinWidget(
                            flipController: flipController,
                            jumpAnimation: jumpAnimation,
                            jumpController: jumpController,
                          )
                      )
                  ),
                  Positioned(
                    bottom: 154,
                    left: 0,
                    right: 0,
                    child:  ValueListenableBuilder(
                        valueListenable: showButton,
                        builder: (context, value, child) {
                          if(value){
                            return GestureDetector(
                              onTap: () {
                                animateCoin();
                              },
                              child: Image.asset(
                                'assets/home_page/coinicon.png',
                                height:118,
                                width: 96,

                              ),
                            );
                          }
                          else{
                            return SizedBox();
                          }
                        }
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
    return Scaffold(
      backgroundColor: GameConstants.bgColor,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(96),
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      'assets/home_page/appbar_bg.png',
                    ),
                    fit: BoxFit.cover
                )
            ),
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 9),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: ()=> Navigator.of(context).pop(),
                    child: Image.asset(
                      'assets/home_page/backbutton.png',
                      height: 28,
                    ),
                  ),
                  Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        height: 28,
                        child: Container(
                          width: 142,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/home_page/bar.png'
                                  )
                              )
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                'assets/home_page/coinicon.png',
                                height: 28,
                              ),
                              Container(
                                alignment: Alignment.center,
                                child: Text(
                                  '17010',
                                  style: Theme.of(context).textTheme.bodyMedium?.apply(
                                      color: Colors.white
                                  ),
                                ),
                              ),
                              Image.asset(
                                'assets/home_page/add.png',
                                height: 28,
                              )
                            ],
                          ),

                        ),
                      )),
                  Container(
                    height: 28,
                    width: 28,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withAlpha(96),
                    ),
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.settings,
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
                ],
              ),
            ),
          )),
      body: Container(
        height: screenHeight,
      width: screenWidth,
      alignment: Alignment.center,
        child: Stack(
          children: [

            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                height: 276,
                child: Image.asset(
                  'assets/animation_page/slot.png',
                  width: screenWidth,
                  fit: BoxFit.fill,
                )
            ),
            Positioned(
                bottom: 164,
                left: 0,
                right: 0,
                child: Container(
                    alignment: Alignment.center,
                    child: AnimatedCoinWidget(
                      flipController: flipController,
                      jumpAnimation: jumpAnimation,
                      jumpController: jumpController,
                    )
                )
            ),
            Positioned(
              bottom: 154,
              left: 0,
              right: 0,
              child:  ValueListenableBuilder(
                valueListenable: showButton,
                builder: (context, value, child) {
                  if(value){
                  return InkWell(
                    onTap: () {
                     animateCoin();
                    },
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    child: Image.asset(
                      'assets/home_page/coinicon.png',
                      height:118,
                      width: 96,

                    ),
                  );
                }
                  else{
                    return SizedBox();
                  }
    }
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    jumpController.dispose();
    flipController.dispose();
    super.dispose();
  }
}
