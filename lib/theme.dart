import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static final lightGradient = const LinearGradient(
    colors: [Color(0xFFF9F1FF), Color(0xFFF0E0FF)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static final darkGradient = const LinearGradient(
    colors: [Color(0xFF15081A), Color(0xFF2A1540)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.deepPurple,
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple)
        .copyWith(secondary: Colors.purpleAccent),
    scaffoldBackgroundColor: Colors.transparent,
    cardTheme: CardThemeData(
      color: Colors.white.withValues(alpha: .9),
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      shadowColor: Colors.purple.shade100,
    ),
    textTheme: GoogleFonts.poppinsTextTheme()
        .apply(bodyColor: Colors.deepPurple.shade800),
    useMaterial3: true,
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.deepPurple,
    colorScheme:
        const ColorScheme.dark().copyWith(secondary: Colors.purpleAccent),
    scaffoldBackgroundColor: Colors.transparent,
    cardTheme: CardThemeData(
      color: const Color(0xFF241631),
      elevation: 12,
      shadowColor: Colors.purpleAccent.withValues(alpha: .5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
    ),
    textTheme: GoogleFonts.poppinsTextTheme().apply(bodyColor: Colors.white),
    useMaterial3: true,
  );

  static Widget glowingCard({
    required BuildContext context,
    required Widget child,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        boxShadow: isDark
            ? [
                BoxShadow(
                  color: Colors.purpleAccent.withValues(alpha: 0.6),
                  blurRadius: 20,
                  spreadRadius: 2,
                ),
                BoxShadow(
                  color: Colors.purpleAccent.withValues(alpha: 0.3),
                  blurRadius: 40,
                  spreadRadius: 8,
                ),
              ]
            : [],
      ),
      child: Card(
        color: Theme.of(context).cardTheme.color,
        elevation: Theme.of(context).cardTheme.elevation,
        shape: Theme.of(context).cardTheme.shape,
        child: child,
      ),
    );
  }
}
