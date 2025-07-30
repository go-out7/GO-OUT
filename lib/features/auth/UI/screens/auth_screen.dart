import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
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
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Image.asset(
                    'assets/Logo__Go_Out__with_Social_Elements-removebg-preview.png',
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(height: 50),
                GlowButton(
                  label: 'Create account',
                  icon: Icons.arrow_forward_ios,
                  onTap: () {
                    // Navigate to create account page
                  },
                ),
                const SizedBox(height: 20),
                GlowButton(
                  label: 'Log in',
                  onTap: () {
                    // Navigate to login page
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class GlowButton extends StatefulWidget {
  final String label;
  final IconData? icon;
  final VoidCallback onTap;

  const GlowButton({
    super.key,
    required this.label,
    this.icon,
    required this.onTap,
  });

  @override
  State<GlowButton> createState() => _GlowButtonState();
}

class _GlowButtonState extends State<GlowButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) => setState(() => _isPressed = false),
      onTapCancel: () => setState(() => _isPressed = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        width: 250,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.8), // الخلفية سودة
          borderRadius: BorderRadius.circular(15),
          boxShadow: _isPressed
              ? [
            BoxShadow(
              color: Color(0xff0932CC).withOpacity(0.6),
              blurRadius: 70,
              spreadRadius: 15,
              offset: const Offset(0,0),
            ),
          ]
              : [],
        ),
        child: Row(
          mainAxisAlignment: widget.icon != null
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.center,
          children: [
            Text(
              widget.label,
              style: const TextStyle(color: Colors.white, fontSize: 16 ),
            ),
            if (widget.icon != null)
              Icon(
                widget.icon,
                color: Colors.white,
                size: 16,
              ),
          ],
        ),
      ),
    );
  }
}
