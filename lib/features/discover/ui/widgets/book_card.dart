import 'package:cached_network_image/cached_network_image.dart';
import 'package:discover_app/features/discover/ui/pages/book_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class BookCard extends StatelessWidget {
  final dynamic book;

  const BookCard({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BookDetailsScreen()),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),

        child: Column(
          crossAxisAlignment: .start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
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

            SizedBox(
              child: Padding(
                padding: EdgeInsetsGeometry.all(8),
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Text(
                      "${book.title}",
                      style: GoogleFonts.almendra(
                        fontWeight: .bold,
                        fontSize: 24,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 4),

                    Text(
                      "${book.author}",
                      style: TextStyle(color: Color(0xff8A8077)),
                    ),

                    SizedBox(height: 8),

                    Text(
                      "First published ${book.firstPublishYear}",
                      style: TextStyle(color: Color(0xffADA49C)),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
