import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../core/theme/app_colors.dart';
import '../../../common_widgets/custom_text_field.dart';
import '../../../common_widgets/primary_button.dart';

class AddAccountScreen extends StatefulWidget {
  const AddAccountScreen({super.key});

  @override
  State<AddAccountScreen> createState() => _AddAccountScreenState();
}

class _AddAccountScreenState extends State<AddAccountScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isPasswordVisible = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _showSuccessDialog(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) {
        return ClipPath(
          clipper: TopCurveClipper(),
          child: Container(
            color: Colors.white,
            padding:
                const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 40),
                // Success Icon
                Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    color: Colors.green.shade100,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.check,
                    color: Colors.green,
                    size: 40,
                  ),
                ),
                const SizedBox(height: 24),
                // Title
                Text(
                  l10n.successTitle,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 12),
                // Body
                Text(
                  l10n.successBody,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 40),
                // Browse Home Button
                PrimaryButton(
                  text: l10n.loginButton,
                  onPressed: () {
                    // Navigate to Home or Login
                    Navigator.pop(context); // Close dialog
                    Navigator.pop(context); // Go back to login
                  },
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Custom Back Button
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      shape: BoxShape.circle,
                    ),
                    padding: const EdgeInsets.all(8.0),
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.black87,
                      size: 24,
                    ),
                  ),
                ),
                const SizedBox(height: 14),

                // Header
                // Header
                Center(
                  child: Text(
                    l10n.addAccountTitle,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Center(
                  child: Text(
                    l10n.createAccountSubtitle,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                      height: 1.5,
                    ),
                  ),
                ),
                const SizedBox(height: 32),

                // Social Login Buttons
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
                const SizedBox(height: 24),

                // Divider
                Row(
                  children: [
                    Expanded(child: Divider(color: Colors.grey.shade300)),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        l10n.orText,
                        style: TextStyle(color: Colors.grey[500], fontSize: 14),
                      ),
                    ),
                    Expanded(child: Divider(color: Colors.grey.shade300)),
                  ],
                ),
                const SizedBox(height: 24),

                // Name Field
                CustomTextField(
                  label: l10n.nameLabel,
                  hintText: l10n.nameHint,
                  controller: _nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return l10n.errorNameRequired;
                    }
                    return null;
                  },
                ),

                // Email Field
                CustomTextField(
                  label: l10n.emailLabel,
                  hintText: l10n.emailHint,
                  controller: _emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return l10n.errorEmailRequired;
                    }
                    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
                    if (!emailRegex.hasMatch(value)) {
                      return l10n.errorEmailInvalid;
                    }
                    return null;
                  },
                ),

                // Password Field
                CustomTextField(
                  label: l10n.passwordLabel,
                  hintText: l10n.passwordHint,
                  obscureText: !_isPasswordVisible,
                  controller: _passwordController,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return l10n.errorPasswordRequired;
                    }
                    if (value.length < 6) {
                      return l10n.errorPasswordLength;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                // Register Button
                PrimaryButton(
                  text: l10n.registerButton,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _showSuccessDialog(context);
                    }
                  },
                ),
                const SizedBox(height: 30),

                // Login Link
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      l10n.alreadyHaveAccount,
                      style: const TextStyle(
                        color: Colors.black87,
                        fontSize: 14,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        l10n.loginLink,
                        style: TextStyle(
                          color: AppColors.primary,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TopCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(0, 40);
    path.quadraticBezierTo(size.width / 2, 0, size.width, 40);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
