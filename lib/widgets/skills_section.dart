import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SkillsSection extends StatefulWidget {
  const SkillsSection({super.key});

  @override
  State<SkillsSection> createState() => _SkillsSectionState();
}

class _SkillsSectionState extends State<SkillsSection> {
  @override
  Widget build(BuildContext context) {
    final skills = [
      {'label': 'Flutter', 'icon': Icons.flutter_dash},
      {'label': 'Dart', 'icon': Icons.code},
      {'label': 'ReactJS', 'icon': Icons.web},
      {'label': 'Python', 'icon': Icons.memory},
      {'label': 'HTML/CSS', 'icon': Icons.language},
      {'label': 'Git/GitHub', 'icon': Icons.merge_type},
      {'label': 'UI/UX', 'icon': Icons.design_services},
    ];

    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: skills.map((s) {
        return MouseRegion(
          cursor: SystemMouseCursors.click,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 260),
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.deepPurple.shade50.withValues(alpha: 0.9),
              borderRadius: BorderRadius.circular(14),
              boxShadow: [
                BoxShadow(
                  color: Colors.purple.shade100.withValues(alpha: 0.2),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(s['icon'] as IconData, size: 18, color: Colors.deepPurple),
                const SizedBox(width: 8),
                Text(s['label'] as String, style: GoogleFonts.quicksand(fontWeight: FontWeight.w600)),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
