import 'package:flutter/material.dart';
import 'package:movie_review_app/screens/home_screen.dart';
import 'package:movie_review_app/screens/search_screen.dart';
import 'package:movie_review_app/widgets/bottom_navbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
     initialRoute:  BottomNavbar.id,
     routes: {
        HomeScreen.id : (context) => HomeScreen(),
       BottomNavbar.id : (context) => BottomNavbar(),
      SearchScreen.id : (context) => SearchScreen(),

     }
    );
  }
}
