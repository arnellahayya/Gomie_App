import 'package:flutter/material.dart';
import 'package:gomie/components/my_current_location.dart';
import 'package:gomie/components/my_description_box.dart';
import 'package:gomie/components/my_drawer.dart';
import 'package:gomie/components/my_food_tile.dart';
import 'package:gomie/components/my_sliver_app_bar.dart';
import 'package:gomie/components/my_tab_bar.dart';
import 'package:gomie/models/food.dart';
import 'package:gomie/models/restaurant.dart';
import 'package:gomie/pages/food_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  // Tab controller
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: KategoriMakanan.values.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  // Filter menu berdasarkan kategori
  List<Makanan> _filterMenuByKategori(
      KategoriMakanan kategori, List<Makanan> fullMenu) {
    return fullMenu.where((makanan) => makanan.kategori == kategori).toList();
  }

  List<Widget> getMakananInThisKategori(List<Makanan> fullMenu) {
    return KategoriMakanan.values.map((kategori) {
      List<Makanan> kategoriMenu = _filterMenuByKategori(kategori, fullMenu);

      return ListView.builder(
        itemCount: kategoriMenu.length,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          final makanan = kategoriMenu[index];
          return FoodTile(
            makanan: makanan,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FoodPage(makanan: makanan),
              ),
            ),
          );
        },
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          MySliverAppBar(
            title: MyTabBar(
              tabController: _tabController,
            ),
            child: const Padding(
              padding: EdgeInsets.only(top: 85),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyCurrentLocation(),
                  SizedBox(height: 10),
                  MyDescriptionBox(),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ],
        body: Consumer<Restaurant>(
          builder: (context, restaurant, child) => TabBarView(
            controller: _tabController,
            children: getMakananInThisKategori(restaurant.menu),
          ),
        ),
      ),
    );
  }
}
