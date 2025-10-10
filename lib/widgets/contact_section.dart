import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  Future<void> _openUrl(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      debugPrint('Could not open $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 12),
        child: Column(
          children: [
            Text(
              'Thanks for visiting!',
              style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),

            // Facebook
            ListTile(
              leading: const Icon(FontAwesomeIcons.facebook, color: Colors.blueAccent),
              title: Text('facebook.com/angelyu05', style: GoogleFonts.quicksand()),
              onTap: () => _openUrl('https://web.facebook.com/angelyu05/'),
            ),
            const Divider(),

            // Discord
            ListTile(
              leading: const Icon(FontAwesomeIcons.discord, color: Colors.indigoAccent),
              title: Text('AEYU.', style: GoogleFonts.quicksand()),
              // Discord usernames can't open directly, so no tap action
            ),
            const Divider(),

            // Instagram
            ListTile(
              leading: const Icon(FontAwesomeIcons.instagram, color: Colors.pinkAccent),
              title: Text('@ITSME.ANGELYU', style: GoogleFonts.quicksand()),
              onTap: () => _openUrl('https://www.instagram.com/itsme.angelyu?igsh=ZjVvdTQxcHhia2py'),
            ),
            const Divider(),

            // GitHub (kept)
            ListTile(
              leading: const Icon(FontAwesomeIcons.github, color: Colors.black87),
              title: Text('github.com/Ssoberi', style: GoogleFonts.quicksand()),
              onTap: () => _openUrl('https://github.com/Ssoberi'),
            ),
          ],
        ),
      ),
    );
  }
}
