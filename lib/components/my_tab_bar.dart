import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gomie/models/food.dart';

class MyTabBar extends StatelessWidget {
  final TabController tabController;

  const MyTabBar({
    super.key,
    required this.tabController,
  });

  List<Tab> _buildCategoryTabs(BuildContext context) {
    const double tabWidth = 100.0;
    return KategoriMakanan.values.map((kategori) {
      return Tab(
        child: Container(
          width: tabWidth,
          alignment: Alignment.center,
          child: Text(
            kategori.toString().split('.').last[0].toUpperCase() +
                kategori.toString().split('.').last.substring(1),
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 1.0),
      child: TabBar(
        controller: tabController,
        isScrollable: true,
        tabs: _buildCategoryTabs(context),
        indicator: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(15),
        ),
        indicatorPadding:
            const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        labelStyle: GoogleFonts.openSans(
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
        unselectedLabelStyle: GoogleFonts.openSans(
          fontSize: 14,
        ),
        labelColor: Colors.white,
        unselectedLabelColor: Colors.black,
        dividerColor: Colors.transparent,
      ),
    );
  }
}
