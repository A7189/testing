import 'package:flutter/material.dart';
import 'widgets/bottom_nav.dart'; // Pastikan ada widget BottomNav Anda

class CartPage extends StatelessWidget {
  final List<Map<String, dynamic>> cartItems = [
     {'name': 'Asus ROG STRIX', 'image': 'assets/AsusROG.jpg', 'price': 'Rp7.500.000'},
      {'name': 'RTX 4090', 'image': 'assets/RTX.jpg', 'price': 'Rp30.000.000'},
  ];

  final List<Map<String, dynamic>> recommendations = [
    {'name': 'Skintific Peeling Solution', 'image': 'assets/skintific.jpg', 'price': 'Rp128.000'},
    {'name': 'Raket Nyamuk', 'image': 'assets/raket_nyamuk.jpg', 'price': 'Rp50.000'},
    {'name': 'iPhone 11 Pro', 'image': 'assets/iphone_11_pro.jpg', 'price': 'Rp14.000.000'},
    {'name': 'Samsung Galaxy S22 Ultra', 'image': 'assets/samsung_s22.jpg', 'price': 'Rp18.000.000'},
    {'name': 'Bubble Wrap', 'image': 'assets/buble_wrap.jpg', 'price': 'Rp10.000'},
    {'name': 'Asus ROG STRIX', 'image': 'assets/AsusROG.jpg', 'price': 'Rp7.500.000'},
    {'name': 'iPhone 14', 'image': 'assets/iphone14.jpg', 'price': 'Rp20.000.000'},
    {'name': 'RTX 4090', 'image': 'assets/RTX.jpg', 'price': 'Rp30.000.000'},
    {'name': 'RX 7700', 'image': 'assets/RX7700.jpg', 'price': 'Rp12.000.000'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Keranjang'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Keranjang
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Keranjang',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          // Daftar Barang di Keranjang
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: ListTile(
                    leading: Image.asset(item['image'], width: 50, height: 50), // Gambar Lokal
                    title: Text(item["name"]),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Rp${item["price"]}'),
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.remove),
                              onPressed: () {}, // Fungsi untuk mengurangi jumlah
                            ),
                            Text('${item["quantity"]}'),
                            IconButton(
                              icon: Icon(Icons.add),
                              onPressed: () {}, // Fungsi untuk menambah jumlah
                            ),
                          ],
                        ),
                      ],
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () {}, // Fungsi untuk menghapus item
                    ),
                  ),
                );
              },
            ),
          ),
          // Tombol Checkout
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: EdgeInsets.symmetric(horizontal: 100, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              onPressed: () {}, // Fungsi untuk proses checkout
              child: Text('Beli (${cartItems.length})'),
            ),
          ),
          // Rekomendasi Produk
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Rekomendasi untukmu',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          // Scrollable Listview Horizontal untuk Produk Rekomendasi
          Container(
            height: 200, // Membatasi tinggi rekomendasi agar lebih proporsional
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: recommendations.length,
              itemBuilder: (context, index) {
                final item = recommendations[index];
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(
                    width: 150, // Lebar card agar lebih proporsional
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Gambar Produk Rekomendasi
                        Expanded(
                          child: Image.asset(
                            item['image'],
                            width: 150, // Ukuran gambar lebih besar
                            height: 100, // Membuat gambar lebih jelas
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            item["name"],
                            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text('Rp${item["price"]}', style: TextStyle(color: Colors.green)),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNav(1),
    );
  }
}
