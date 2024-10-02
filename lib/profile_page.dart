import 'package:flutter/material.dart';
import 'package:lat_kuis/login_pages.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfilePage extends StatelessWidget {
  final String username;

  ProfilePage({required this.username}); // Constructor untuk menerima username

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome, $username!'),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 182, 71, 192),
              Color.fromARGB(255, 84, 25, 67),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Tombol Instagram
              ElevatedButton(
                onPressed: () async {
                  const url = 'https://www.instagram.com/lenansyaa?igsh=bWZkdWw4Y2x5bDFs';
                  if (await canLaunch(url)) {
                    await launch(url);
                  } else {
                    throw 'Could not launch $url';
                  }
                },
                child: Text('My Instagram'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.purple, backgroundColor: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              // Informasi nama
              Text(
                'Nama: Lenansya Ersa Salsabila',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                textAlign: TextAlign.center, // Menyusun teks di tengah
              ),
              SizedBox(height: 10),
              // Informasi NIM
              Text(
                'NIM: 124220082',
                style: TextStyle(fontSize: 20, color: Colors.white70),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40), // Jarak antara informasi dan tombol logout
              // Tombol Logout
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return LoginPage();
                    }),
                  );
                },
                child: Text('Logout'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.purple, backgroundColor: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

