import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class AppTheme extends StatefulWidget {

  @override
  State<AppTheme> createState() => _AppThemeState();
}

class _AppThemeState extends State<AppTheme> {

  bool isDark = false;



  @override
  Widget build(BuildContext context) {
     ThemeData themeData = ThemeData(
        useMaterial3: true,
        brightness: isDark ? Brightness.dark : Brightness.light);
    return MaterialApp(
      theme: themeData,
      home: Tooltip(
        message: 'Change brightness mode',
        child: IconButton(
          isSelected: isDark,
          onPressed: () {
            setState(() {
              isDark = !isDark;
            });
          },
          icon: const Icon(Icons.wb_sunny_outlined),
          selectedIcon: const Icon(Icons.brightness_2_outlined),
        ),
      ),
    );
  }
}


