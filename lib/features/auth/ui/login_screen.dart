import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../common_widgets/custom_text_field.dart';
import '../../../common_widgets/primary_button.dart';
import '../../../common_widgets/social_login_button.dart';
import 'add_account_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
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
                      // TODO: Implement language selection
                    },
                  ),
                ),
              ),
              // Header
              const Text(
                "Log Account",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "Hello, Welcome back to our account!",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey.shade600,
                ),
              ),
              const SizedBox(height: 48),

              // Inputs
              const CustomTextField(
                label: "Email",
                hintText: "Enter your email",
              ),
              const SizedBox(height: 24),
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
                  child: const Text(
                    "Forgot Password?",
                    style: TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Login Button
              PrimaryButton(
                text: "Log In",
                onPressed: () {},
              ),

              const SizedBox(height: 32),

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
              const SizedBox(height: 32),

              // Social Login
              Row(
                children: [
                  SocialLoginButton(
                    text: "Google",
                    icon: Icons
                        .g_mobiledata, // Using a standard icon as placeholder
                    iconColor: Colors.red,
                    onPressed: () {},
                  ),
                  const SizedBox(width: 16),
                  SocialLoginButton(
                    text: "Apple",
                    icon: Icons.apple,
                    iconColor: Colors.black,
                    onPressed: () {},
                  ),
                ],
              ),

              const SizedBox(height: 48),

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
      ),
    );
  }
}
