import 'package:gomie/models/food.dart';

class CartItem {
  Makanan makanan;
  List<Tambahan> selectedTambahan;
  int quantity;

  CartItem({
    required this.makanan,
    required this.selectedTambahan,
    this.quantity = 1,
  });

  double get totalHarga {
    double tambahanHarga =
        selectedTambahan.fold(0, (sum, tambahan) => sum + tambahan.harga);
    return (makanan.harga + tambahanHarga) * quantity;
  }
}
