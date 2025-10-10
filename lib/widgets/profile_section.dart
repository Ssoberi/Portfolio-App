import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileSection extends StatefulWidget {
  const ProfileSection({super.key});

  @override
  State<ProfileSection> createState() => _ProfileSectionState();
}

class _ProfileSectionState extends State<ProfileSection>
    with TickerProviderStateMixin {
  late AnimationController _glowController;
  late Animation<double> _glowAnimation;

  @override
  void initState() {
    super.initState();

    // Soft breathing glow animation
    _glowController =
        AnimationController(vsync: this, duration: const Duration(seconds: 4))
          ..repeat(reverse: true);

    _glowAnimation = Tween<double>(begin: 4, end: 14).animate(
      CurvedAnimation(parent: _glowController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _glowController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isLargeScreen = MediaQuery.of(context).size.width > 600;

    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Flex(
        direction: isLargeScreen ? Axis.horizontal : Axis.vertical,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // 💖 Profile photo with dreamy border
          Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              AnimatedBuilder(
                animation: _glowAnimation,
                builder: (context, child) {
                  return Container(
                    width: isLargeScreen ? 210 : 150,
                    height: isLargeScreen ? 210 : 150,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: const SweepGradient(
                        colors: [
                          Color(0xFFF8BBD0), // soft pink
                          Color(0xFFD1C4E9), // lilac
                          Color(0xFFB388FF), // purple accent
                          Color(0xFFF8BBD0),
                        ],
                        stops: [0.0, 0.4, 0.7, 1.0],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFFB388FF)
                              .withValues(alpha: 0.3 + _glowAnimation.value / 40),
                          blurRadius: _glowAnimation.value,
                          spreadRadius: _glowAnimation.value / 3,
                        ),
                      ],
                    ),
                    child: Container(
                      margin: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white.withValues(alpha: 0.7),
                          width: 3,
                        ),
                        image: const DecorationImage(
                          image: AssetImage('lib/assets/Aeyu.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
              ),

              // 🦋 Butterflies around
              _buildButterfly(top: 10, left: 15, color: const Color(0xFFCE93D8)),
              _buildButterfly(top: 20, right: 10, color: const Color(0xFFF48FB1)),
              _buildButterfly(bottom: 10, left: 20, color: const Color(0xFF81D4FA)),
            ],
          ),

          SizedBox(width: isLargeScreen ? 32 : 0, height: isLargeScreen ? 0 : 24),

          // 🌷 Info section
          Expanded(
            flex: isLargeScreen ? 1 : 0,
            child: Column(
              crossAxisAlignment: isLargeScreen
                  ? CrossAxisAlignment.start
                  : CrossAxisAlignment.center,
              children: [
                Text(
                  "Angel Yu",
                  style: GoogleFonts.cookie(
                    fontSize: isLargeScreen ? 42 : 40,
                    color: const Color(0xFF6A1B9A),
                    shadows: [
                      Shadow(
                        color: Colors.pinkAccent.withValues(alpha: 0.2),
                        blurRadius: 8,
                        offset: const Offset(1, 2),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "BSIT Year Level: 3rd yr. Section: A",
                  style: GoogleFonts.poppins(
                    fontSize: isLargeScreen ? 16 : 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.deepPurpleAccent,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "USTP VILLA STUDENT | Cat Lover 🐾 | Dreamer 💫",
                  textAlign: isLargeScreen ? TextAlign.start : TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: isLargeScreen ? 15 : 13,
                    color: Colors.grey[700],
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  "A girl who believes every app deserves a touch of cuteness and creativity.",
                  textAlign: isLargeScreen ? TextAlign.start : TextAlign.center,
                  style: GoogleFonts.courgette(
                    fontSize: isLargeScreen ? 16 : 14,
                    color: Colors.grey[600],
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 🦋 Reusable butterfly widget
  Widget _buildButterfly({
    double? top,
    double? left,
    double? right,
    double? bottom,
    required Color color,
  }) {
    return Positioned(
      top: top,
      left: left,
      right: right,
      bottom: bottom,
      child: ColorFiltered(
        colorFilter: ColorFilter.mode(color, BlendMode.modulate),
        child: Image.asset(
          'lib/assets/butterfly.png',
          width: 35,
          height: 35,
        ),
      ),
    );
  }
}
