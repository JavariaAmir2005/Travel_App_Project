import 'package:flutter/material.dart';
import 'package:travel_app/screens/login_screen.dart';
import 'package:travel_app/screens/search_screen.dart';
import 'screens/home_screen.dart';
import 'screens/bookmarks_screen.dart';
import 'screens/profile_screen.dart';
import 'Model/model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Travel App',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        fontFamily: 'Poppins',
      ),
      home: const LoginScreen(), 
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  final List<LocationDetail> bookmarks = [];
  void _toggleBookmark(LocationDetail location) {
    setState(() {
      if (bookmarks.contains(location)) {
        bookmarks.remove(location);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("${location.name} removed from bookmarks")),
        );
      } else {
        bookmarks.add(location);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("${location.name} added to bookmarks")),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      HomeScreen(
        bookmarks: bookmarks,
        onToggleBookmark: _toggleBookmark,
      ),
      const ExploreScreen(), 
      BookmarkScreen(bookmarks: bookmarks),
      const ProfileScreen(),
    ];

    return Scaffold(
      body: screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        selectedItemColor: const Color(0xFFA36C88),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Explore"),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: "Saved"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
