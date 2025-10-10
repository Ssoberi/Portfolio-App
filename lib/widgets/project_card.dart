import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectCard extends StatefulWidget {
  final String title;
  final String description;
  final String? githubUrl; // null if no link
  final bool isLeftAligned;
  final int delayMs;

  const ProjectCard({
    super.key,
    required this.title,
    required this.description,
    required this.isLeftAligned,
    this.githubUrl,
    this.delayMs = 0,
  });

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  double _opacity = 0.0;
  double _xOffset = 0.03;

  @override
  void initState() {
    super.initState();
    // delayed entrance for stagger effect
    Future.delayed(Duration(milliseconds: widget.delayMs), () {
      setState(() {
        _opacity = 1.0;
        _xOffset = 0;
      });
    });
  }

  Future<void> _openUrl(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      debugPrint('Could not open $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    // build a row with an offset card aligned left or right
    final card = AnimatedOpacity(
      duration: const Duration(milliseconds: 600),
      opacity: _opacity,
      child: AnimatedSlide(
        duration: const Duration(milliseconds: 600),
        offset: Offset(widget.isLeftAligned ? -_xOffset : _xOffset, 0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 16),
            child: Row(
              children: [
                // icon and text
                Icon(Icons.auto_awesome, size: 34, color: Colors.deepPurple.shade400),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.title, style: GoogleFonts.poppins(fontWeight: FontWeight.w700)),
                      const SizedBox(height: 6),
                      Text(widget.description, style: GoogleFonts.courgette()),
                    ],
                  ),
                ),
                if (widget.githubUrl != null)
                  IconButton(
                    tooltip: 'Open GitHub',
                    onPressed: () => _openUrl(widget.githubUrl!),
                    icon: const Icon(Icons.link),
                    color: Colors.deepPurple,
                  ),
              ],
            ),
          ),
        ),
      ),
    );

    // for staggered layout add horizontal padding so cards appear left/right
    final width = MediaQuery.of(context).size.width;
    final margin = width > 800 ? width * 0.12 : 6.0;

    return Padding(
      padding: EdgeInsets.only(left: widget.isLeftAligned ? margin : 6, right: widget.isLeftAligned ? 6 : margin),
      child: card,
    );
  }
}
