import 'package:flutter/material.dart';
import 'package:gomie/models/restaurant.dart';
import 'package:provider/provider.dart';
import '../services/location_service.dart';

class MyCurrentLocation extends StatelessWidget {
  const MyCurrentLocation({super.key});

  void openLocationSearhBox(BuildContext context) {
    final TextEditingController textController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          "Lokasimu",
          style: TextStyle(color: Theme.of(context).colorScheme.primary),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: textController,
              decoration: const InputDecoration(hintText: "Masukkan lokasi..."),
              style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
            ),
            ElevatedButton(
              onPressed: () async {
                String currentAddress = await getCurrentAddress();
                textController.text = currentAddress;
              },
              child: const Text("Gunakan Lokasi Saat Ini"),
            ),
          ],
        ),
        actions: [
          MaterialButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          MaterialButton(
            onPressed: () {
              final String newAddress = textController.text.trim();
              if (newAddress.isNotEmpty) {
                context.read<Restaurant>().updateDeliveryAddress(newAddress);
                Navigator.pop(context);
                textController.clear();
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Alamat tidak boleh kosong')),
                );
              }
            },
            child: const Text("Save"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(17.0, 10.0, 15.0, 1.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Icon(
                  Icons.location_on,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              const SizedBox(width: 6),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  "Lokasimu di",
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          GestureDetector(
            onTap: () => openLocationSearhBox(context),
            child: Row(
              children: [
                Flexible(
                  child: Consumer<Restaurant>(
                    builder: (context, restaurant, child) => Text(
                      restaurant.deliveryAddress,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                ),
                Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
