import 'package:flutter/material.dart';
import 'package:travel_app/Model/model.dart';
import 'detail_screen.dart';

class HomeScreen extends StatelessWidget {
  final List<LocationDetail> bookmarks;
  final Function(LocationDetail) onToggleBookmark;

  const HomeScreen({
    super.key,
    required this.bookmarks,
    required this.onToggleBookmark,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Discover"),
        centerTitle: true,
        backgroundColor: const Color(0xFFA36C88), // theme color
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 251, 252, 255),
              Color.fromARGB(255, 240, 213, 220),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView.builder(
          itemCount: locationItems.length,
          padding: const EdgeInsets.all(12),
          itemBuilder: (context, index) {
            final location = locationItems[index];
            final isBookmarked = bookmarks.contains(location);

            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              margin: const EdgeInsets.symmetric(vertical: 8),
              elevation: 4,
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
                title: Text(
                  location.name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  "${location.address} • \$${location.price}",
                  style: TextStyle(color: Colors.grey[700]),
                ),

                trailing: IconButton(
                  icon: Icon(
                    isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                    color: isBookmarked ? Colors.teal : Colors.grey,
                  ),
                  onPressed: () {
                    onToggleBookmark(
                      location,
                    ); 
                  },
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => DetailScreen(
                        location: location,
                        isBookmarked: isBookmarked,
                        onToggleBookmark: onToggleBookmark,
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
