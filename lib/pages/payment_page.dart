import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:gomie/components/my_button.dart';
import 'package:gomie/pages/delivery_progress_page.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;

  // pembayaran
  void userTappedPay() {
    if (formKey.currentState!.validate()) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(
            "Konfirmasi Pembayaran",
            style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text(
                  "Card Number: $cardNumber",
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.onPrimary),
                ),
                Text(
                  "Expiry Date: $expiryDate",
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.onPrimary),
                ),
                Text(
                  "Card Holder Name: $cardHolderName",
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.onPrimary),
                ),
                Text(
                  "CVV: $cvvCode",
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.onPrimary),
                ),
              ],
            ),
          ),
          actions: [
            // cancel
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),

            // yes
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DeliveryProgressPage(),
                  ),
                );
              },
              child: const Text("Yes"),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Checkout"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // kartu kredit
            CreditCardWidget(
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              cvvCode: cvvCode,
              showBackView: isCvvFocused,
              onCreditCardWidgetChange: (p0) {},
              textStyle:
                  TextStyle(color: Theme.of(context).colorScheme.onPrimary),
            ),

            // form kartu kredit
            CreditCardForm(
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              cvvCode: cvvCode,
              onCreditCardModelChange: (data) {
                setState(() {
                  cardNumber = data.cardNumber;
                  expiryDate = data.expiryDate;
                  cardHolderName = data.cardHolderName;
                  cvvCode = data.cvvCode;
                });
              },
              formKey: formKey,
            ),

            const SizedBox(height: 20),

            MyButton(
              onTap: userTappedPay,
              text: "Bayar Sekarang",
            ),

            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}
