import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:game_task/screens/homepage/homepage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) => runApp(const MyApp()),);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Archive Game',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
        bottomSheetTheme: const BottomSheetThemeData(
          surfaceTintColor: Colors.transparent, //
          backgroundColor: Colors.transparent, // what you want
        ),
      ),
      home: const HomePage(),
    );
  }
}

