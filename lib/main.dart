import 'package:clima/screens/city_screen.dart';
import 'package:flutter/material.dart';
import 'package:clima/screens/loading_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => LoadingScreen(),
        '/first': (context) => CityScreen(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      // home: LoadingScreen(),
    );
  }
}
