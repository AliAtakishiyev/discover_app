import 'package:cached_network_image/cached_network_image.dart';
import 'package:discover_app/features/discover/data/models/book_model.dart';
import 'package:discover_app/features/discover/ui/widgets/go_back.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class BookDetailsScreen extends ConsumerWidget {
  final BookModel book;

  const BookDetailsScreen({super.key, required this.book});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Color(0xffF8F7F0),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                GoBack(),
                SizedBox(height: 48),
                SizedBox(
                  height: 350,
                  child: ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(16),
                    child: CachedNetworkImage(
                      imageUrl: book.coverUrl,
                      errorWidget: (context, url, error) {
                        return Container(
                          width: .infinity,
                          decoration: BoxDecoration(color: Color(0xffE8E7E1)),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: .center,
                              children: [
                                SvgPicture.asset(
                                  "assets/icons/no_book_icon.svg",
                                  width: 60,
                                ),
                                Text(
                                  "NO COVER",
                                  style: TextStyle(color: Color(0xffB3ABA2)),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Container(
                        color: Colors.grey[800],
                        child: Center(
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Color(0xffCE8217),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 12),

                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Text(
                    book.title,
                    textAlign: .center,
                    style: GoogleFonts.almendra(
                      fontWeight: .bold,
                      fontSize: 36,
                    ),
                  ),
                ),

                Text(book.author),

                SizedBox(height: 12),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(book.description, style: TextStyle(fontSize: 18)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
