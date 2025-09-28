import 'package:flutter/material.dart';
import '/Model/model.dart';

class DetailScreen extends StatelessWidget {
  final LocationDetail location;
  final bool isBookmarked;
  final Function(LocationDetail) onToggleBookmark;

  const DetailScreen({
    super.key,
    required this.location,
    required this.isBookmarked,
    required this.onToggleBookmark,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(location.name),
        actions: [
          IconButton(
            icon: Icon(
              isBookmarked ? Icons.bookmark : Icons.bookmark_border,
              color: isBookmarked ? Colors.red : Colors.white,
            ),
            onPressed: () {
              onToggleBookmark(location);
              
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(location.image, width: double.infinity, height: 250, fit: BoxFit.cover),

            // Name + Price
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(location.name,
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold)),
                  Text("\$${location.price}",
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.teal)),
                ],
              ),
            ),

            // Address + Rating
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  const Icon(Icons.location_on, size: 20, color: Colors.grey),
                  const SizedBox(width: 4),
                  Text(location.address),
                  const Spacer(),
                  const Icon(Icons.star, size: 20, color: Colors.amber),
                  Text(location.rating.toString()),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Extra Info (Temperature, Time)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  const Icon(Icons.thermostat, size: 20, color: Colors.blue),
                  const SizedBox(width: 4),
                  Text("${location.temperature}°C"),
                  const SizedBox(width: 20),
                  const Icon(Icons.timer, size: 20, color: Colors.deepOrange),
                  const SizedBox(width: 4),
                  Text("${location.time} days"),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Description
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                location.description,
                style: const TextStyle(fontSize: 16, height: 1.4),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
