
import 'package:myapp/model/ModelProduct.dart';

class ProductController {
  List<Product> getProducts() {
    return [
      Product(
        name: 'Stylish T-Shirt',
        imageUrl: 'https://images.unsplash.com/photo-1548778943-5bbeeb1ba6c1?q=80&w=1954&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        price: 'Rp 100,000',
      ),
      Product(
        name: 'Casual Jeans',
        imageUrl: 'https://images.unsplash.com/photo-1662011966037-7ea814f79a64?q=80&w=1964&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        price: 'Rp 250,000',
      ),
      Product(
        name: 'Leather Jacket',
        imageUrl: 'https://images.unsplash.com/photo-1521223890158-f9f7c3d5d504?q=80&w=1492&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        price: 'Rp 300,000',
      ),
      Product(
        name: 'Running Shoes',
        imageUrl: 'https://images.unsplash.com/photo-1523314399-837f3e0c291b?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        price: 'Rp 150,000',
      ),
    ];
  }
}
