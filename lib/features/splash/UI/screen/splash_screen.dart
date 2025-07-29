import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Background waves image
          Positioned.fill(
            child: Image.asset(
              'assets/loading screen.png', // ضع صورة الخلفية هنا
              fit: BoxFit.cover,
            ),
          ),

          // Content in center
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Logo in the center
                Container(
                  height: 563,
                  width: 563,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    //color: Colors.black.withOpacity(0.6),
                  ),
                  padding: const EdgeInsets.all(20),
                  child: Image.asset(
                    'assets/Logo__Go_Out__with_Social_Elements-removebg-preview.png', // ضع شعار التطبيق هنا
                    fit: BoxFit.contain,
                    //color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),

                // Loading circle
                const CircularProgressIndicator(

                  color: Colors.white,
                  strokeWidth: 2.5,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
