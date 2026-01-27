import 'package:discover_app/features/discover/providers/book_provider.dart';
import 'package:discover_app/features/discover/ui/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final TextEditingController searchController = TextEditingController();
  bool searched = false;
  @override
  Widget build(BuildContext context) {
    final bookState = ref.watch(bookProvider);
    return Scaffold(
      backgroundColor: Color(0xffF8F7F0),
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(),
            SizedBox(height: 28),

            searched
                ? SizedBox.shrink()
                : Column(
                    children: [
                      Text(
                        "Discover",
                        style: GoogleFonts.playfairDisplay(
                          fontSize: 60,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 24),
                      Text(
                        "Search millions of books",
                        style: GoogleFonts.roboto(
                          color: Color(0xff887F77),
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),

            SizedBox(height: 54),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: searchController,
                      onChanged: (value) {
                        setState(() {});
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        contentPadding: EdgeInsets.symmetric(vertical: 24),
                        hint: Text(
                          "Search for books",
                          style: TextStyle(fontSize: 18),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),

                          borderSide: BorderSide(color: Colors.grey, width: 1),
                        ),

                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(
                            color: Color(
                              0xffCE8217,
                            ), // outline color when focused
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: SizedBox(
                      height: 72,
                      width: 120,
                      child: ElevatedButton(
                        onPressed: () {
                          bookState.when(
                            data: (data) {},
                            error: (e, _) => SizedBox.shrink,
                            loading: () => CircularProgressIndicator(),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          backgroundColor: searchController.text.isNotEmpty
                              ? Color(0xffCE8217)
                              : Color(0xffE5BC8C),
                        ),
                        child: Text(
                          "Search",
                          style: TextStyle(
                            color: Color(0xffFAF9F4),
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
