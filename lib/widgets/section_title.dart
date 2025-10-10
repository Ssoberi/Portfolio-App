import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title, style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w700)),
        const SizedBox(width: 8),
        Expanded(child: Divider(thickness: 1, endIndent: 12, color: Theme.of(context).dividerColor.withValues(alpha: 0.6))),
      ],
    );
  }
}
