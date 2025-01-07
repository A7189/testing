import 'package:flutter/material.dart';
import 'widgets/bottom_nav.dart'; // Pastikan file ini tersedia

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, String>> _allProducts = [
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

  List<Map<String, String>> _filteredProducts = [];

  @override
  void initState() {
    super.initState();
    _filteredProducts = _allProducts; // Semua produk default tampil
  }

  void _searchProduct(String query) {
    final results = _allProducts
        .where((product) =>
            product['name']!.toLowerCase().contains(query.toLowerCase()))
        .toList();

    setState(() {
      _filteredProducts = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tokopedia'),
        backgroundColor: Colors.green,
        elevation: 0,
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              onChanged: _searchProduct,
              decoration: InputDecoration(
                hintText: 'Cari produk di TokoAji...',
                prefixIcon: Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          // Body Content
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Produk Trending (Filtered List)
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    child: Text(
                      'Kategori Pilihan',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  _filteredProducts.isEmpty
                      ? Center(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              'Tidak ada produk ditemukan.',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        )
                      :GridView.builder(
  shrinkWrap: true,
  physics: NeverScrollableScrollPhysics(),
  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2, // Dua kartu dalam satu baris
    crossAxisSpacing: 8.0,
    mainAxisSpacing: 8.0,
    childAspectRatio: 3 / 4, // Menentukan proporsi kartu (lebar:tinggi)
  ),
  itemCount: _filteredProducts.length,
  itemBuilder: (context, index) {
    return ProductCard(
      imageUrl: _filteredProducts[index]['image']!,
      name: _filteredProducts[index]['name']!,
      price: _filteredProducts[index]['price']!,
    );
  },
),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNav(0),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String price;

  ProductCard({required this.imageUrl, required this.name, required this.price});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Gambar lebih besar
          Expanded(
            flex: 3, // Memberikan lebih banyak ruang untuk gambar
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
              child: Image.asset(
                imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
          // Kotak Penjelasan
          Expanded(
            flex: 1, // Memberikan ruang lebih kecil untuk teks
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    price,
                    style: TextStyle(fontSize: 12, color: Colors.green),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}