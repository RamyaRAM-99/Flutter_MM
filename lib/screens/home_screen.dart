import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_review_app/widgets/custom_searchbar.dart';

final List imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];

List<Map<String, String>> movies = [
  {
    'title': 'Movie Title 1',
    'description': 'Random text about movie 1 details',
    'likes': '220',
    'favorites': '87',
  },
  {
    'title': 'Movie Title 2',
    'description': 'Random text about movie 2 details',
    'likes': '180',
    'favorites': '65',
  },
  {
    'title': 'Movie Title 3',
    'description': 'Random text about movie 3 details',
    'likes': '388',
    'favorites': '80',
  },
  {
    'title': 'Movie Title 4',
    'description': 'Random text about movie 4 details',
    'likes': '287',
    'favorites': '78',
  },
  {
    'title': 'Movie Title 5',
    'description': 'Random text about movie 5 details',
    'likes': '426',
    'favorites': '76',
  },
  {
    'title': 'Movie Title 6',
    'description': 'Random text about movie 6 details',
    'likes': '678',
    'favorites': '89',
  },
];

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});
  static String id = '/home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isDark = false;
  bool heartSelected = false;
  bool thumpSelected = false;
  int currentImageIndex = 0;
  int currentMovieIndex = 0;

  void onCarouselChange(int index) {
    setState(() {
      currentMovieIndex = index;
    });
  }

  final List<Widget> imagesSlider = imgList
      .map((imageRef) => Container(
            margin: EdgeInsets.all(5.0),
            child: Image.network(
              imageRef,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ))
      .toList();

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = ThemeData(
        useMaterial3: true,
        brightness: isDark ? Brightness.dark : Brightness.light);
    return MaterialApp(
      theme: themeData,
      home: Scaffold(
        appBar: AppBar(
          // backgroundColor: Color(0xFF282828),
          leading: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Image.asset(
              'images/film_reel_001.jpg',
              height: 50,
              width: 50,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                print('Button Notification Got Tapped');
              },
              icon: Icon(
                Icons.notifications,
              ),
            ),
            IconButton(
              isSelected: isDark,
              onPressed: () {
                setState(() {
                  isDark = !isDark;
                  print('Button Theme Got Tapped');
                });
              },
              icon: Icon(Icons.wb_sunny_outlined),
            )
          ],
          centerTitle: false,
          title: Text(
            'MM',
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.topCenter,
                  height: 360,
                  color: Color(0xFF282828),
                  child: Column(
                    children: [
                      CarouselSlider(
                        items: imagesSlider,
                        options: CarouselOptions(
                            viewportFraction: 1.0,
                            autoPlay: true,
                            onPageChanged: (index, reason) {
                              setState(() {
                                currentImageIndex = index;
                                onCarouselChange(index);
                              });
                            }),
                      ),
                      Container(
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 6.0),
                              child: Stack(
                                children: [
                                  Container(
                                    width: 100,
                                    height: 135,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(
                                            imgList[currentImageIndex]),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: -10,
                                    left: 65,
                                    child: IconButton(
                                      onPressed: () {
                                        print("Save button got tapped");
                                      },
                                      icon: Icon(
                                        Icons.bookmark,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 135,
                              width: 270,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        movies[currentMovieIndex]['title']!,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      Spacer(),
                                      IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.info_outline,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    movies[currentMovieIndex]['description']!,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Row(
                                    children: [
                                      IconButton(
                                        isSelected: thumpSelected,
                                        icon: const Icon(
                                          Icons.thumb_up,
                                          color: Colors.white,
                                        ),
                                        selectedIcon: const Icon(
                                          Icons.thumb_up_alt_outlined,
                                          color: Colors.white,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            thumpSelected = !thumpSelected;
                                          });
                                        },
                                      ),
                                      Text(
                                        movies[currentMovieIndex]['likes']!,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      IconButton(
                                        isSelected: heartSelected,
                                        icon: const Icon(
                                          Icons.favorite_border_outlined,
                                          color: Colors.white,
                                        ),
                                        selectedIcon: const Icon(
                                          Icons.favorite,
                                          color: Colors.white,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            heartSelected = !heartSelected;
                                          });
                                        },
                                      ),
                                      Text(
                                        movies[currentMovieIndex]['favorites']!,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                    child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 8.0, right: 8),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search...',
                          prefixIcon: Icon(Icons.search),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(color: Colors.grey), // Sets border color to yellow
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(color: Colors.grey), // Yellow border for inactive state
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(color: Colors.black, width: 2.0), // Yellow border for active state
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
                SizedBox(height: 10,),
                Container(
                  color: Color(0xFF282828),
                  height: 400,
                )
          
              ],
            ),
          ),
        ),
      ),
    );
  }
}
