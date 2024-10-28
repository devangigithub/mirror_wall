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
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(msg),
              ),
            );;
          },
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final String? username = ModalRoute.of(context)?.settings.arguments as String?;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Gov.Service App'),
        centerTitle: true,
        actions: [
          const SizedBox(height: 20),
          Text(
            username ?? "Guest",
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
      bottomNavigationBar: Consumer<MainProvider>(
        builder: (context, value, child) {
          return BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: value.menuIndex,
            backgroundColor: Colors.white,
            fixedColor: Colors.blue,
            onTap: (index) {
              value.pageController.animateToPage(
                index,
                duration: Duration(milliseconds: 1000),
                curve: Curves.ease,
              );
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home_work_outlined), label: 'Contacts'),
              BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Recent'),
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
          MyApp(),
        ],
      ),
    );
  }
}
