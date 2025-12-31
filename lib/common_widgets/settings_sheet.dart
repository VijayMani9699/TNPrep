import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsSheet extends StatefulWidget {
  const SettingsSheet({super.key});

  @override
  State<SettingsSheet> createState() => _SettingsSheetState();
}

class _SettingsSheetState extends State<SettingsSheet> {
  // Temporary state for demonstration
  int _languageGroupValue = 0;
  int _themeGroupValue = 2; // Default to System

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Drag Handle
            Align(
              alignment: Alignment.center,
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Title
            const Center(
              child: Text(
                "Settings",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Language Section
            const Text(
              "Language Settings",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: CupertinoSlidingSegmentedControl<int>(
                groupValue: _languageGroupValue,
                children: const {
                  0: Text("English"),
                  1: Text("Tamil"),
                },
                onValueChanged: (int? value) {
                  if (value != null) {
                    setState(() {
                      _languageGroupValue = value;
                    });
                  }
                },
                backgroundColor: Colors.grey.shade200,
                thumbColor: Colors.white,
              ),
            ),
            const SizedBox(height: 16),

            // Appearance Section
            const Text(
              "Appearance",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: CupertinoSlidingSegmentedControl<int>(
                groupValue: _themeGroupValue,
                children: const {
                  0: Text("Light"),
                  1: Text("Dark"),
                  2: Text("System"),
                },
                onValueChanged: (int? value) {
                  if (value != null) {
                    setState(() {
                      _themeGroupValue = value;
                    });
                  }
                },
                backgroundColor: Colors.grey.shade200,
                thumbColor: Colors.white,
              ),
            ),
            const SizedBox(height: 20), // Bottom padding
          ],
        ),
      ),
    );
  }
}
