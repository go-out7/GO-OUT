import 'package:flutter/material.dart';

class navbar extends StatefulWidget {
  const navbar({super.key});

  @override
  State<navbar> createState() => _CustomBottomBarScreenState();
}

class _CustomBottomBarScreenState extends State<navbar> {
  int _currentIndex = 2;

  final List<String> _titles = [
    'Saved Page',
    'Map Page',
    'Home Page',
    'Search Page',
    'Account Page',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Text(
          _titles[_currentIndex],
          style: const TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
      bottomNavigationBar: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: 70,
            width: 367,
            margin: const EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(40),
            ),
            //margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildIcon(Icons.favorite_border, 'Saved', 0),
                _buildIcon(Icons.map_outlined, 'Map', 1),
                _buildIcon(Icons.home_filled, 'Home', 2),
                _buildIcon(Icons.search, 'Search', 3),
                _buildIcon(Icons.person_outline, 'Account', 4),
              ],
            ),
          ),
          // Positioned(
          //   bottom: 25,
          //   child: FloatingActionButton(
          //     backgroundColor: Colors.black,
          //     elevation: 0,
          //     onPressed: () {
          //       setState(() {
          //         _currentIndex = 2;
          //       });
          //     },
          //     child: const Icon(
          //       Icons.home_outlined,
          //       color: Colors.white,
          //       fill: null,
          //       size: 32,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget _buildIcon(IconData icon, String label, int index) {
    final bool isSelected = _currentIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _currentIndex = index;
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.white, size: isSelected ? 28 : 24),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: Colors.white.withOpacity(0.9),
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          )
        ],
      ),
    );
  }
}
