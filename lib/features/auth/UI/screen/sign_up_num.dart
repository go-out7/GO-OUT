import 'dart:ui';
import 'package:flutter/material.dart';

import 'OTP.dart';

class SignUpScreennum extends StatefulWidget {
  const SignUpScreennum({super.key});

  @override
  State<SignUpScreennum> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreennum> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneController = TextEditingController();
  bool _isSubmitted = false;
  bool _isValid = false;

  bool _isPhoneValid(String phone) {
    final regex = RegExp(r'^(0|1)[0-9]{9,10}$');
    return regex.hasMatch(phone);
  }

  @override
  void initState() {
    super.initState();

    _phoneController.addListener(() {
      final valid = _isPhoneValid(_phoneController.text);
      if (_isValid != valid) {
        setState(() {
          _isValid = valid;
        });
      }
    });
  }

  void _submit() {
    final isFormValid = _formKey.currentState!.validate();

    setState(() {
      _isSubmitted = true;
      _isValid = isFormValid;
    });

    if (isFormValid) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const OtpScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Invalid phone number, please try again.'),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final inputValid = _isPhoneValid(_phoneController.text);
    final borderColor = _phoneController.text.isEmpty
        ? Colors.white.withOpacity(0.3)
        : (inputValid ? Colors.green : Colors.red);

    final fillColor = _phoneController.text.isEmpty
        ? Colors.white.withOpacity(0.1)
        : (inputValid
        ? Colors.green.withOpacity(0.2)
        : Colors.red.withOpacity(0.2));

    final icon = _phoneController.text.isEmpty
        ? null
        : (inputValid
        ? const Icon(Icons.check_circle, color: Colors.green)
        : const Icon(Icons.error, color: Colors.red));

    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/loading screen.png',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
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
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.white30),
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            'Enter Your Phone Number',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              const Text(
                                '+20',
                                style: TextStyle(color: Colors.white),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: TextFormField(
                                  controller: _phoneController,
                                  keyboardType: TextInputType.phone,
                                  style: const TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                    hintText: '10XXXXXXXX',
                                    hintStyle:
                                    const TextStyle(color: Colors.white54),
                                    filled: true,
                                    fillColor: fillColor,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: BorderSide.none,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: BorderSide(color: borderColor),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: BorderSide(color: borderColor),
                                    ),
                                    suffixIcon: icon,
                                  ),
                                  validator: (value) {
                                    if (!_isPhoneValid(value ?? '')) {
                                      return 'Invalid phone number';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 30),
                          GestureDetector(
                            onTap: _submit,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: BackdropFilter(
                                filter:
                                ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                                child: Container(
                                  padding:
                                  const EdgeInsets.symmetric(vertical: 16),
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.15),
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(color: Colors.white30),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      'Create Account',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
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
          ),
        ],
      ),
    );
  }
}

class NextScreen extends StatelessWidget {
  const NextScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("Next Page")),
    );
  }
}
