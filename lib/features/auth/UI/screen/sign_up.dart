import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 🔲 خلفية الصورة
          SizedBox.expand(
            child: Image.asset(
              'assets/loading screen.png',
              fit: BoxFit.cover,
            ),
          ),

          // 🧊 Glassmorphic Container
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                    child: Container(
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(
                          color: Colors.white.withOpacity(0.2),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Create an account",
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            "Let’s create your account.",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white70,
                            ),
                          ),
                          const SizedBox(height: 24),
                          _buildTextField(label: "Full Name"),
                          const SizedBox(height: 16),
                          _buildTextField(label: "Email"),
                          const SizedBox(height: 16),
                          _buildTextField(label: "password", obscureText: true),
                          const SizedBox(height: 16),
                          Text.rich(
                            TextSpan(
                              style: const TextStyle(color: Colors.white70, fontSize: 12),
                              children: [
                                const TextSpan(text: "By signing up you agree to our "),
                                TextSpan(
                                  text: "Terms",
                                  style: const TextStyle(decoration: TextDecoration.underline),
                                ),
                                const TextSpan(text: ", "),
                                TextSpan(
                                  text: "Privacy Policy",
                                  style: const TextStyle(decoration: TextDecoration.underline),
                                ),
                                const TextSpan(text: ", and "),
                                TextSpan(
                                  text: "Cookie Use",
                                  style: const TextStyle(decoration: TextDecoration.underline),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white10,
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(vertical: 16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              onPressed: () {},
                              child: const Text("Create an Account"),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: const [
                              Expanded(child: Divider(color: Colors.white24)),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                child: Text("Or", style: TextStyle(color: Colors.white60)),
                              ),
                              Expanded(child: Divider(color: Colors.white24)),
                            ],
                          ),
                          const SizedBox(height: 16),
                          _buildSocialButton(
                            icon: FaIcon(FontAwesomeIcons.google, color: Colors.white),
                            label: "Sign Up with Google",
                            onPressed: () {},
                          ),
                          const SizedBox(height: 12),
                          _buildSocialButton(
                            icon: FaIcon(FontAwesomeIcons.facebookF, color: Colors.white),
                            label: "Sign Up with Facebook",
                            backgroundColor: const Color(0xFF1877F2),
                            onPressed: () {},
                          ),
                          const SizedBox(height: 20),
                          Center(
                            child: TextButton(
                              onPressed: () {},
                              child: const Text(
                                "Already have an account? Log In",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({required String label, bool obscureText = false}) {
    return TextField(
      obscureText: obscureText,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.white54),
        filled: true,
        fillColor: Colors.white12,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _buildSocialButton({
    required Widget icon,
    required String label,
    required VoidCallback onPressed,
    Color? backgroundColor,
  }) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        icon: icon,
        label: Text(label),
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? Colors.white12,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
