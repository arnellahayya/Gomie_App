import 'package:flutter/material.dart';
import 'package:gomie/models/cart_item.dart';
import 'package:collection/collection.dart';
import 'package:intl/intl.dart';
import 'food.dart';

class Restaurant extends ChangeNotifier {
//list makanan
  final List<Makanan> _menu = [
    //Mie
    Makanan(
      nama: "Mie Kwetiaw",
      deskripsi:
          "Mie goreng kwetiaw dengan bumbu yang gurih dan rasanya begitu otentik.",
      gambarPath: "lib/images/mie/kwetiaw_mie.png",
      harga: 25000,
      kategori: KategoriMakanan.mie,
      availableTambahan: [
        Tambahan(nama: "Extra Pedas", harga: 5000),
        Tambahan(nama: "Extra Mie", harga: 10000),
        Tambahan(nama: "Extra Topping", harga: 7000),
      ],
    ),
    Makanan(
      nama: "Mie Biasa",
      deskripsi:
          "Mie goreng biasa dengan bumbu yang gurih dan rasanya begitu otentik.",
      gambarPath: "lib/images/mie/biasa_mie.png",
      harga: 22000,
      kategori: KategoriMakanan.mie,
      availableTambahan: [
        Tambahan(nama: "Extra Pedas", harga: 5000),
        Tambahan(nama: "Extra Mie", harga: 10000),
        Tambahan(nama: "Extra Topping", harga: 7000),
      ],
    ),
    Makanan(
      nama: "Mie Bihun",
      deskripsi:
          "Mie goreng bihun dengan bumbu yang gurih dan rasanya begitu otentik.",
      gambarPath: "lib/images/mie/bihun_mie.png",
      harga: 23000,
      kategori: KategoriMakanan.mie,
      availableTambahan: [
        Tambahan(nama: "Extra Pedas", harga: 5000),
        Tambahan(nama: "Extra Mie", harga: 10000),
        Tambahan(nama: "Extra Topping", harga: 7000),
      ],
    ),
    Makanan(
      nama: "Mie Shirataki",
      deskripsi:
          "Mie goreng shirataki dengan bumbu yang gurih dan rasanya begitu otentik.",
      gambarPath: "lib/images/mie/shirataki_mie.png",
      harga: 25000,
      kategori: KategoriMakanan.mie,
      availableTambahan: [
        Tambahan(nama: "Extra Pedas", harga: 5000),
        Tambahan(nama: "Extra Mie", harga: 10000),
        Tambahan(nama: "Extra Topping", harga: 7000),
      ],
    ),
    Makanan(
      nama: "Mie Spagheti",
      deskripsi:
          "Mie goreng kwetiaw dengan bumbu yang gurih dan rasanya begitu otentik.",
      gambarPath: "lib/images/mie/spagheti_mie.png",
      harga: 25000,
      kategori: KategoriMakanan.mie,
      availableTambahan: [
        Tambahan(nama: "Extra Pedas", harga: 5000),
        Tambahan(nama: "Extra Mie", harga: 10000),
        Tambahan(nama: "Extra Topping", harga: 7000),
      ],
    ),

    //Pangsit
    Makanan(
      nama: "Pangsit Dimsum",
      deskripsi:
          "Pangsit Dimsum dengan bumbu yang gurih dan rasanya yang lezat.",
      gambarPath: "lib/images/pangsit/dimsum_pangsit.png",
      harga: 15000,
      kategori: KategoriMakanan.pangsit,
      availableTambahan: [
        Tambahan(nama: "Extra Sambal", harga: 2000),
        Tambahan(nama: "Goreng Kering", harga: 1000),
        Tambahan(nama: "Extra Saus", harga: 2000),
      ],
    ),
    Makanan(
      nama: "Pangsit Goreng",
      deskripsi:
          "Pangsit Goreng dengan bumbu yang gurih dan rasanya yang lezat.",
      gambarPath: "lib/images/pangsit/goreng_pangsit.png",
      harga: 15000,
      kategori: KategoriMakanan.pangsit,
      availableTambahan: [
        Tambahan(nama: "Extra Sambal", harga: 2000),
        Tambahan(nama: "Goreng Kering", harga: 1000),
        Tambahan(nama: "Extra Saus", harga: 2000),
      ],
    ),
    Makanan(
      nama: "Pangsit Gyoza",
      deskripsi:
          "Pangsit Gyoza dengan bumbu yang gurih dan rasanya yang lezat.",
      gambarPath: "lib/images/pangsit/gyoza_pangsit.png",
      harga: 15000,
      kategori: KategoriMakanan.pangsit,
      availableTambahan: [
        Tambahan(nama: "Extra Sambal", harga: 2000),
        Tambahan(nama: "Goreng Kering", harga: 1000),
        Tambahan(nama: "Extra Saus", harga: 2000),
      ],
    ),
    Makanan(
      nama: "Pangsit Kuah",
      deskripsi: "Pangsit Kuah dengan bumbu yang gurih dan rasanya yang lezat.",
      gambarPath: "lib/images/pangsit/kuah_pangsit.png",
      harga: 15000,
      kategori: KategoriMakanan.pangsit,
      availableTambahan: [
        Tambahan(nama: "Extra Sambal", harga: 2000),
        Tambahan(nama: "Extra Kuah", harga: 1000),
        Tambahan(nama: "Extra Saus", harga: 2000),
      ],
    ),
    Makanan(
      nama: "Pangsit Pedas",
      deskripsi:
          "Pangsit Pedas dengan bumbum yang gurih dan rasanya yang lezat.",
      gambarPath: "lib/images/pangsit/pedas_pangsit.png",
      harga: 15000,
      kategori: KategoriMakanan.pangsit,
      availableTambahan: [
        Tambahan(nama: "Extra Sambal", harga: 2000),
        Tambahan(nama: "Goreng Kering", harga: 1000),
        Tambahan(nama: "Extra Saus", harga: 2000),
      ],
    ),
    //Gorengan
    Makanan(
      nama: "Kentang Goreng",
      deskripsi: "Kentang goreng dengan bumbu yang gurih dan krispi.",
      gambarPath: "lib/images/gorengan/kentang_gorengan.png",
      harga: 15000,
      kategori: KategoriMakanan.gorengan,
      availableTambahan: [
        Tambahan(nama: "Extra Sambal", harga: 2000),
        Tambahan(nama: "Goreng Kering", harga: 1000),
        Tambahan(nama: "Extra Saus", harga: 2000),
      ],
    ),
    Makanan(
      nama: "Otak-Otak Goreng",
      deskripsi: "Otak-Otak goreng dengan bumbu yang gurih dan krispi.",
      gambarPath: "lib/images/gorengan/otakotak_gorengan.png",
      harga: 15000,
      kategori: KategoriMakanan.gorengan,
      availableTambahan: [
        Tambahan(nama: "Extra Sambal", harga: 2000),
        Tambahan(nama: "Goreng Kering", harga: 1000),
        Tambahan(nama: "Extra Saus", harga: 2000),
      ],
    ),
    Makanan(
      nama: "Tahu Goreng",
      deskripsi: "Tahu goreng dengan bumbu yang gurih dan krispi.",
      gambarPath: "lib/images/gorengan/tahu_gorengan.png",
      harga: 9000,
      kategori: KategoriMakanan.gorengan,
      availableTambahan: [
        Tambahan(nama: "Extra Sambal", harga: 2000),
        Tambahan(nama: "Goreng Kering", harga: 1000),
        Tambahan(nama: "Extra Saus", harga: 2000),
      ],
    ),
    Makanan(
      nama: "Tempe Goreng",
      deskripsi: "Tempe goreng dengan bumbu yang gurih dan krispi.",
      gambarPath: "lib/images/gorengan/tempe_gorengan.png",
      harga: 9000,
      kategori: KategoriMakanan.gorengan,
      availableTambahan: [
        Tambahan(nama: "Extra Sambal", harga: 2000),
        Tambahan(nama: "Goreng Kering", harga: 1000),
        Tambahan(nama: "Extra Saus", harga: 2000),
      ],
    ),
    Makanan(
      nama: "Udang Keju Goreng",
      deskripsi: "Udang Keju goreng dengan bumbu yang gurih dan krispi.",
      gambarPath: "lib/images/gorengan/udangkeju_gorengan.png",
      harga: 12000,
      kategori: KategoriMakanan.gorengan,
      availableTambahan: [
        Tambahan(nama: "Extra Sambal", harga: 2000),
        Tambahan(nama: "Goreng Kering", harga: 1000),
        Tambahan(nama: "Extra Saus", harga: 2000),
      ],
    ),
    //Roti
    Makanan(
      nama: "Roti Coklat",
      deskripsi: "Roti lembut dengan isian rasa coklat yang lezat.",
      gambarPath: "lib/images/roti/coklat_roti.png",
      harga: 10000,
      kategori: KategoriMakanan.roti,
      availableTambahan: [
        Tambahan(nama: "Extra isi", harga: 3000),
        Tambahan(nama: "Extra topping", harga: 3000),
        Tambahan(nama: "Jumbo", harga: 5000),
      ],
    ),
    Makanan(
      nama: "Roti Daging",
      deskripsi: "Roti lembut dengan isian rasa daging yang lezat.",
      gambarPath: "lib/images/roti/daging_roti.png",
      harga: 15000,
      kategori: KategoriMakanan.roti,
      availableTambahan: [
        Tambahan(nama: "Extra isi", harga: 3000),
        Tambahan(nama: "Extra topping", harga: 3000),
        Tambahan(nama: "Jumbo", harga: 5000),
      ],
    ),
    Makanan(
      nama: "Roti Keju",
      deskripsi: "Roti lembut dengan isian rasa keju yang lezat.",
      gambarPath: "lib/images/roti/keju_roti.png",
      harga: 12000,
      kategori: KategoriMakanan.roti,
      availableTambahan: [
        Tambahan(nama: "Extra isi", harga: 3000),
        Tambahan(nama: "Extra topping", harga: 3000),
        Tambahan(nama: "Jumbo", harga: 5000),
      ],
    ),
    Makanan(
      nama: "Roti Matcha",
      deskripsi: "Roti lembut dengan isian rasa matcha yang lezat.",
      gambarPath: "lib/images/roti/matcha_roti.png",
      harga: 14000,
      kategori: KategoriMakanan.roti,
      availableTambahan: [
        Tambahan(nama: "Extra isi", harga: 3000),
        Tambahan(nama: "Extra topping", harga: 3000),
        Tambahan(nama: "Jumbo", harga: 5000),
      ],
    ),
    Makanan(
      nama: "Roti Strawberry",
      deskripsi: "Roti lembut dengan isian rasa strawberry yang lezat.",
      gambarPath: "lib/images/roti/strawberry_roti.png",
      harga: 12000,
      kategori: KategoriMakanan.roti,
      availableTambahan: [
        Tambahan(nama: "Extra isi", harga: 3000),
        Tambahan(nama: "Extra topping", harga: 3000),
        Tambahan(nama: "Jumbo", harga: 5000),
      ],
    ),
    //Minuman
    Makanan(
      nama: "Es Buah",
      deskripsi: "Es Buah dengan kualitas dan rasa yang menyegarkan.",
      gambarPath: "lib/images/minuman/esbuah_minuman.png",
      harga: 10000,
      kategori: KategoriMakanan.minuman,
      availableTambahan: [
        Tambahan(nama: "Extra es", harga: 1000),
        Tambahan(nama: "Extra gula", harga: 2000),
        Tambahan(nama: "Jumbo", harga: 3000),
      ],
    ),
    Makanan(
      nama: "Es Kopyor",
      deskripsi: "Es Kopyor dengan kualitas dan rasa yang menyegarkan.",
      gambarPath: "lib/images/minuman/eskopyor_minuman.png",
      harga: 9000,
      kategori: KategoriMakanan.minuman,
      availableTambahan: [
        Tambahan(nama: "Extra es", harga: 1000),
        Tambahan(nama: "Extra gula", harga: 2000),
        Tambahan(nama: "Jumbo", harga: 3000),
      ],
    ),
    Makanan(
      nama: "Es Teh",
      deskripsi: "Es Teh dengan kualitas dan rasa yang menyegarkan.",
      gambarPath: "lib/images/minuman/esteh_minuman.png",
      harga: 5000,
      kategori: KategoriMakanan.minuman,
      availableTambahan: [
        Tambahan(nama: "Extra es", harga: 1000),
        Tambahan(nama: "Extra gula", harga: 2000),
        Tambahan(nama: "Jumbo", harga: 3000),
      ],
    ),
    Makanan(
      nama: "Lemon Tea",
      deskripsi: "Lemon Tea dengan kualitas dan rasa yang menyegarkan.",
      gambarPath: "lib/images/minuman/lemontea_minuman.png",
      harga: 7000,
      kategori: KategoriMakanan.minuman,
      availableTambahan: [
        Tambahan(nama: "Extra es", harga: 1.000),
        Tambahan(nama: "Extra gula", harga: 2.000),
        Tambahan(nama: "Jumbo", harga: 3.000),
      ],
    ),
    Makanan(
      nama: "Orange",
      deskripsi: "Orange dengan kualitas dan rasa yang menyegarkan.",
      gambarPath: "lib/images/minuman/orange_minuman.png",
      harga: 9000,
      kategori: KategoriMakanan.minuman,
      availableTambahan: [
        Tambahan(nama: "Extra es", harga: 1.000),
        Tambahan(nama: "Extra gula", harga: 2.000),
        Tambahan(nama: "Jumbo", harga: 3.000),
      ],
    ),
  ];

// user cart
  final List<CartItem> _cart = [];

// alamat delivery
  String _deliveryAddress = "Mencari...";

  void updateDeliveryAddress(String newAddress) {
    _deliveryAddress = newAddress;
    notifyListeners();
  }

  List<Makanan> get menu => _menu;
  List<CartItem> get cart => _cart;
  String get deliveryAddress => _deliveryAddress;

/* 

OPERASI

*/

// memasukkan keranjang
  void addToCart(Makanan makanan, List<Tambahan> selectedTambahan) {
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      bool isSameMakanan = item.makanan == makanan;
      bool isSameTambahan =
          const ListEquality().equals(item.selectedTambahan, selectedTambahan);

      return isSameMakanan && isSameTambahan;
    });

    if (cartItem != null) {
      cartItem.quantity++;
    } else {
      _cart.add(
        CartItem(
          makanan: makanan,
          selectedTambahan: selectedTambahan,
        ),
      );
    }
    notifyListeners();
  }

//remove dari cart
  void removeFromCart(CartItem cartItem) {
    int cartIndex = _cart.indexOf(cartItem);

    if (cartIndex != -1) {
      if (_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
      } else {
        _cart.removeAt(cartIndex);
      }
    }
    notifyListeners();
  }

// tital harga
  double getTotalHarga() {
    double total = 0.0;

    for (CartItem cartItem in _cart) {
      double itemTotal = cartItem.makanan.harga;

      for (Tambahan tambahan in cartItem.selectedTambahan) {
        itemTotal += tambahan.harga;
      }

      total += itemTotal * cartItem.quantity;
    }

    return total;
  }

// jumlah item
  int getTotalItemCount() {
    int totalItemCount = 0;

    for (CartItem cartItem in _cart) {
      totalItemCount += cartItem.quantity;
    }

    return totalItemCount;
  }

// clear
  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

// generate nota
  String displayCartReceipt() {
    final receipt = StringBuffer();
    receipt.writeln("NOTA PEMESANAN");
    receipt.writeln();

    String formattaedDate =
        DateFormat('yyy-MM-dd HH:mm:ss').format(DateTime.now());

    receipt.writeln(formattaedDate);
    receipt.writeln();
    receipt
        .writeln("---------------------------------------------------------");
    receipt.writeln();

    for (final cartItem in _cart) {
      receipt.writeln(
          "${cartItem.quantity} x ${cartItem.makanan.nama} - ${_formatHarga(cartItem.makanan.harga)}");
      if (cartItem.selectedTambahan.isNotEmpty) {
        receipt.writeln(
            " Tambahan : ${_formatTamabahans(cartItem.selectedTambahan)}");
      }
      receipt.writeln();
    }
    receipt
        .writeln("----------------------------------------------------------");
    receipt.writeln();
    receipt.writeln("Total Item: ${getTotalItemCount()}");
    receipt.writeln("Total Harga: ${_formatHarga(getTotalHarga())}");
    receipt.writeln();
    receipt.writeln("Diantar ke: $deliveryAddress");

    return receipt.toString();
  }

  String _formatHarga(double harga) {
    return "Rp${harga.toStringAsFixed(2)}";
  }

  String _formatTamabahans(List<Tambahan> tambahans) {
    return tambahans
        .map((tambahan) => "${tambahan.nama} (${_formatHarga(tambahan.harga)})")
        .join(", ");
  }
}
