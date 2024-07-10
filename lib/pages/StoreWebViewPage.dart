import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/data/ProductController.dart'; // Import controller produk
import 'package:myapp/homePage.dart'; // Import homepage untuk navigasi
import 'package:myapp/model/ModelProduct.dart'; // Import model data produk

class StoreWebViewPage extends StatelessWidget {
  const StoreWebViewPage({super.key}); // Constructor halaman toko fesyen

  @override
  Widget build(BuildContext context) {
    final ProductController productController = ProductController(); // Inisialisasi controller produk
    final List<Product> products = productController.getProducts(); // Mengambil daftar produk
    double screenWidth = MediaQuery.of(context).size.width; // Mengambil lebar layar perangkat
    bool isDesktop = screenWidth > 600; // Cek apakah tampilan desktop atau mobile

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Non-aktifkan tombol back otomatis
        backgroundColor: Colors.white, // Atur warna background AppBar
        title: Row(
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back), // Tombol kembali
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Homepage()), // Navigasi ke Homepage
                );
              },
            ),
            Spacer(), // Spacer untuk menyelaraskan teks ke tengah
            Text(
              'Toko Baju',
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(), // Spacer kedua untuk keperluan tata letak
          ],
        ),
      ),
      body: SingleChildScrollView( // Scroll view untuk mengakomodasi konten yang mungkin lebih panjang dari layar
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0), // Padding di sekitar konten
            child: Column(
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0), // Radius border dari Card
                  ),
                  elevation: 5, // Elevation untuk memberikan efek bayangan
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(15.0),
                            bottom: Radius.circular(15.0)),
                        child: SizedBox(
                          height: 150,
                          width: double.infinity,
                          child: Image.asset(
                            'assets/images/banner.png', // Memuat gambar banner
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20), // Spacer vertikal
                Padding(
                  padding: EdgeInsets.only(left: 10, right: 10), // Padding horizontal untuk baris ini
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Features', // Judul bagian
                        style: GoogleFonts.poppins(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Show all', // Tombol untuk menampilkan semua item
                          style: GoogleFonts.poppins(
                            color: Colors.grey,
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                GridView.builder( // Grid view untuk menampilkan produk
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: isDesktop ? 4 : 2, // Jumlah kolom berbeda untuk desktop dan mobile
                    crossAxisSpacing: 16.0,
                    mainAxisSpacing: 16.0,
                    childAspectRatio: isDesktop ? 1 / 1 : 2 / 3, // Aspect ratio untuk tampilan desktop dan mobile
                  ),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(), // Disable scroll pada grid view
                  itemCount: products.length, // Jumlah total produk
                  itemBuilder: (context, index) { // Builder untuk setiap item produk
                    return buildCard(
                      products[index].imageUrl, // URL gambar produk
                      products[index].name, // Nama produk
                      products[index].price, // Harga produk
                      isDesktop, // Flag desktop
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildCard(String imagePath, String title, String price, bool isDesktop) { // Widget untuk membangun card produk
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0), // Radius border card
      ),
      elevation: 5, // Elevation card
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)), // Radius untuk gambar
            child: Image.network(
              imagePath, // Memuat gambar dari URL
              height: isDesktop ? 200 : 180, // Tinggi gambar berbeda untuk desktop dan mobile
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0), // Padding di dalam card
            child: Text(
              title, // Teks nama produk
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0), // Padding horizontal untuk harga
            child: Text(
              price, // Teks harga produk
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
