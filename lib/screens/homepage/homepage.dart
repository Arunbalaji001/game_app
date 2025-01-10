import 'package:flutter/material.dart';
import 'package:game_task/screens/animationpage/animationpage_widget.dart';
import 'package:game_task/screens/homepage/widgets/action_button_widget.dart';
import 'package:game_task/screens/homepage/widgets/dpad_widget.dart';
import 'package:game_task/services/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Container(
        height: screenHeight,
        width: screenWidth,
        decoration: BoxDecoration(
            gradient: RadialGradient(
              colors: [
                GameConstants.gradColor1,
                GameConstants.gradColor2,
                GameConstants.gradColor3,
                GameConstants.gradColor4,
                GameConstants.bgColor
              ],
              center: Alignment.center,
              stops: [
                0.1,0.24,0.64,0.96,1
              ],
              // radius: 0.6,
            )
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                // color: Colors.pink,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 9),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'assets/home_page/backbutton.png',
                      height: 28,
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
                                  // color: Colors.black,
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
            Container(
              margin: EdgeInsets.only(top: 32),
              width: screenWidth,
              alignment: Alignment.topCenter,
              child: GestureDetector(
                onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context) => AnimationPageWidget(),)),
                child: Container(
                  width: 176,
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade600,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Row(
                    children: [
                      Text(
                        'View Animation',
                        style: Theme.of(context).textTheme.bodyMedium?.apply(
                            fontWeightDelta: 2,
                            color: Colors.white
                        ),
                      ),
                      const SizedBox(width: 8,),
                      Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                        size: 18,
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: screenHeight*0.36,
              width: double.infinity,
              // alignment: Alignment.center,
              // decoration: BoxDecoration(
              //     image: DecorationImage(image:  AssetImage(
              //         'assets/home_page/control_frame.png'
              //     ),
              //         fit: BoxFit.fill
              //     ),
              //     // color: Colors.deepPurple
              // ),
              // color: Colors.blue.shade100,
              child: Column(
                children: [
                  Container(
                    width: screenWidth,
                    height: 42,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                          image: DecorationImage(image:  AssetImage(
                              'assets/home_page/pull_tab.png'
                          ),
                              fit: BoxFit.fill
                          ),
                          // color: Colors.deepPurple
                      ),
                    child: Text(
                      '00:34',
                      style: Theme.of(context).textTheme.bodyMedium?.apply(color: Colors.white),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(image:  AssetImage(
                            'assets/home_page/bottomsheet_bg.png'
                        ),
                            fit: BoxFit.fill
                        ),
                        // color: Colors.deepPurple
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Flexible(
                            flex: 6,
                            fit: FlexFit.tight,
                            child: Container(
                              // width: 240,
                              alignment: Alignment.center,
                              child: DpadWidget(),
                            ),
                          ),
                          Flexible(
                              flex: 4,
                              fit: FlexFit.tight,
                              child: Container(
                                  alignment: Alignment.center,
                                  child: ActionButtonWidget()
                              )
                          ),
      
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );

  }
}







//old screen
//    return Scaffold(
//       backgroundColor: GameConstants.bgColor,
//       appBar: PreferredSize(
//           preferredSize: Size.fromHeight(96),
//           child: Container(
//             decoration: BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage(
//                   'assets/home_page/appbar_bg.png',
//                 ),
//                 fit: BoxFit.cover
//               )
//             ),
//             alignment: Alignment.bottomCenter,
//             child: Container(
//               // color: Colors.pink,
//               padding: EdgeInsets.symmetric(horizontal: 16, vertical: 9),
//               child: Row(
//                 mainAxisSize: MainAxisSize.max,
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Image.asset(
//                     'assets/home_page/backbutton.png',
//                     height: 28,
//                   ),
//                   Expanded(
//                       child: Container(
//                         alignment: Alignment.center,
//                         height: 28,
//                         child: Container(
//                           width: 142,
//                           decoration: BoxDecoration(
//                             image: DecorationImage(
//                               image: AssetImage(
//                                 'assets/home_page/bar.png'
//                               )
//                             )
//                           ),
//                           child: Row(
//                             mainAxisSize: MainAxisSize.max,
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Image.asset(
//                                 'assets/home_page/coinicon.png',
//                                 height: 28,
//                               ),
//                               Container(
//                                 // color: Colors.black,
//                                 alignment: Alignment.center,
//                                 child: Text(
//                                   '17010',
//                                   style: Theme.of(context).textTheme.bodyMedium?.apply(
//                                     color: Colors.white
//                                   ),
//                                 ),
//                               ),
//                               Image.asset(
//                                 'assets/home_page/add.png',
//                                 height: 28,
//                               )
//                             ],
//                           ),
//
//                         ),
//                       )),
//                   Container(
//                     height: 28,
//                     width: 28,
//                     decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       color: Colors.white.withAlpha(96),
//                     ),
//                     alignment: Alignment.center,
//                     child: Icon(
//                       Icons.settings,
//                       color: Colors.white,
//                       size: 16,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           )),
//       body: Container(
//         height: screenHeight,
//         width: screenWidth,
//         decoration: BoxDecoration(
//           gradient: RadialGradient(
//               colors: [
//                 GameConstants.gradColor1,
//                 GameConstants.gradColor2,
//                 GameConstants.gradColor3,
//                 GameConstants.gradColor4,
//                 GameConstants.bgColor
//               ],
//             center: Alignment.center,
//             stops: [
//               0.1,0.24,0.64,0.96,1
//             ],
//             // radius: 0.6,
//           )
//         ),
//       child: Container(
//         margin: EdgeInsets.only(top: 32),
//         width: screenWidth,
//         alignment: Alignment.topCenter,
//         child: InkWell(
//           onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context) => AnimationPageWidget(),)),
//           child: Container(
//             width: 176,
//             padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
//             decoration: BoxDecoration(
//               color: Colors.blue.shade600,
//               borderRadius: BorderRadius.circular(4),
//             ),
//             child: Row(
//              children: [
//                Text(
//                    'View Animation',
//                  style: Theme.of(context).textTheme.bodyMedium?.apply(
//                    fontWeightDelta: 2,
//                    color: Colors.white
//                  ),
//                ),
//                const SizedBox(width: 8,),
//                Icon(
//                  Icons.arrow_forward,
//                  color: Colors.white,
//                  size: 18,
//                )
//              ],
//             ),
//           ),
//         ),
//       ),
//       ),
//       bottomSheet: BottomSheet(
//         onClosing: () {
//
//         },
//         builder: (context) {
//           return Container(
//             height: screenHeight*0.36,
//             width: double.infinity,
//             // alignment: Alignment.center,
//             decoration: BoxDecoration(
//                 image: DecorationImage(image:  AssetImage(
//                     'assets/home_page/control_frame.png'
//                 ),
//                     fit: BoxFit.cover
//                 ),
//                 color: Colors.deepPurple
//             ),
//             child: Column(
//               children: [
//                 Container(
//                   width: screenWidth,
//                   height: 42,
//                   alignment: Alignment.center,
//                   child: Text(
//                     '00:34',
//                     style: Theme.of(context).textTheme.bodyMedium?.apply(color: Colors.white),
//                   ),
//                 ),
//                 Expanded(
//                   child: Container(
//                     child: Row(
//                       mainAxisSize: MainAxisSize.max,
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Flexible(
//                           flex: 6,
//                           fit: FlexFit.tight,
//                           child: Container(
//                             // width: 240,
//                             alignment: Alignment.center,
//                             child: DpadWidget(),
//                           ),
//                         ),
//                         Flexible(
//                             flex: 4,
//                             fit: FlexFit.tight,
//                             child: Container(
//                               alignment: Alignment.center,
//                                 child: ActionButtonWidget()
//                             )
//                         ),
//
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           );
//         }
//       ),
//     );