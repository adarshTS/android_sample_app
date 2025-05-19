import 'package:flutter/material.dart';
import 'product.dart';

class CartPage extends StatelessWidget {
  final Map<Product, int> cartItems;
  final Function(Product) onRemove;
  final VoidCallback onCheckout;

  const CartPage({
    super.key,
    required this.cartItems,
    required this.onRemove,
    required this.onCheckout,
  });

  @override
  Widget build(BuildContext context) {
    final items = cartItems.entries.toList();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Shopping Cart',
          style: TextStyle(fontFamily: 'SamsungSans'),
        ),
      ),
      body:
          items.isEmpty
              ? const Center(
                child: Text(
                  'Your cart is empty.',
                  style: TextStyle(fontFamily: 'SamsungSans'),
                ),
              )
              : ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final entry = items[index];
                  final product = entry.key;
                  final quantity = entry.value;
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(
                              product.imageUrl,
                              width: 60,
                              height: 60,
                              fit: BoxFit.cover,
                              errorBuilder:
                                  (context, error, stackTrace) => Container(
                                    width: 60,
                                    height: 60,
                                    color: Colors.deepPurple[100],
                                    child: const Icon(
                                      Icons.image_not_supported,
                                      color: Colors.deepPurple,
                                      size: 28,
                                    ),
                                  ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  product.name,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'SamsungSans',
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  product.description,
                                  style: const TextStyle(
                                    fontSize: 13,
                                    fontFamily: 'SamsungSans',
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  '₹${product.price.toStringAsFixed(2)}',
                                  style: const TextStyle(
                                    fontSize: 15,
                                    color: Colors.deepPurple,
                                    fontFamily: 'SamsungSans',
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'Quantity: $quantity',
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'SamsungSans',
                                  ),
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.remove_circle,
                              color: Colors.red,
                            ),
                            onPressed: () => onRemove(product),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
      bottomNavigationBar:
          items.isNotEmpty
              ? Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: onCheckout,
                  child: const Text(
                    'Checkout',
                    style: TextStyle(fontFamily: 'SamsungSans'),
                  ),
                ),
              )
              : null,
    );
  }
}
