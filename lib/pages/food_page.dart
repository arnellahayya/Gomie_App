import 'package:flutter/material.dart';
import 'package:gomie/components/my_button.dart';
import 'package:gomie/models/food.dart';
import 'package:gomie/models/restaurant.dart';
import 'package:provider/provider.dart';

class FoodPage extends StatefulWidget {
  final Makanan makanan;
  final Map<Tambahan, bool> selectedTambahan = {};

  FoodPage({
    super.key,
    required this.makanan,
  }) {
    for (Tambahan tambahan in makanan.availableTambahan) {
      selectedTambahan[tambahan] = false;
    }
  }

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
// method memasukkan ke cart
  void addToCart(Makanan makanan, Map<Tambahan, bool> selectedTambahan) {
    Navigator.pop(context);

    List<Tambahan> currentlySelectTambahan = [];
    for (Tambahan tambahan in widget.makanan.availableTambahan) {
      if (widget.selectedTambahan[tambahan] == true) {
        currentlySelectTambahan.add(tambahan);
      }
    }

    context.read<Restaurant>().addToCart(makanan, currentlySelectTambahan);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(widget.makanan.gambarPath),

                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.makanan.nama,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Theme.of(context).colorScheme.onPrimary),
                      ),
                      Text(
                        'Rp${widget.makanan.harga}',
                        style: TextStyle(
                            fontSize: 16,
                            color: Theme.of(context).colorScheme.primary),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        widget.makanan.deskripsi,
                        style: TextStyle(
                            fontSize: 16,
                            color: Theme.of(context).colorScheme.onPrimary),
                      ),
                      const SizedBox(height: 10),
                      Divider(color: Theme.of(context).colorScheme.secondary),
                      Text(
                        "Tambahan",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Theme.of(context).colorScheme.secondary),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.zero,
                          itemCount: widget.makanan.availableTambahan.length,
                          itemBuilder: (context, index) {
                            Tambahan tambahan =
                                widget.makanan.availableTambahan[index];

                            return CheckboxListTile(
                              title: Text(tambahan.nama),
                              subtitle: Text(
                                'Rp${tambahan.harga}',
                                style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.primary),
                              ),
                              value: widget.selectedTambahan[tambahan],
                              onChanged: (bool? value) {
                                setState(() {
                                  widget.selectedTambahan[tambahan] = value!;
                                });
                              },
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),

                // tombol memasukkan ke cart
                MyButton(
                  onTap: () =>
                      addToCart(widget.makanan, widget.selectedTambahan),
                  text: "Masukkan ke Keranjang",
                ),

                const SizedBox(height: 25),
              ],
            ),
          ),
        ),
        SafeArea(
          child: Opacity(
            opacity: 0.8,
            child: Container(
              margin: const EdgeInsets.only(left: 25),
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  shape: BoxShape.circle),
              child: IconButton(
                  icon: const Icon(Icons.arrow_back_ios_rounded),
                  onPressed: () => Navigator.pop(
                        context,
                      )),
            ),
          ),
        ),
      ],
    );
  }
}
