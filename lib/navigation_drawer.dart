import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'l10n/app_localizations.dart';

class AppNavigationDrawer extends StatelessWidget {
  const AppNavigationDrawer({
    super.key,
    required this.onTabChanged,
    required this.onThemeChanged,
    required this.onLocaleChanged,
    required this.onThemeColorChanged,
    required this.isDarkMode,
    required this.currentLocale,
    required this.currentSeedColor,
    required this.themeSeeds,
  });

  final Function(int) onTabChanged;

  final Function(bool) onThemeChanged;
  final Function(Locale) onLocaleChanged;
  final Function(Color) onThemeColorChanged;
  final bool isDarkMode;
  final Locale currentLocale;
  final Color currentSeedColor;
  final List<Color> themeSeeds;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return SizedBox(
      width: 456, // 50% wider than default 304px
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
              ),
              child: Text(
                l10n.drawerTitle,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.looks_one),
              title: Text(l10n.page1),
              onTap: () {
                onTabChanged(0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.looks_two),
              title: Text(l10n.page2),
              onTap: () {
                onTabChanged(1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.looks_3),
              title: Text(l10n.page3),
              onTap: () {
                onTabChanged(2);
                Navigator.pop(context);
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.home),
              title: Text(l10n.home),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.open_in_browser),
              title: Text(l10n.pubDev),
              onTap: () {
                Navigator.pop(context);
                launchUrl(Uri.parse('https://pub.dev'));
              },
            ),
            ListTile(
              leading: const Icon(Icons.code),
              title: Text(l10n.golangOrg),
              onTap: () {
                Navigator.pop(context);
                launchUrl(Uri.parse('https://golang.org'));
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.language),
              title: Text(l10n.languages),
              trailing: DropdownButton<Locale>(
                value: currentLocale,
                underline: const SizedBox(),
                items: [
                  DropdownMenuItem(
                    value: const Locale('en'),
                    child: Text(l10n.english),
                  ),
                  DropdownMenuItem(
                    value: const Locale('fr'),
                    child: Text(l10n.french),
                  ),
                  DropdownMenuItem(
                    value: const Locale('de'),
                    child: Text(l10n.german),
                  ),
                  DropdownMenuItem(
                    value: const Locale('es'),
                    child: Text(l10n.spanish),
                  ),
                  DropdownMenuItem(
                    value: const Locale('nl'),
                    child: Text(l10n.dutch),
                  ),
                  DropdownMenuItem(
                    value: const Locale('da'),
                    child: Text(l10n.danish),
                  ),
                  DropdownMenuItem(
                    value: const Locale('ja'),
                    child: Text(l10n.japanese),
                  ),
                  DropdownMenuItem(
                    value: const Locale('zh'),
                    child: Text(l10n.mandarin),
                  ),
                  DropdownMenuItem(
                    value: const Locale('yue'),
                    child: Text(l10n.cantonese),
                  ),
                  DropdownMenuItem(
                    value: const Locale('uk'),
                    child: Text(l10n.ukrainian),
                  ),
                  DropdownMenuItem(
                    value: const Locale('es', '419'),
                    child: Text(l10n.latinAmericanSpanish),
                  ),
                  DropdownMenuItem(
                    value: const Locale('it'),
                    child: Text(l10n.italian),
                  ),
                  DropdownMenuItem(
                    value: const Locale('ga'),
                    child: Text(l10n.irish),
                  ),
                ],
                onChanged: (Locale? locale) {
                  if (locale != null) {
                    onLocaleChanged(locale);
                    Navigator.pop(context);
                  }
                },
              ),
            ),
            ListTile(
              leading: const Icon(Icons.palette),
              title: Text(l10n.theme),
              trailing: DropdownButton<Color>(
                value: currentSeedColor,
                underline: const SizedBox(),
                onChanged: (Color? color) {
                  if (color != null) {
                    onThemeColorChanged(color);
                    Navigator.pop(context);
                  }
                },
                items: themeSeeds.map<DropdownMenuItem<Color>>((Color color) {
                  return DropdownMenuItem<Color>(
                    value: color,
                    child: Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        color: color,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.grey, width: 1),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            SwitchListTile(
              secondary: Icon(isDarkMode ? Icons.dark_mode : Icons.light_mode),
              title: Text(l10n.darkTheme),
              value: isDarkMode,
              onChanged: (bool value) {
                onThemeChanged(value);
              },
            ),
          ],
        ),
      ),
    );
  }
}
