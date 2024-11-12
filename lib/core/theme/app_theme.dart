import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hiddify/core/theme/app_theme_mode.dart';
import 'package:hiddify/core/theme/theme_extensions.dart';

class AppTheme {
  AppTheme(this.mode);

  final AppThemeMode mode;

  ThemeData lightTheme(ColorScheme? lightColorScheme) {
    final ColorScheme scheme = lightColorScheme ??
        ColorScheme.fromSeed(
          seedColor: const Color(0xFFE4DCDC),
        );
    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      textTheme:
          GoogleFonts.robotoTextTheme(ThemeData.light().textTheme).copyWith(
        bodyLarge:
            GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.w500),
        bodyMedium:
            GoogleFonts.roboto(fontSize: 14, fontWeight: FontWeight.w500),
        titleLarge:
            GoogleFonts.roboto(fontSize: 22, fontWeight: FontWeight.w600),
        titleMedium:
            GoogleFonts.roboto(fontSize: 18, fontWeight: FontWeight.w600),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: scheme.primary,
        foregroundColor: scheme.onPrimary,
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(16),
          ),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: scheme.onPrimary,
          backgroundColor: scheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      cardTheme: CardTheme(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      extensions: const <ThemeExtension<dynamic>>{
        ConnectionButtonTheme.light,
      },
    );
  }

  ThemeData darkTheme(ColorScheme? darkColorScheme) {
    final ColorScheme scheme = darkColorScheme ??
        ColorScheme.fromSeed(
          seedColor: const Color(0xFF4285F4),
          brightness: Brightness.dark,
        );
    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      scaffoldBackgroundColor:
          mode.trueBlack ? Colors.black : const Color(0xFF121212),
      textTheme:
          GoogleFonts.robotoTextTheme(ThemeData.dark().textTheme).copyWith(
        bodyLarge: GoogleFonts.roboto(
            fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white),
        bodyMedium: GoogleFonts.roboto(
            fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white70),
        titleLarge: GoogleFonts.roboto(
            fontSize: 22, fontWeight: FontWeight.w500, color: Colors.white),
        titleMedium: GoogleFonts.roboto(
            fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: scheme.surface,
        foregroundColor: scheme.onSurface,
        elevation: 0,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: scheme.onPrimary,
          backgroundColor: scheme.primary,
        ),
      ),
      extensions: [
        ConnectionButtonTheme(
          idleColor: scheme.primary,
          connectedColor: scheme.secondary,
        ),
      ],
    );
  }
}
