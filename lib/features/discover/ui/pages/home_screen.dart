import 'package:discover_app/features/discover/ui/pages/result_screen.dart';
import 'package:discover_app/features/discover/ui/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController? searchController;
    
    return Scaffold(
      backgroundColor: Color(0xffF8F7F0),
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(),
            SizedBox(height: 50),
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
              style: GoogleFonts.roboto(color: Color(0xff887F77), fontSize: 18),
            ),

            SizedBox(height: 54),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: searchController,
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ResultScreen(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          backgroundColor: Color(0xffE5BC8C),
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
