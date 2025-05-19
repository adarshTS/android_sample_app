import 'package:flutter/material.dart';

class CheckoutPage extends StatelessWidget {
  final VoidCallback onGoHome;
  const CheckoutPage({super.key, required this.onGoHome});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Checkout',
          style: TextStyle(fontFamily: 'SamsungSans'),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.check_circle, color: Colors.green, size: 64),
            const SizedBox(height: 24),
            const Text(
              'Order confirmed! Thank you.',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: 'SamsungSans',
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            ElevatedButton.icon(
              onPressed: onGoHome,
              icon: const Icon(Icons.home),
              label: const Text(
                'Go to Home Page',
                style: TextStyle(fontFamily: 'SamsungSans'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
