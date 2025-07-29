import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/loading screen.png',
              fit: BoxFit.cover,
            ),
          ),


          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height:200,
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  //padding: const EdgeInsets.all(20),
                  child: Image.asset(
                    'assets/Logo__Go_Out__with_Social_Elements-removebg-preview.png',
                    fit: BoxFit.contain,

                  ),
                ),
                const SizedBox(height: 50),

                // زر إنشاء حساب
                _glowButton(
                  backgroundColor: Colors.black,
                  context: context,
                  label: 'Create account',
                  icon: Icons.arrow_forward_ios,
                  onTap: () {
                    // navigate to create account page
                  },
                ),
                const SizedBox(height: 20),

                // زر تسجيل الدخول
                _glowButton(
                  backgroundColor: Colors.black,
                  context: context,
                  label: 'Log in',
                  onTap: () {
                    // navigate to login page
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _glowButton({
    required BuildContext context,
    required String label,
    IconData? icon,
    required VoidCallback onTap, required Color backgroundColor,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(15),
      splashColor: Colors.white.withOpacity(0.2),
      highlightColor: Colors.white.withOpacity(0.05),
      child: Ink(
        width: 250,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.7),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.blueAccent.withOpacity(0.3),
              blurRadius: 15,
              spreadRadius: 1,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: icon != null
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.center,
          children: [
            Text(
              label,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
            if (icon != null)
              Icon(
                icon,
                color: Colors.white,
                size: 16,
              ),
          ],
        ),
      ),
    );
  }
}