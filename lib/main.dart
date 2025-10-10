import 'package:flutter/material.dart';
import 'theme.dart';
import 'pages/homepage.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatefulWidget {
  const PortfolioApp({super.key});

  @override
  State<PortfolioApp> createState() => _PortfolioAppState();
}

class _PortfolioAppState extends State<PortfolioApp> {
  bool _isDark = false;

  void _toggleTheme() => setState(() => _isDark = !_isDark);

  @override
  Widget build(BuildContext context) {
    return AnimatedTheme(
      data: _isDark ? AppTheme.darkTheme : AppTheme.lightTheme,
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOut,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 800),
        switchInCurve: Curves.easeInOut,
        switchOutCurve: Curves.easeInOut,
        transitionBuilder: (child, animation) => FadeTransition(
          opacity: animation,
          child: child,
        ),
        child: MaterialApp(
          // ⚡ REMOVE this key to preserve scroll position
          // key: ValueKey<bool>(_isDark),
          title: '☁️𝓜𝔂 𝓟𝓸𝓻𝓽𝓯𝓸𝓵𝓲𝓸',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: _isDark ? ThemeMode.dark : ThemeMode.light,
          home: HomePage(
            isDark: _isDark,
            onToggleTheme: _toggleTheme,
          ),
        ),
      ),
    );
  }
}
