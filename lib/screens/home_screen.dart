// import lainnya tetap
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_application_1/models/category.dart';
import 'package:flutter_application_1/widgets/home_bottem.dart';
import 'package:flutter_application_1/widgets/item_widget.dart';
import 'package:flutter_application_1/widgets/second_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  List<Category> _categories = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchCategoryData();
  }

  Future<void> fetchCategoryData() async {
    try {
      final response =
          await http.get(Uri.parse('http://127.0.0.1:8000/api/categories'));

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        final categories = data.map((item) => Category.fromJson(item)).toList();

        setState(() {
          _categories = categories;
          _tabController =
              TabController(length: _categories.length, vsync: this);
          _tabController!.addListener(_handleTabSelection);
          _isLoading = false;
        });
      } else {
        throw Exception("Gagal memuat kategori");
      }
    } catch (e) {
      print("Error: $e");
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _handleTabSelection() {
    if (_tabController != null && _tabController!.indexIsChanging) {
      setState(() {});
    }
  }

  String get selectedCategoryName =>
      (_categories.isNotEmpty && _tabController != null)
          ? _categories[_tabController!.index].nama
          : '';

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFF212325),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: size.height * 0.02),
          child: ListView(
            children: [
              // Header
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Icon(
                        Icons.person,
                        color: Colors.white.withOpacity(0.5),
                        size: size.width * 0.12,
                      ),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {},
                      child: Icon(
                        Icons.search,
                        color: Colors.white.withOpacity(0.5),
                        size: size.width * 0.12,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: size.height * 0.04),

              // Title
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                child: Text(
                  "Find The Best\nCoffee For You",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: size.width * 0.08,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),

              // Search Bar
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: size.width * 0.04,
                  vertical: size.height * 0.02,
                ),
                height: size.height * 0.06,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 50, 54, 56),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Find Your Coffee",
                    hintStyle: TextStyle(
                      color: Colors.white.withOpacity(0.5),
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                      size: size.width * 0.08,
                      color: Colors.white.withOpacity(0.5),
                    ),
                  ),
                ),
              ),

              // Categories
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                child: Text(
                  "Categories",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: size.width * 0.06,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),

              SizedBox(height: size.height * 0.01),

              _isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : (_tabController == null || _categories.isEmpty)
                      ? const Center(
                          child: Text("Tidak ada kategori",
                              style: TextStyle(color: Colors.white)))
                      : Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: size.width * 0.04),
                          padding: EdgeInsets.all(size.width * 0.02),
                          child: TabBar(
                            controller: _tabController,
                            labelColor: Colors.white,
                            unselectedLabelColor: Colors.white.withOpacity(0.5),
                            isScrollable: true,
                            dividerColor: Colors.transparent,
                            indicator: BoxDecoration(
                              color: const Color(0xFFE57734),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            indicatorPadding: EdgeInsets.symmetric(
                              vertical: size.height * 0.006,
                              horizontal: size.width * 0.005,
                            ),
                            labelStyle: TextStyle(
                              fontSize: size.width * 0.04,
                              fontWeight: FontWeight.w500,
                            ),
                            labelPadding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.02),
                            tabs: _categories.map((category) {
                              return Tab(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12.0),
                                  child: Text(
                                    category.nama,
                                    style: const TextStyle(fontSize: 13),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),

              SizedBox(height: size.height * 0.02),

              // Item List berdasarkan kategori
              ItemWidget(categoryName: selectedCategoryName),

              SizedBox(height: size.height * 0.03),

              // Recommendations
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                child: Text(
                  "Recommendations",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: size.width * 0.06,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),

              SizedBox(height: size.height * 0.02),

              SecondItem(),
              SecondItem(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const HomeBottem(),
    );
  }
}
