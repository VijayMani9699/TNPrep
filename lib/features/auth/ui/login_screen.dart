import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../common_widgets/custom_text_field.dart';
import '../../../common_widgets/primary_button.dart';

import '../../../common_widgets/settings_sheet.dart';
import 'add_account_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            padding:
                const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Language Icon
                Align(
                  alignment: Alignment.topRight,
                  child: Transform.translate(
                    offset: const Offset(12, -12), // Move slightly right and up
                    child: IconButton(
                      icon: const Icon(Icons.settings, color: Colors.black87),
                      onPressed: () {
                        showCupertinoModalPopup(
                          context: context,
                          builder: (context) => const SettingsSheet(),
                        );
                      },
                    ),
                  ),
                ),
                // Header
                const Text(
                  "Welcome Back",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "Stay connected by signing in with your email and password to access your account",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 32),

                // InputsS
                const CustomTextField(
                  label: "Email",
                  hintText: "Enter your email",
                ),

                const CustomTextField(
                  label: "Password",
                  hintText: "Enter your password",
                  obscureText: true,
                  suffixIcon:
                      Icon(Icons.visibility_off_outlined, color: Colors.grey),
                ),

                // Forgot Password
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: Size.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: const Text(
                      "Forgot Password?",
                      style: TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
const SizedBox(height: 10),
                // Login Button
                PrimaryButton(
                  text: "Log In",
                  onPressed: () {},
                ),

                const SizedBox(height: 24),

                // Divider
                Row(
                  children: [
                    Expanded(child: Divider(color: Colors.grey.shade300)),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        "Or Log In With",
                        style: TextStyle(color: Colors.grey.shade500),
                      ),
                    ),
                    Expanded(child: Divider(color: Colors.grey.shade300)),
                  ],
                ),
                const SizedBox(height: 24),

                // Social Login
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.g_translate,
                          color: Colors.black,
                        ), // Placeholder for Google Logo
                        label: const Text(
                          'Google',
                          style: TextStyle(color: Colors.black87),
                        ),
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          side: BorderSide(color: Colors.grey.shade300),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.apple, color: Colors.black),
                        label: const Text(
                          'Apple',
                          style: TextStyle(color: Colors.black87),
                        ),
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          side: BorderSide(color: Colors.grey.shade300),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 32),

                // Footer
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't Have An Account? ",
                      style: TextStyle(color: Colors.grey.shade600),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AddAccountScreen()),
                        );
                      },
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ));
  }
}
