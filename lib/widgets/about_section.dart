import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "🌷 About Me",
              style: GoogleFonts.poppins(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: Colors.deepPurple,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              "Hi! I’m Angel, a 3rd year college student of USTP VILLANUEVA who loves everything cute, creative, and full of color. "
              "Designing has always been my happy place, a space where I can express myself, explore ideas, "
              "and turn imagination into something real. I enjoy blending simplicity with charm to create designs "
              "that tell a story and bring a little joy to others.\n\n"
              "As a student in the world of technology and design, I’m always curious to learn new things, "
              "experiment with styles, and find inspiration in everyday moments. Whether it’s crafting a digital project "
              "or adding small artistic touches, I put my heart into everything I create. ✧˖°.",
              style: GoogleFonts.courgette(
                fontSize: 16,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
