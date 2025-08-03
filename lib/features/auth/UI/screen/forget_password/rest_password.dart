import 'dart:ui';
import 'package:flutter/material.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  bool _isPasswordMatching = false;

  void _validatePasswords(String _) {
    setState(() {
      _isPasswordMatching = _newPasswordController.text == _confirmPasswordController.text &&
          _newPasswordController.text.isNotEmpty;
    });
  }

  Color _getFieldColor(String value) {
    if (value.isEmpty) return Colors.white12;
    return _isPasswordMatching ? Colors.green.withOpacity(0.15) : Colors.red.withOpacity(0.15);
  }

  Icon? _getSuffixIcon(String value) {
    if (value.isEmpty) return null;
    return Icon(
      _isPasswordMatching ? Icons.check_circle : Icons.cancel,
      color: _isPasswordMatching ? Colors.green : Colors.red,
    );
  }

  @override
  void dispose() {
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/loading screen.png', // الخلفية
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.white30),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Reset Password",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "Set the new password for your account so you can login and access all the features.",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white70,
                          ),
                        ),
                        const SizedBox(height: 24),

                        // New Password
                        TextField(
                          controller: _newPasswordController,
                          obscureText: true,
                          onChanged: _validatePasswords,
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            labelText: "New password",
                            labelStyle: const TextStyle(color: Colors.white70),
                            filled: true,
                            fillColor: _getFieldColor(_newPasswordController.text),
                            suffixIcon: _getSuffixIcon(_newPasswordController.text),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),

                        const SizedBox(height: 16),

                        // Confirm Password
                        TextField(
                          controller: _confirmPasswordController,
                          obscureText: true,
                          onChanged: _validatePasswords,
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            labelText: "Confirm password",
                            labelStyle: const TextStyle(color: Colors.white70),
                            filled: true,
                            fillColor: _getFieldColor(_confirmPasswordController.text),
                            suffixIcon: _getSuffixIcon(_confirmPasswordController.text),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),

                        const SizedBox(height: 24),

                        // Button
                        GestureDetector(
                          onTap: () {
                            if (_isPasswordMatching) {
                              // TODO: Proceed to reset password
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    "Passwords do not match!",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  backgroundColor: Colors.redAccent,
                                  duration: Duration(seconds: 2),
                                  behavior: SnackBarBehavior.floating,
                                ),
                              );
                            }
                          },
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.15),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.white30),
                            ),
                            child: const Center(
                              child: Text(
                                "Continue",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
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
}
