import 'package:flutter/material.dart';
import 'package:lat_kuis/detail_produk.dart';
import 'package:lat_kuis/profile_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ONLINE SHOP',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(username: 'Username'),
    );
  }
}

class HomePage extends StatelessWidget {
  final String username;

  HomePage({required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('PERALATAN KANTOR'),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context){
                return ProfilePage(username: username,);
            }));
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center, // Menampilkan konten di tengah
          children: [
            // ListView horizontal untuk poster promosi
            Container(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildPromoPoster(),
                  _buildPromoPoster(),
                  _buildPromoPoster(),
                ],
              ),
            ),
            SizedBox(height: 20),
            // Welcome message, juga di tengah
            Center(
              child: Text(
                'Welcome, $username!',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20),
            // GridView untuk produk
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: 4, // Empat produk
                itemBuilder: (context, index) {
                  return _buildProductItem(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPromoPoster() {
    return Container(
      width: 250,
      margin: EdgeInsets.symmetric(horizontal: 8),
      color: Colors.grey[300], // Placeholder warna abu-abu
      child: Center(child: Image.asset('assets/1.jpeg')),
    );
  }

  Widget _buildProductItem(BuildContext context) {
    return Card(
      elevation: 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 100,
            color: Colors.grey[300], // Placeholder untuk gambar produk
            child: Center(child: Image.asset('assets/1.jpeg')),
          ),
          SizedBox(height: 8),
          Text('Peralatan Kantor', style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 4),
          Text('Harga: Rp 100.000'),
          SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {
              Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context){
                return ProductDetailPage();
            }));
            },
            child: Text('Beli'),
          ),
        ],
      ),
    );
  }
}


