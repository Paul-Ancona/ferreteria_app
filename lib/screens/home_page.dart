import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/cart_model.dart';
import '../tab/product_tab.dart';
import '../utils/my_tab.dart';
import 'cart_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

List<Widget> myTabs = [
  const MyTab(icon: Icons.handyman, tabName: 'Manuales'),
  const MyTab(icon: Icons.power, tabName: 'Eléctricas'),
  const MyTab(icon: Icons.water_drop, tabName: 'Plomería'),
  const MyTab(icon: Icons.format_paint, tabName: 'Pintura'),
  const MyTab(icon: Icons.lightbulb, tabName: 'Iluminación'),
];

class _HomePageState extends State<HomePage> {
  // Datos de ferretería
  final List manualTools = [
    ['Martillo', '150.00', Colors.blue, 'lib/images/hammer.png', 'Manuales'],
    ['Desarmadores', '250.00', Colors.red, 'lib/images/screwdrivers.png', 'Manuales'],
    ['Llaves', '300.00', Colors.green, 'lib/images/wrench.png', 'Manuales'],
    ['Pinzas', '180.00', Colors.orange, 'lib/images/pliers.png', 'Manuales'],
    ['Cinta métrica', '90.00', Colors.purple, 'lib/images/tape_measure.png', 'Manuales'],
  ];

  final List powerTools = [
    ['Taladro', '1200.00', Colors.red, 'lib/images/drill.png', 'Eléctricas'],
    ['Sierra circular', '2500.00', Colors.blue, 'lib/images/circular_saw.png', 'Eléctricas'],
    ['Lijadora', '950.00', Colors.green, 'lib/images/orbital_sander.png', 'Eléctricas'],
    ['Rotomartillo', '3200.00', Colors.orange, 'lib/images/rotary_hammer.png', 'Eléctricas'],
    ['Pulidora', '1100.00', Colors.grey, 'lib/images/angle_grinder.png', 'Eléctricas'],
  ];

  final List plumbing = [
    ['Tubo PVC', '85.00', Colors.cyan, 'lib/images/pvc_pipe.png', 'Plomería'],
    ['Codos y conectores', '25.00', Colors.teal, 'lib/images/pvc_elbow.png', 'Plomería'],
    ['Llave de paso', '150.00', Colors.blue, 'lib/images/water_valve.png', 'Plomería'],
    ['Sellador', '65.00', Colors.green, 'lib/images/pipe_sealant.png', 'Plomería'],
    ['Cinta teflón', '15.00', Colors.purple, 'lib/images/teflon_tape.png', 'Plomería'],
  ];

  final List painting = [
    ['Pintura vinílica', '850.00', Colors.red, 'lib/images/paint_bucket.png', 'Pintura'],
    ['Brochas', '45.00', Colors.orange, 'lib/images/paint_brush.png', 'Pintura'],
    ['Rodillos', '120.00', Colors.blue, Icons.roller_shades, 'Pintura'],
    ['Charola', '55.00', Colors.green, Icons.kitchen, 'Pintura'],
    ['Espátulas', '35.00', Colors.brown, Icons.rectangle, 'Pintura'],
  ];

  final List lighting = [
    ['Foco LED', '45.00', Colors.yellow, Icons.lightbulb, 'Iluminación'],
    ['Lámpara de trabajo', '450.00', Colors.orange, Icons.flashlight_on, 'Iluminación'],
    ['Extensión eléctrica', '250.00', Colors.blue, Icons.cable, 'Iluminación'],
    ['Apagador', '35.00', Colors.grey, Icons.toggle_on, 'Iluminación'],
    ['Contacto eléctrico', '40.00', Colors.teal, Icons.power, 'Iluminación'],
  ];

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartModel>();

    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Icon(Icons.menu, color: Colors.grey[800]),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 24.0),
              child: Icon(Icons.person, color: Colors.grey[800]),
            ),
          ],
        ),
        body: Column(
          children: [
            // 1. Texto principal
            Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: Row(
                children: const [
                  Text('Catálogo de ', style: TextStyle(fontSize: 24)),
                  Text(
                    'Herramientas',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  )
                ],
              ),
            ),

            const SizedBox(height: 24),

            // 2. Pestañas (TabBar)
            TabBar(tabs: myTabs),

            // 3. Contenido de las pestañas
            Expanded(
              child: TabBarView(
                children: [
                  ProductTab(itemsList: manualTools),
                  ProductTab(itemsList: powerTools),
                  ProductTab(itemsList: plumbing),
                  ProductTab(itemsList: painting),
                  ProductTab(itemsList: lighting),
                ],
              ),
            ),

            // 4. Barra inferior (carrito)
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${cart.totalItems} Items | \$${cart.totalPrice.toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        const Text(
                          'Cargos de envío incluidos',
                          style: TextStyle(fontSize: 12),
                        )
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const CartPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[800], // Changed from pink to blue
                    ),
                    child: const Text(
                      'Ver Carrito',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}