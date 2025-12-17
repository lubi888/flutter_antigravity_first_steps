import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'page1.dart';
import 'page2.dart';
import 'page3.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'appbar.dart';
import 'navigation_drawer.dart';
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

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  int _counter = 0;
  late TabController _tabController;

  void _changeTab(int tabIndex) {
    setState(() {
      _tabController.index = tabIndex;
    });
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

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
      appBar: CustomAppBar(
        tabController: _tabController,
        onThemeChanged: widget.onThemeChanged,
        onLocaleChanged: widget.onLocaleChanged,
        onThemeColorChanged: widget.onThemeColorChanged,
        isDarkMode: widget.isDarkMode,
        currentLocale: widget.currentLocale,
        currentSeedColor: widget.currentSeedColor,
        themeSeeds: widget.themeSeeds,
      ),
      drawer: AppNavigationDrawer(
        onTabChanged: _changeTab,
        onThemeChanged: widget.onThemeChanged,
        onLocaleChanged: widget.onLocaleChanged,
        onThemeColorChanged: widget.onThemeColorChanged,
        isDarkMode: widget.isDarkMode,
        currentLocale: widget.currentLocale,
        currentSeedColor: widget.currentSeedColor,
        themeSeeds: widget.themeSeeds,
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Page1(
            counter: _counter,
            themeSeeds: widget.themeSeeds,
            currentSeedColor: widget.currentSeedColor,
            onThemeColorChanged: widget.onThemeColorChanged,
          ),
          const Page2(),
          const Page3(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: l10n.increment,
        child: const Icon(Icons.add),
      ),
    );
  }
}
