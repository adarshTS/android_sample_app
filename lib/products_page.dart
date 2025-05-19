import 'package:flutter/material.dart';
import 'product.dart';

class ProductsPage extends StatelessWidget {
  final List<Product> products;
  final Map<Product, int> cart;
  final void Function(Product, int) onCartUpdate;
  final VoidCallback onCartPressed;
  final VoidCallback onHomePressed;

  const ProductsPage({
    super.key,
    required this.products,
    required this.cart,
    required this.onCartUpdate,
    required this.onCartPressed,
    required this.onHomePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products', style: TextStyle(fontFamily: 'SamsungSans')),
        actions: [
          IconButton(
            icon: const Icon(Icons.home),
            tooltip: 'Home',
            onPressed: onHomePressed,
          ),
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: onCartPressed,
              ),
              if (cart.values.fold(0, (a, b) => a + b) > 0)
                Positioned(
                  right: 8,
                  top: 8,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 16,
                      minHeight: 16,
                    ),
                    child: Text(
                      '${cart.values.fold(0, (a, b) => a + b)}',
                      style: const TextStyle(color: Colors.white, fontSize: 12, fontFamily: 'SamsungSans'),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          final count = cart[product] ?? 0;
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
                      width: 70,
                      height: 70,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        width: 70,
                        height: 70,
                        color: Colors.deepPurple[100],
                        child: const Icon(Icons.image_not_supported, color: Colors.deepPurple, size: 32),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(product.name, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'SamsungSans')),
                        const SizedBox(height: 4),
                        Text(product.description, style: const TextStyle(fontSize: 14, fontFamily: 'SamsungSans')),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Text('₹${product.price.toStringAsFixed(2)}', style: const TextStyle(fontSize: 16, color: Colors.deepPurple, fontFamily: 'SamsungSans')),
                            const Spacer(),
                            if (count == 0)
                              ElevatedButton.icon(
                                onPressed: () => onCartUpdate(product, 1),
                                icon: const Icon(Icons.add_shopping_cart),
                                label: const Text('Add to Cart', style: TextStyle(fontFamily: 'SamsungSans')),
                              )
                            else
                              Row(
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.remove_circle_outline),
                                    onPressed: () => onCartUpdate(product, count - 1),
                                  ),
                                  Text('$count', style: const TextStyle(fontSize: 16, fontFamily: 'SamsungSans')),
                                  IconButton(
                                    icon: const Icon(Icons.add_circle_outline),
                                    onPressed: () => onCartUpdate(product, count + 1),
                                  ),
                                ],
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
