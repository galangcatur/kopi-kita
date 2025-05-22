class Product {
  final int id;
  final String nama;
  final int harga;
  final String deskripsi;
  final String foto;
  final String category;

  Product({
    required this.id,
    required this.nama,
    required this.harga,
    required this.deskripsi,
    required this.foto,
    required this.category,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      nama: json['nama'],
      harga: json['harga'],
      deskripsi: json['deskripsi'],
      foto: json['foto'],
      category: json['category'],
    );
  }
}
