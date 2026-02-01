import 'package:discover_app/features/discover/ui/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class BookDetailsScreen extends StatelessWidget {
  const BookDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF8F7F0),
      body: SafeArea(
        child: CustomAppBar()
      
      ),
    );
  }
}