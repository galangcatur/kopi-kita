import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/home_bottem.dart';
import 'package:flutter_application_1/widgets/item_widget.dart';
import 'package:flutter_application_1/widgets/second_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key); // ✅ tambahkan Key

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this, initialIndex: 0);
    _tabController.addListener(_handleTabSelection);
    super.initState();
  }

  _handleTabSelection() {
    if (_tabController.indexIsChanging) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: size.height * 0.02),
          child: ListView(
            children: [
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
                    Spacer(),
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
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal: size.width * 0.04,
                    vertical: size.height * 0.02),
                width: size.width,
                height: size.height * 0.06,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 50, 54, 56),
                    borderRadius: BorderRadius.circular(10)),
                child: TextFormField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Find Your Coffee",
                      hintStyle: TextStyle(
                        color: Colors.white.withOpacity(0.5),
                      ),
                      prefixIcon: Icon(Icons.search,
                          size: size.width * 0.08,
                          color: Colors.white.withOpacity(0.5))),
                ),
              ),
              SizedBox(height: size.height * 0.01),
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

              // Tambahkan Background di Belakang TabBar
              Container(
                margin: EdgeInsets.symmetric(horizontal: size.width * 0.04),
                padding: EdgeInsets.all(
                    size.width * 0.02), // Padding untuk background utama TabBar
                child: TabBar(
                  controller: _tabController,
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.white.withOpacity(0.5),
                  isScrollable: true,
                  dividerColor: Colors.transparent,
                  indicator: BoxDecoration(
                    color: Color(
                        0xFFE57734), // Warna background per tab item yang aktif
                    borderRadius:
                        BorderRadius.circular(12), // Membuat efek rounded
                  ),
                  indicatorPadding: EdgeInsets.symmetric(
                      vertical: size.height * 0.006,
                      horizontal: size.width *
                          0.005), // Menambah jarak background dari teks
                  labelStyle: TextStyle(
                      fontSize: size.width * 0.05, fontWeight: FontWeight.w500),
                  labelPadding:
                      EdgeInsets.symmetric(horizontal: size.width * 0.02),
                  tabs: [
                    Tab(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: size.height * 0.01,
                            horizontal: size.width *
                                0.05), // Padding untuk memberi margin dalam tab
                        child: Text("Americano"),
                      ),
                    ),
                    Tab(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: size.height * 0.01,
                            horizontal: size.width * 0.05),
                        child: Text("Cappuccino"),
                      ),
                    ),
                    Tab(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: size.height * 0.01,
                            horizontal: size.width * 0.05),
                        child: Text("Espresso"),
                      ),
                    ),
                    Tab(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: size.height * 0.01,
                            horizontal: size.width * 0.05),
                        child: Text("Arabika"),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: size.height * 0.02),

              // Menampilkan 4 ItemWidget
              ItemWidget(),
              SizedBox(
                  height:
                      size.height * 0.03), // Beri jarak sebelum Recommendations

              // Teks "Recommendations"
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
              SizedBox(height: size.height * 0.02), // Jarak setelah teks

              // Menampilkan 4 SecondItem
              SecondItem(),
              SecondItem(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: HomeBottem(),
    );
  }
}
