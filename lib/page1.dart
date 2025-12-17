import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'l10n/app_localizations.dart';
import 'ad_banner.dart';

class Page1 extends StatelessWidget {
  const Page1({
    super.key,
    required this.counter,
    required this.themeSeeds,
    required this.currentSeedColor,
    required this.onThemeColorChanged,
  });

  final int counter;
  final List<Color> themeSeeds;
  final Color currentSeedColor;
  final Function(Color) onThemeColorChanged;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const AdBanner(),
            Text(l10n.counterText),
            Text('$counter', style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 20),
            InkWell(
              onTap: () => launchUrl(Uri.parse('https://pub.dev')),
              child: Text(
                l10n.goToPubDev,
                style: const TextStyle(
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                  fontSize: 22,
                ),
              ),
            ),
            const SizedBox(height: 20),
            InkWell(
              onTap: () => launchUrl(Uri.parse('https://golang.org')),
              child: Text(
                l10n.goToGolangOrg,
                style: const TextStyle(
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                  fontSize: 22,
                ),
              ),
            ),
            const SizedBox(height: 32),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: themeSeeds.map((color) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: GestureDetector(
                      onTap: () => onThemeColorChanged(color),
                      child: Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          color: color,
                          shape: BoxShape.circle,
                          border: currentSeedColor == color
                              ? Border.all(
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.onSurface,
                                  width: 3,
                                )
                              : null,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Semantics(
                    label: l10n.gopherNought,
                    child: Image.asset('assets/gopher_classic.png'),
                  ),
                ),
                Expanded(
                  child: Semantics(
                    label: l10n.gopherOne,
                    child: Image.asset('assets/gopher_3d.png'),
                  ),
                ),
                Expanded(
                  child: Semantics(
                    label: l10n.gopherTwo,
                    child: Image.asset('assets/gopher_pixel.png'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
