import 'package:flutter/material.dart';
import 'package:go_out/features/auth/UI/screen/sign_up.dart';

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
                    'assets/Logo__Go_Out__with_Social_Elements-removebg-preview.png', // تأكد من اسم الملف
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(height: 50),
                HoverGlowButton(
                  label: 'Create account',
                  icon: Icons.arrow_forward_ios,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SignUpScreen()),
                    );
                  },
                ),
                const SizedBox(height: 20),
                HoverGlowButton(
                  label: 'Log in',
                  onTap: () {
                    Navigator.pushNamed(context, '/login');
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

class HoverGlowButton extends StatefulWidget {
  final String label;
  final IconData? icon;
  final VoidCallback onTap;

  const HoverGlowButton({
    super.key,
    required this.label,
    this.icon,
    required this.onTap,
  });

  @override
  State<HoverGlowButton> createState() => _HoverGlowButtonState();
}

class _HoverGlowButtonState extends State<HoverGlowButton> {
  bool _isHovered = false;
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        onTapDown: (_) => setState(() => _isPressed = true),
        onTapUp: (_) => setState(() => _isPressed = false),
        onTapCancel: () => setState(() => _isPressed = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: 250,
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.8),
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: _isHovered ? Color(0xff0932CC) : Colors.transparent,
              width: 1.5,
            ),
            boxShadow: _isHovered || _isPressed
                ? [
              BoxShadow(
                color: Color(0xff0932CC).withOpacity(_isPressed ? 0.6 : 0.4),
                blurRadius: _isPressed ? 50 : 30,
                spreadRadius: _isPressed ? 15 : 5,
                offset: Offset.zero,
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
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
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
      ),
    );
  }
}