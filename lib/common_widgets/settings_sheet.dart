import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../core/localization/locale_provider.dart';

class SettingsSheet extends StatefulWidget {
  const SettingsSheet({super.key});

  @override
  State<SettingsSheet> createState() => _SettingsSheetState();
}

class _SettingsSheetState extends State<SettingsSheet> {
  // Temporary state for demonstration
  int _themeGroupValue = 2; // Default to System

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final localeProvider = Provider.of<LocaleProvider>(context);

    // Map language code to index for the segmented control
    int languageGroupValue = localeProvider.locale.languageCode == 'ta' ? 1 : 0;

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
            Center(
              child: Text(
                l10n.settingsTitle,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Language Section
            Text(
              l10n.languageSettings,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: CupertinoSlidingSegmentedControl<int>(
                groupValue: languageGroupValue,
                children: {
                  0: Text(l10n.english),
                  1: Text(l10n.tamil),
                },
                onValueChanged: (int? value) {
                  if (value != null) {
                    final newLocale =
                        value == 1 ? const Locale('ta') : const Locale('en');
                    localeProvider.setLocale(newLocale);
                  }
                },
                backgroundColor: Colors.grey.shade200,
                thumbColor: Colors.white,
              ),
            ),
            const SizedBox(height: 16),

            // Appearance Section
            Text(
              l10n.appearance,
              style: const TextStyle(
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
                children: {
                  0: Text(l10n.light),
                  1: Text(l10n.dark),
                  2: Text(l10n.system),
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
