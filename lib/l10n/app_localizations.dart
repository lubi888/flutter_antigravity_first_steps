import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_da.dart';
import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_ga.dart';
import 'app_localizations_it.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_nl.dart';
import 'app_localizations_uk.dart';
import 'app_localizations_yue.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('da'),
    Locale('de'),
    Locale('en'),
    Locale('es'),
    Locale('es', '419'),
    Locale('fr'),
    Locale('ga'),
    Locale('it'),
    Locale('ja'),
    Locale('nl'),
    Locale('uk'),
    Locale('yue'),
    Locale('zh'),
  ];

  /// The title of the application
  ///
  /// In en, this message translates to:
  /// **'Flutter Demo'**
  String get appTitle;

  /// The title of the home page
  ///
  /// In en, this message translates to:
  /// **'Flutter Demo Home Page'**
  String get homePageTitle;

  /// The title shown in the navigation drawer header
  ///
  /// In en, this message translates to:
  /// **'Flutter Demo'**
  String get drawerTitle;

  /// Home navigation item
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// Pub.dev navigation item
  ///
  /// In en, this message translates to:
  /// **'Pub.dev'**
  String get pubDev;

  /// Golang.org navigation item
  ///
  /// In en, this message translates to:
  /// **'Golang.org'**
  String get golangOrg;

  /// Label for dark theme toggle
  ///
  /// In en, this message translates to:
  /// **'Dark Theme'**
  String get darkTheme;

  /// Text shown above the counter
  ///
  /// In en, this message translates to:
  /// **'You have pushed the button this many times:'**
  String get counterText;

  /// Link text to pub.dev
  ///
  /// In en, this message translates to:
  /// **'Go to pub.dev'**
  String get goToPubDev;

  /// Link text to golang.org
  ///
  /// In en, this message translates to:
  /// **'Go to golang.org'**
  String get goToGolangOrg;

  /// Tooltip for the increment button
  ///
  /// In en, this message translates to:
  /// **'Increment'**
  String get increment;

  /// Label for language selector
  ///
  /// In en, this message translates to:
  /// **'Languages'**
  String get languages;

  /// English language option
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// French language option
  ///
  /// In en, this message translates to:
  /// **'French'**
  String get french;

  /// German language option
  ///
  /// In en, this message translates to:
  /// **'German'**
  String get german;

  /// Spanish language option
  ///
  /// In en, this message translates to:
  /// **'Spanish (Spain)'**
  String get spanish;

  /// Dutch language option
  ///
  /// In en, this message translates to:
  /// **'Dutch'**
  String get dutch;

  /// Danish language option
  ///
  /// In en, this message translates to:
  /// **'Danish'**
  String get danish;

  /// Japanese language option
  ///
  /// In en, this message translates to:
  /// **'Japanese'**
  String get japanese;

  /// Mandarin language option
  ///
  /// In en, this message translates to:
  /// **'Mandarin'**
  String get mandarin;

  /// Cantonese language option
  ///
  /// In en, this message translates to:
  /// **'Cantonese'**
  String get cantonese;

  /// Ukrainian language option
  ///
  /// In en, this message translates to:
  /// **'Ukrainian'**
  String get ukrainian;

  /// Latin American Spanish language option
  ///
  /// In en, this message translates to:
  /// **'Spanish (Latin America)'**
  String get latinAmericanSpanish;

  /// Italian language option
  ///
  /// In en, this message translates to:
  /// **'Italian'**
  String get italian;

  /// Irish language option
  ///
  /// In en, this message translates to:
  /// **'Irish'**
  String get irish;

  /// Label for theme selector
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get theme;

  /// Page 1 navigation item
  ///
  /// In en, this message translates to:
  /// **'Page 1'**
  String get page1;

  /// Page 2 navigation item
  ///
  /// In en, this message translates to:
  /// **'Page 2'**
  String get page2;

  /// Page 3 navigation item
  ///
  /// In en, this message translates to:
  /// **'Page 3'**
  String get page3;

  /// The title of the about app dialog
  ///
  /// In en, this message translates to:
  /// **'About App'**
  String get aboutAppTitle;

  /// The content of the about app dialog
  ///
  /// In en, this message translates to:
  /// **'Antigravity App v1.0\ncreated by lubi linuxubiquitous and released by tortek 2025.12'**
  String get aboutAppContent;

  /// The menu item for the about app dialog
  ///
  /// In en, this message translates to:
  /// **'About App'**
  String get aboutAppMenuItem;

  /// Gopher nought image semantic label
  ///
  /// In en, this message translates to:
  /// **'Gopher Nought'**
  String get gopherNought;

  /// Gopher one image semantic label
  ///
  /// In en, this message translates to:
  /// **'Gopher One'**
  String get gopherOne;

  /// Gopher two image semantic label
  ///
  /// In en, this message translates to:
  /// **'Gopher Two'**
  String get gopherTwo;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
    'da',
    'de',
    'en',
    'es',
    'fr',
    'ga',
    'it',
    'ja',
    'nl',
    'uk',
    'yue',
    'zh',
  ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when language+country codes are specified.
  switch (locale.languageCode) {
    case 'es':
      {
        switch (locale.countryCode) {
          case '419':
            return AppLocalizationsEs419();
        }
        break;
      }
  }

  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'da':
      return AppLocalizationsDa();
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fr':
      return AppLocalizationsFr();
    case 'ga':
      return AppLocalizationsGa();
    case 'it':
      return AppLocalizationsIt();
    case 'ja':
      return AppLocalizationsJa();
    case 'nl':
      return AppLocalizationsNl();
    case 'uk':
      return AppLocalizationsUk();
    case 'yue':
      return AppLocalizationsYue();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
