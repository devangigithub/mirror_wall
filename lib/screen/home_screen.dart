import 'package:flutter/material.dart';
import 'package:gov_app/screen/app_viwe.dart';
import 'package:gov_app/screen/search_engine%20screen.dart';
import 'package:provider/provider.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import '../provider/main_provider.dart';
import '../provider/internet_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Connectivity().onConnectivityChanged.listen((res) {
      print("onConnectivityChanged $res");
      bool noInternet = res == ConnectivityResult.none;
      Provider.of<InternetProvider>(context, listen: false)
          .changeConnectionStatus(noInternet);
      if (noInternet) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("No Internet Connection"),
            duration: Duration(seconds: 3),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final String? username = ModalRoute.of(context)?.settings.arguments as String?;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Mirror Wall',style: TextStyle(
          fontSize: 27
        ),),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 20,right: 20),
            child: Text(
              username ?? "Guest",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Consumer<MainProvider>(
        builder: (context, value, child) {
          return BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: value.menuIndex,
            backgroundColor: Colors.white,
            fixedColor: Colors.black,
            onTap: (index) {
              value.pageController.animateToPage(
                index,
                duration: const Duration(milliseconds: 1000),
                curve: Curves.ease,
              );
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home_work_outlined), label: 'Government Service'),
              BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search Engine'),
            ],
          );
        },
      ),
      body: PageView(
        controller: Provider.of<MainProvider>(context, listen: false).pageController,
        onPageChanged: (value) {
          Provider.of<MainProvider>(context, listen: false).changeMenuIndex(value);
        },
        children: [
          AppViwe(),
          SearchPage(),
        ],
      ),
    );
  }
}
