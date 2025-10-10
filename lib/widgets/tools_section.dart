import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ToolsSection extends StatelessWidget {
  const ToolsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final tools = [
      {'label': 'VS Code', 'icon': FontAwesomeIcons.code},
      {'label': 'Figma', 'icon': FontAwesomeIcons.figma},
      {'label': 'Firebase', 'icon': FontAwesomeIcons.fire},
      {'label': 'Git', 'icon': FontAwesomeIcons.gitAlt},
      {'label': 'GitHub', 'icon': FontAwesomeIcons.github},
      {'label': 'Canva', 'icon': FontAwesomeIcons.paintbrush},
      {'label': 'Chrome DevTools', 'icon': FontAwesomeIcons.chrome},
      {'label': 'Cisco', 'icon': FontAwesomeIcons.networkWired},
      {'label': 'HTML', 'icon': FontAwesomeIcons.html5},
      {'label': 'Java', 'icon': FontAwesomeIcons.java},
    ];

    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: tools.map((tool) {
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
                Icon(tool['icon'] as IconData, size: 18, color: Colors.deepPurple),
                const SizedBox(width: 8),
                Text(tool['label'] as String,
                    style: GoogleFonts.quicksand(fontWeight: FontWeight.w600)),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
