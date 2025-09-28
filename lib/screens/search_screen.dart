import 'package:flutter/material.dart';
import 'package:travel_app/Model/model.dart';
import 'detail_screen.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  String query = "";

  @override
  Widget build(BuildContext context) {
    final filtered = locationItems.where((location) {
      return location.name.toLowerCase().contains(query.toLowerCase()) ||
          location.address.toLowerCase().contains(query.toLowerCase());
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Explore"),
        centerTitle: true,
        backgroundColor: const Color(0xFFA36C88),
      ),
      body: Container(
     decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
             colors: [
              Color.fromARGB(255, 251, 252, 255),
              Color.fromARGB(255, 240, 213, 220),
            ],
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search places...",
                  prefixIcon: const Icon(Icons.search),
                  fillColor: Colors.white, 
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onChanged: (value) {
                  setState(() => query = value);
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: filtered.length,
                itemBuilder: (context, index) {
                  final location = filtered[index];
                  return ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(8), 
                      child: Image.asset(location.image,
                          width: 60, height: 60, fit: BoxFit.cover),
                    ),
                    title: Text(location.name),
                    subtitle: Text(location.address),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => DetailScreen(
                            location: location,
                            isBookmarked: false,
                            onToggleBookmark: (_) {},
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
