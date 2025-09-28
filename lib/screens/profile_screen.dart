import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: const Color(0xFFA36C88),
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
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
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 60,
                backgroundColor: Color(0xFFA36C88),
                child: Icon(Icons.person, size: 60, color: Colors.white),
              ),
              const SizedBox(height: 20),
              const Text(
                'Javaria Amir',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 205, 149, 178),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Javariaamir456@gmail.com',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 30),
              Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.edit, color: Color(0xFFA36C88)),
                    title: Text(
                      "Edit Profile",
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                    trailing: Icon(Icons.chevron_right),
                  ),
                  Divider(height: 2.0),

                  ListTile(
                    leading: Icon(Icons.settings, color: Color(0xFFA36C88)),
                    title: Text(
                      "Settings",
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                    trailing: Icon(Icons.chevron_right),
                  ),
                  Divider(height: 2.0),

                  ListTile(
                    leading: Icon(Icons.add_a_photo, color: Color(0xFFA36C88)),
                    title: Text(
                      "Add Photo",
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                    trailing: Icon(Icons.chevron_right),
                  ),
                  Divider(height: 2.0),

                  ListTile(
                    leading: Icon(Icons.logout, color: Color(0xFFA36C88)),
                    title: Text(
                      "Logout",
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                  ),
                  Divider(height: 2.0),
                ],
              ),

              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 247, 216, 232),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 15,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: const Text(
                  'Edit Profile',
                  style: TextStyle(fontSize: 15,color: Color(0xFFA36C88)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
