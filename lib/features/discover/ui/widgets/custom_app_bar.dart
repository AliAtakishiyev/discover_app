import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            width: .infinity,
            child: Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Color(0xffCE8217),
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      "assets/icons/book_icon.svg",
                      width: 24,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                SizedBox(width: 18),
                Text(
                  "Discover",
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(height: 1, color: Color(0xffECE8E3), width: .infinity),
      ],
    );
  }
}
