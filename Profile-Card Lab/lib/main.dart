import 'package:flutter/material.dart';

void main() {
  runApp(const MyAppWrapper());
}

class MyAppWrapper extends StatelessWidget {
  const MyAppWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("My Profile", style: TextStyle(fontSize: 16)),
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Card(
            elevation: 8,
            shadowColor: Colors.black26,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Container(
              padding: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                color: const Color(0xFFF8F9FE), // Light bluish-white tint
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min, // Shrinks card to fit content
                children: [
                  // Profile Image/Icon with Circle Background
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.blue.withOpacity(0.1),
                    child: const Icon(Icons.person_outline, size: 50, color: Colors.blueAccent),
                  ),
                  const SizedBox(height: 15),
                  
                  // Name
                  const Text(
                    "Scooby Doo",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  
                  // Subtitle
                  const Text(
                    "Flutter Developer",
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  const SizedBox(height: 20),
                  
                  // Social Icons Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.email, size: 18, color: Colors.blueGrey[700]),
                      const SizedBox(width: 25),
                      Icon(Icons.phone, size: 18, color: Colors.blueGrey[700]),
                      const SizedBox(width: 25),
                      Icon(Icons.share, size: 18, color: Colors.blueGrey[700]),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}