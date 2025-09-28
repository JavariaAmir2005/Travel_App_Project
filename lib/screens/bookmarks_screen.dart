import 'package:flutter/material.dart';
import 'package:travel_app/Model/model.dart';

class BookmarkScreen extends StatelessWidget {
  final List<LocationDetail> bookmarks;

  const BookmarkScreen({super.key, required this.bookmarks});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bookmarks"),
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
        child: bookmarks.isEmpty
            ? const Center(
                child: Text("No bookmarks yet"),
              )
            : ListView.builder(
                itemCount: bookmarks.length,
                itemBuilder: (context, index) {
                  final location = bookmarks[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 3,
                    child: ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          location.image,
                          width: 70,
                          height: 70,
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text(location.name),
                      subtitle: Text("${location.address} • \$${location.price}"),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
