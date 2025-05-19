import 'package:flutter/material.dart';
import 'products_page.dart';
import 'cart_page.dart';
import 'checkout_page.dart';
import 'product.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mcart',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        fontFamily: 'SamsungSans',
        textTheme: Theme.of(context).textTheme.apply(
          bodyColor: Colors.deepPurple[900],
          displayColor: Colors.deepPurple[900],
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.deepPurple,
          foregroundColor: Colors.white,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepPurple,
            foregroundColor: Colors.white,
            textStyle: const TextStyle(fontWeight: FontWeight.bold),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          ),
        ),
        cardTheme: CardTheme(
          color: Colors.deepPurple[50],
          elevation: 4,
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
      home: const MyHomePage(title: 'Mcart'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Product> _products = generateProducts();
  final Map<Product, int> _cart = {};
  bool _showProducts = false;
  bool _showCart = false;
  bool _orderConfirmed = false;

  void _updateCart(Product product, int quantity) {
    setState(() {
      if (quantity <= 0) {
        _cart.remove(product);
      } else {
        _cart[product] = quantity;
      }
    });
  }

  void _openProducts() {
    setState(() {
      _showProducts = true;
      _showCart = false;
      _orderConfirmed = false;
    });
  }

  void _openCart() {
    setState(() {
      _showCart = true;
      _showProducts = false;
      _orderConfirmed = false;
    });
  }

  void _goHome() {
    setState(() {
      _showProducts = false;
      _showCart = false;
      _orderConfirmed = false;
    });
  }

  void _checkout() {
    setState(() {
      _cart.clear();
      _showCart = false;
      _showProducts = false;
      _orderConfirmed = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_orderConfirmed) {
      return CheckoutPage(onGoHome: _goHome);
    }
    if (_showCart) {
      return CartPage(
        cartItems: _cart,
        onRemove: (product) => _updateCart(product, 0),
        onCheckout: _checkout,
      );
    }
    if (_showProducts) {
      return ProductsPage(
        products: _products,
        cart: _cart,
        onCartUpdate: _updateCart,
        onCartPressed: _openCart,
        onHomePressed: _goHome,
      );
    }
    // HomePage with logo and button
    return Scaffold(
      appBar: AppBar(title: Text(widget.title, style: const TextStyle(fontFamily: 'SamsungSans'))),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.phone_android, size: 100, color: Colors.deepPurple),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: _openProducts,
              child: const Text('Explore Products', style: TextStyle(fontFamily: 'SamsungSans')),
            ),
          ],
        ),
      ),
    );
  }
}

List<Product> generateProducts() {
  final List<String> names = [
    'iPhone 15 Pro',
    'Samsung Galaxy S24 Ultra',
    'Google Pixel 8 Pro',
    'OnePlus 12',
    'Xiaomi 14 Pro',
    'Sony Xperia 1 VI',
    'Motorola Edge 50',
    'Oppo Find X7',
    'Vivo X100 Pro',
    'Realme GT 6',
    'Asus ROG Phone 8',
    'Nokia X50',
    'Huawei P70',
    'Honor Magic 6',
    'Lenovo Legion Y90',
    'ZTE Axon 50',
    'Meizu 21',
    'Sharp Aquos R8',
    'Tecno Phantom X3',
    'Infinix Zero 30',
    'iQOO 12',
    'Poco F6 Pro',
    'Redmi Note 14 Pro',
    'Black Shark 6',
    'Nothing Phone 3',
    'Fairphone 5',
    'Cat S75',
    'Unihertz Titan Slim',
    'Doogee S100',
    'Cubot KingKong 9',
    'TCL 50 XL',
    'Alcatel 7',
    'Micromax Infinity',
    'Lava Blaze 5G',
    'Karbonn Titanium',
    'Coolpad Cool 30',
    'Gionee M30',
    'LeEco Le Max 3',
    'Panasonic Eluga Ray',
    'Sharp Z3',
    'BLU G91 Pro',
    'Tecno Camon 30',
    'Infinix Hot 40',
    'Itel S24',
    'Symphony Z60',
    'Walton Primo S8',
    'Vsmart Aris Pro',
    'BQ Aquaris X2',
    'Wiko View 5',
    'Prestigio Muze',
    'General Mobile GM 22',
    'Hisense Infinity H60',
    'Energizer Power Max',
    'Archos Diamond',
    'Plum Gator 7',
    'Verykool SL5560',
    'Yezz Max 3',
    'Allview Soul X9',
    'Icemobile G7',
    'Maxwest Nitro',
    'Sky Devices Elite',
    'Cloudfone Next Infinity',
    'Cherry Mobile Flare',
    'MyPhone MyX8',
    'Oukitel WP23',
    'Ulefone Armor 24',
    'Blackview BV9300',
    'Doogee V30T',
    'AGM Glory G1',
    'Hotwav Cyber 9',
    'Cubot P80',
    'Leagoo M13',
    'Homtom HT80',
    'Elephone U5',
    'Umidigi Bison Pro',
    'Turing Phone',
    'YotaPhone 3',
    'ZUK Z3',
    'Smartisan Nut Pro 3',
    '360 N7 Pro',
    'Meitu T9',
    'Gigaset GS5',
    'Shift6mq',
    'Teracube 2e',
    'Librem 5',
    'PinePhone Pro',
    'F(x)tec Pro1-X',
    'Planet Cosmo Communicator',
    'FX Technology Pro1',
    'Purism Librem 5',
    'Fairphone 4',
    'Volla Phone 22',
    'BQ Aquaris X Pro',
    'Wileyfox Swift 2X',
    'Kazuna eTalk',
    'Sonim XP8',
    'Kyocera DuraForce Ultra',
    'Cat S62 Pro',
    'Plum Ram 10',
    'Verykool SL4500',
  ];
  // Use a placeholder image from a reliable source
  const String image = 'https://images.app.goo.gl/VeSKyQVsLEzGe5F88';
  final List<Product> products = [];
  for (int i = 0; i < 100; i++) {
    final name = names[i % names.length];
    final price = 199.0 + (i * 7.5) % 1000;
    products.add(
      Product(
        name: name,
        description: 'A great smartphone: $name',
        price: double.parse(price.toStringAsFixed(2)),
        imageUrl: image,
      ),
    );
  }
  return products;
}
