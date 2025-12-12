import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'ad_banner.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:url_launcher/url_launcher.dart';
import 'l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isAndroid || Platform.isIOS) {
    await Firebase.initializeApp();
    MobileAds.instance.initialize();
  }
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.light;
  Locale _locale = const Locale('en');
  Color _seedColor = Colors.green;

  final List<Color> _themeSeeds = [
    Colors.green,
    Colors.blue,
    Colors.red,
    Colors.purple,
    Colors.orange,
    Colors.teal,
    Colors.pink,
    Colors.indigo,
    Colors.amber,
    Colors.brown,
    Colors.cyan,
    Colors.deepOrange,
  ];

  void _toggleTheme(bool isDark) {
    setState(() {
      _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    });
  }

  void _changeLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  void _changeThemeColor(Color color) {
    setState(() {
      _seedColor = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateTitle: (context) => AppLocalizations.of(context)!.appTitle,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('fr'),
        Locale('de'),
        Locale('es'),
        Locale('nl'),
        Locale('da'),
        Locale('ja'),
        Locale('zh'),
        Locale('yue'),
        Locale('uk'),
        Locale('es', '419'),
        Locale('it'),
        Locale('ga'),
      ],
      locale: _locale,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: _seedColor),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: _seedColor,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      themeMode: _themeMode,
      home: MyHomePage(
        onThemeChanged: _toggleTheme,
        onLocaleChanged: _changeLocale,
        onThemeColorChanged: _changeThemeColor,
        isDarkMode: _themeMode == ThemeMode.dark,
        currentLocale: _locale,
        currentSeedColor: _seedColor,
        themeSeeds: _themeSeeds,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
    required this.onThemeChanged,
    required this.onLocaleChanged,
    required this.onThemeColorChanged,
    required this.isDarkMode,
    required this.currentLocale,
    required this.currentSeedColor,
    required this.themeSeeds,
  });

  final Function(bool) onThemeChanged;
  final Function(Locale) onLocaleChanged;
  final Function(Color) onThemeColorChanged;
  final bool isDarkMode;
  final Locale currentLocale;
  final Color currentSeedColor;
  final List<Color> themeSeeds;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(l10n.homePageTitle),
      ),
      drawer: SizedBox(
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
                  value: widget.currentLocale,
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
                      widget.onLocaleChanged(locale);
                      Navigator.pop(context);
                    }
                  },
                ),
              ),
              ListTile(
                leading: const Icon(Icons.palette),
                title: Text(l10n.theme),
                trailing: DropdownButton<Color>(
                  value: widget.currentSeedColor,
                  underline: const SizedBox(),
                  onChanged: (Color? color) {
                    if (color != null) {
                      widget.onThemeColorChanged(color);
                      Navigator.pop(context);
                    }
                  },
                  items: widget.themeSeeds.map<DropdownMenuItem<Color>>((
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
              SwitchListTile(
                secondary: Icon(
                  widget.isDarkMode ? Icons.dark_mode : Icons.light_mode,
                ),
                title: Text(l10n.darkTheme),
                value: widget.isDarkMode,
                onChanged: (bool value) {
                  widget.onThemeChanged(value);
                },
              ),
            ],
          ),
        ),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const AdBanner(),
            Text(l10n.counterText),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
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
            const Spacer(),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: widget.themeSeeds.map((color) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: GestureDetector(
                      onTap: () => widget.onThemeColorChanged(color),
                      child: Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          color: color,
                          shape: BoxShape.circle,
                          border: widget.currentSeedColor == color
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
                Expanded(child: Image.asset('assets/gopher_classic.png')),
                Expanded(child: Image.asset('assets/gopher_3d.png')),
                Expanded(child: Image.asset('assets/gopher_pixel.png')),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: l10n.increment,
        child: const Icon(Icons.add),
      ),
    );
  }
}
