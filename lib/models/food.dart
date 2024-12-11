class Makanan {
  final String nama;
  final String deskripsi;
  final String gambarPath;
  final double harga;
  final KategoriMakanan kategori;
  List<Tambahan> availableTambahan;

  Makanan({
    required this.nama,
    required this.deskripsi,
    required this.gambarPath,
    required this.harga,
    required this.kategori,
    required this.availableTambahan,
  });
}

enum KategoriMakanan {
  mie,
  pangsit,
  gorengan,
  roti,
  minuman,
}

class Tambahan {
  String nama;
  double harga;

  Tambahan({
    required this.nama,
    required this.harga,
  });
}
