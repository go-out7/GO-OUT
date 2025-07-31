import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isNameValid = false;
  bool isEmailValid = false;
  bool isPasswordValid = false;

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  bool get isFormValid => isNameValid && isEmailValid && isPasswordValid;

  void _validateFields() {
    setState(() {
      isNameValid = nameController.text.trim().length >= 3;
      isEmailValid = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$").hasMatch(emailController.text.trim());
      isPasswordValid = passwordController.text.length >= 6;
    });
  }

  Color _getFieldColor(bool isValid) {
    return isValid ? Colors.green.withOpacity(0.2) : Colors.red.withOpacity(0.2);
  }

  Icon? _getSuffixIcon(bool isValid, String text) {
    if (text.isEmpty) return null;
    return Icon(isValid ? Icons.check_circle : Icons.close, color: isValid ? Colors.green : Colors.red);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 🖼 خلفية
          SizedBox.expand(
            child: Image.asset(
              'assets/loading screen.png',
              fit: BoxFit.cover,
            ),
          ),

          // 🧊 Container بـ Glass Effect
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
                        border: Border.all(color: Colors.white.withOpacity(0.2)),
                      ),
                      child: Form(
                        key: _formKey,
                        onChanged: _validateFields,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Create an account",
                              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              "Let’s create your account.",
                              style: TextStyle(fontSize: 16, color: Colors.white70),
                            ),
                            const SizedBox(height: 24),

                            _buildValidatedTextField(
                              label: "Full Name",
                              controller: nameController,
                              isValid: isNameValid,
                            ),

                            const SizedBox(height: 16),

                            _buildValidatedTextField(
                              label: "Email",
                              controller: emailController,
                              isValid: isEmailValid,
                              keyboardType: TextInputType.emailAddress,
                            ),

                            const SizedBox(height: 16),

                            _buildValidatedTextField(
                              label: "Password",
                              controller: passwordController,
                              isValid: isPasswordValid,
                              obscureText: true,
                            ),

                            const SizedBox(height: 16),

                            Text.rich(
                              TextSpan(
                                style: const TextStyle(color: Colors.white70, fontSize: 12),
                                children: [
                                  const TextSpan(text: "By signing up you agree to our "),
                                  TextSpan(text: "Terms", style: const TextStyle(decoration: TextDecoration.underline)),
                                  const TextSpan(text: ", "),
                                  TextSpan(text: "Privacy Policy", style: const TextStyle(decoration: TextDecoration.underline)),
                                  const TextSpan(text: ", and "),
                                  TextSpan(text: "Cookie Use", style: const TextStyle(decoration: TextDecoration.underline)),
                                ],
                              ),
                            ),

                            const SizedBox(height: 20),

                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: isFormValid ? Colors.white : Colors.white24,
                                  foregroundColor: Colors.black,
                                  padding: const EdgeInsets.symmetric(vertical: 16),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                ),
                                onPressed: () {
                                  if (isFormValid) {
                                    print("Creating account...");
                                    // هنا تقدر تحط كود التسجيل الحقيقي
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: const Text(
                                          "❌ Error: Please check your info and try again!",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        backgroundColor: Colors.redAccent,
                                        behavior: SnackBarBehavior.floating,
                                        margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                        duration: const Duration(seconds: 2),
                                      ),
                                    );
                                  }
                                },
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
                              icon: const FaIcon(FontAwesomeIcons.google, color: Colors.white),
                              label: "Sign Up with Google",
                              onPressed: () {},
                            ),

                            const SizedBox(height: 12),

                            _buildSocialButton(
                              icon: const FaIcon(FontAwesomeIcons.facebookF, color: Colors.white),
                              label: "Sign Up with Facebook",
                              backgroundColor: const Color(0xFF1877F2),
                              onPressed: () {},
                            ),

                            const SizedBox(height: 20),

                            Center(
                              child: TextButton(
                                onPressed: () {},
                                child: const Text("Already have an account? Log In", style: TextStyle(color: Colors.white)),
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
          ),
        ],
      ),
    );
  }

  Widget _buildValidatedTextField({
    required String label,
    required TextEditingController controller,
    required bool isValid,
    bool obscureText = false,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      onChanged: (_) => _validateFields(),
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.white54),
        filled: true,
        fillColor: controller.text.isEmpty ? Colors.white12 : _getFieldColor(isValid),
        suffixIcon: _getSuffixIcon(isValid, controller.text),
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
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }
}
