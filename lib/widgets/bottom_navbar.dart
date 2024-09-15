import 'package:flutter/material.dart';
import 'package:movie_review_app/screens/home_screen.dart';
import 'package:movie_review_app/screens/search_screen.dart';

class BottomNavbar extends StatelessWidget {
  static String id = '/bottom_navbar';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BottomNavbarScreen(),
    );
  }
}

class BottomNavbarScreen extends StatefulWidget {
   BottomNavbarScreen({super.key});

  @override
  State<BottomNavbarScreen> createState() => _BottomNavbarScreenState();
}

class _BottomNavbarScreenState extends State<BottomNavbarScreen> {
  int selectedIndex = 0;

  void onTapItem(int Index){
    setState(() {
      selectedIndex = Index;
    });
  }

  List widgetScreens = [
    HomeScreen(),
    SearchScreen(),
    Text('Underdevelopment : Screen play video goes here'),
    Text('Underdevelopment : Screen Profile goes here')


  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: widgetScreens.elementAt(selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 30),
            label: 'Home',
            backgroundColor: Color(0xFF282828),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search, size: 30),
            label: 'Search',
            backgroundColor: Color(0xFF282828),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.play_circle_outline, size: 30,),
            label: 'School',
            backgroundColor: Color(0xFF282828),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle, size: 30,),
            label: 'Settings',
            backgroundColor: Color(0xFF282828),
          ),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: Colors.white,
        onTap: onTapItem,
      ),
    );
  }
}
