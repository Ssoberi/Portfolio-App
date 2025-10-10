import 'package:flutter/material.dart';
import '../theme.dart';
import '../widgets/profile_section.dart';
import '../widgets/section_title.dart';
import '../widgets/project_card.dart';
import '../widgets/skills_section.dart';
import '../widgets/tools_section.dart'; // ✅ added this import
import '../widgets/contact_section.dart';
import '../widgets/about_section.dart';

class HomePage extends StatefulWidget {
  final bool isDark;
  final VoidCallback onToggleTheme;

  const HomePage({super.key, required this.isDark, required this.onToggleTheme});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin<HomePage> {
  final _scrollController = ScrollController();

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final isLarge = MediaQuery.of(context).size.width > 800;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: widget.isDark ? AppTheme.darkGradient : AppTheme.lightGradient,
        ),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
                  decoration: BoxDecoration(
                    color: widget.isDark
                        ? Colors.black.withValues(alpha: 0.3)
                        : Colors.deepPurple.withValues(alpha: 0.1),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.1),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Text(
                        'My Creative Portfolio ⁠♡',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontSize: isLarge ? 28 : 20,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                      const Spacer(),
                      IconButton(
                        tooltip: 'Toggle theme',
                        icon: Icon(
                          widget.isDark
                              ? Icons.wb_sunny_outlined
                              : Icons.nightlight_round,
                          color: widget.isDark
                              ? Colors.amberAccent
                              : Colors.deepPurple,
                        ),
                        onPressed: widget.onToggleTheme,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ListView(
                  controller: _scrollController,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                  children: [
                    const SectionTitle(title: '𐙚 Profile 𐙚'),
                    const SizedBox(height: 8),
                    const ProfileSection(),
                    const SizedBox(height: 18),

                    const SectionTitle(title: '𐙚 About Me 𐙚'),
                    const SizedBox(height: 8),
                    const AboutSection(),
                    const SizedBox(height: 18),

                    const SectionTitle(title: '𐙚 Projects 𐙚'),
                    const SizedBox(height: 8),
                    ProjectCard(
                      title: 'HomieWorks',
                      description:
                          'A job-posting web app built with ReactJS. Features: job categories, post-a-job flow and login state.',
                      isLeftAligned: true,
                      githubUrl: null,
                      delayMs: 0,
                    ),
                    const SizedBox(height: 12),
                    ProjectCard(
                      title: 'Profile Card App',
                      description:
                          'A simple Flutter app that displays a user’s profile with their photo, name, and basic details.',
                      isLeftAligned: false,
                      githubUrl: null,
                      delayMs: 0,
                    ),
                    const SizedBox(height: 12),
                    ProjectCard(
                      title: 'Vending Machine',
                      description:
                          'A simple vending machine program that lets users buy items and process payments.',
                      isLeftAligned: true,
                      githubUrl: null,
                      delayMs: 0,
                    ),
                    const SizedBox(height: 12),
                    ProjectCard(
                      title: 'Portfolio App',
                      description:
                          'A single-page Flutter portfolio app with responsive layout and dark mode.',
                      isLeftAligned: false,
                      githubUrl: 'https://github.com/Ssoberi/Portfolio-App',
                      delayMs: 0,
                    ),
                    const SizedBox(height: 18),

                    const SectionTitle(title: '𐙚 Skills 𐙚'),
                    const SizedBox(height: 8),
                    const SkillsSection(),
                    const SizedBox(height: 18),

                    // 🛠 My Tools Section
                    const SectionTitle(title: '𐙚 Languages & Tools 𐙚'),
                    const SizedBox(height: 8),
                    const ToolsSection(),
                    const SizedBox(height: 18),

                    const SectionTitle(title: '𐙚 Contact 𐙚'),
                    const SizedBox(height: 8),
                    const ContactSection(),
                    const SizedBox(height: 36),

                    Center(
                      child: Text(
                        'Built with Flutter 💗',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
