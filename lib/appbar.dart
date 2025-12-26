import 'package:flutter/material.dart';
import 'l10n/app_localizations.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.tabController,
    required this.onThemeChanged,
    required this.onLocaleChanged,
    required this.onThemeColorChanged,
    required this.isDarkMode,
    required this.currentLocale,
    required this.currentSeedColor,
    required this.themeSeeds,
    required this.onCloseDrawer,
    required this.textSizeFactor,
    required this.onTextSizeChanged,
  });

  final TabController tabController;

  final Function(bool) onThemeChanged;
  final Function(Locale) onLocaleChanged;
  final Function(Color) onThemeColorChanged;
  final bool isDarkMode;
  final Locale currentLocale;
  final Color currentSeedColor;
  final List<Color> themeSeeds;
  final VoidCallback onCloseDrawer;
  final double textSizeFactor;
  final Function(double) onTextSizeChanged;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      leading: Builder(
        builder: (BuildContext context) {
          return IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          );
        },
      ),
      title: Text(l10n.appTitle),
      // title: const Text('antigravity'),
      actions: [
        PopupMenuButton<String>(
          constraints: const BoxConstraints(minWidth: 532, maxWidth: 532),
          icon: const Icon(Icons.menu), // Hamburger menu in actions
          onSelected: (String result) {
            if (result == 'about') {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    backgroundColor: Colors.yellowAccent,
                    title: Text(
                      l10n.aboutAppTitle,
                      style: TextStyle(fontSize: 20.0, color: Colors.black),
                    ),
                    content: Text(
                      l10n.aboutAppContent,
                      style: TextStyle(fontSize: 20.0, color: Colors.red),
                    ),
                  );
                },
              );
            }
          },
          itemBuilder: (BuildContext context) {
            // final l10n = AppLocalizations.of(context)!;
            return <PopupMenuEntry<String>>[
              PopupMenuItem<String>(
                value: 'home',
                child: ListTile(
                  leading: const Icon(Icons.home),
                  title: Text(l10n.home),
                  contentPadding: EdgeInsets.zero,
                  dense: true,
                ),
              ),
              PopupMenuItem<String>(
                enabled: false,
                child: ListTile(
                  leading: const Icon(Icons.language),
                  title: Text(l10n.languages),
                  contentPadding: EdgeInsets.zero,
                  dense: true,
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
              ),
              PopupMenuItem<String>(
                enabled: false,
                child: ListTile(
                  leading: const Icon(Icons.palette),
                  title: Text(l10n.theme),
                  contentPadding: EdgeInsets.zero,
                  dense: true,
                  trailing: DropdownButton<Color>(
                    value: currentSeedColor,
                    underline: const SizedBox(),
                    onChanged: (Color? color) {
                      if (color != null) {
                        onThemeColorChanged(color);
                        Navigator.pop(context);
                      }
                    },
                    items: themeSeeds.map<DropdownMenuItem<Color>>((
                      Color color,
                    ) {
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
              ),
              PopupMenuItem<String>(
                enabled: false,
                child: SwitchListTile(
                  secondary: Icon(
                    isDarkMode ? Icons.dark_mode : Icons.light_mode,
                  ),
                  title: Text(l10n.darkTheme),
                  value: isDarkMode,
                  contentPadding: EdgeInsets.zero,
                  activeThumbColor: Theme.of(context).colorScheme.primary,
                  onChanged: (bool value) {
                    onThemeChanged(value);
                    // Navigator.pop(context); // Do not pop here, as it closes the entire menu
                  },
                ),
              ),
              PopupMenuItem<String>(
                enabled: false,
                child: StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                    // Local state for the slider's position
                    double _currentSliderValue = switch (textSizeFactor) {
                      1.0 => 0,
                      1.25 => 1,
                      _ => 2,
                    }.toDouble();

                    String _getLabel(double value) {
                      return switch (value.toInt()) {
                        0 => 'Small',
                        1 => 'Medium',
                        _ => 'Large',
                      };
                    }

                    return ListTile(
                      leading: const Icon(Icons.format_size),
                      title: const Text('Text Size'),
                      subtitle: Slider(
                        value: _currentSliderValue,
                        min: 0,
                        max: 2,
                        divisions: 2,
                        label: _getLabel(_currentSliderValue),
                        onChanged: (double value) {
                          setState(() {
                            _currentSliderValue = value;
                          });
                          final newFactor = switch (value.toInt()) {
                            0 => 1.0,
                            1 => 1.25,
                            _ => 1.5,
                          };
                          onTextSizeChanged(newFactor);
                        },
                      ),
                    );
                  },
                ),
              ),
              PopupMenuItem<String>(
                value: 'close_drawer', // Unique value for this menu item
                child: ListTile(
                  leading: const Icon(Icons.close),
                  title: const Text('Close drawer'),
                  contentPadding: EdgeInsets.zero,
                  dense: true,
                ),
                onTap: () {
                  onCloseDrawer(); // Corrected: remove widget.
                  // Navigator.pop(context); // This was incorrectly closing the route
                },
              ),
              PopupMenuItem<String>(
                value: 'about',
                child: ListTile(
                  leading: const Icon(Icons.info),
                  title: Text(l10n.aboutAppMenuItem),
                  contentPadding: EdgeInsets.zero,
                  dense: true,
                ),
              ),
            ];
          },
        ),
      ],
      bottom: TabBar(
        controller: tabController,
        tabs: [
          // l10n = AppLocalizations.of(context)!;

          // Tab(icon: Icon(Icons.home), text: 'Home'),
          // Tab(icon: Icon(Icons.star), text: 'Page 2'),
          // Tab(icon: Icon(Icons.person), text: 'Page 3'),
          Tab(icon: const Icon(Icons.home), text: l10n.home),
          Tab(icon: const Icon(Icons.star), text: l10n.page2),
          Tab(icon: const Icon(Icons.person), text: l10n.page3),
        ],
      ),
    );
  }

  @override
  Size get preferredSize =>
      const Size.fromHeight(kToolbarHeight + kTextTabBarHeight);
}
