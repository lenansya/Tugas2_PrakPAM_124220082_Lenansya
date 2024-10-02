import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product Detail',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProductDetailPage(),
    );
  }
}

class ProductDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PERALATAN KANTOR'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); 
          },
        ),
        centerTitle: true, 
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gambar produk
            Container(
              height: 200,
              width: double.infinity,
              color: Colors.grey[300], 
              child: Center(
                child: Image.asset('assets/1.jpeg'), 
              ),
            ),
            SizedBox(height: 20),
            // Nama produk
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'PERALATAN KANTOR',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                Icon(Icons.star, color: Colors.yellow), // Icon rating
              ],
            ),
            SizedBox(height: 10),
            // Deskripsi produk
            Text(
              'Sangat bermanfaat untuk bekerja sehari-hari',
              style: TextStyle(fontSize: 16),
            ),
            Divider(), // Garis pemisah
            SizedBox(height: 10),
            // Harga produk
            Text(
              'Price',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'Rp 100.000,00',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 40),
            // Button Beli
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Menampilkan Snackbar ketika tombol Buy diklik
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Pembelian berhasil!'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                },
                child: Text('Buy'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
