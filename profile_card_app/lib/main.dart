import 'package:flutter/material.dart';

void main() {
  runApp(ProfileCardApp());
}

class ProfileCardApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Profile"),
      ),
      body: Center(
        child: Card(
          elevation: 8,
          margin: EdgeInsets.all(20),
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
               
                Image.asset(
                  'assets/images/profile.png',
                  height: 100,
                ),

                SizedBox(height: 10),

                Text(
                  "Abel",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 5),
                Text(
                  "Software Engineer",
                  style: TextStyle(color: Colors.grey),
                ),

                SizedBox(height: 10),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.email),
                    SizedBox(width: 5),
                    Text("abeltamerat1997@email.com"),
                  ],
                ),

                SizedBox(height: 5),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.phone),
                    SizedBox(width: 5),
                    Text("+251 947 403 065"),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}