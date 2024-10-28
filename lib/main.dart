import 'package:flutter/material.dart';
import 'package:gov_app/provider/home_provider.dart';
import 'package:gov_app/provider/main_provider.dart';
import 'package:gov_app/screen/detail_screen.dart';
import 'package:gov_app/screen/home_screen.dart';
import 'package:gov_app/screen/login_screen.dart';
import 'package:gov_app/screen/search_engine%20screen.dart';
import 'package:gov_app/screen/splsh_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences preferences;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  preferences = await SharedPreferences.getInstance();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeProvider()),
        ChangeNotifierProvider(create: (context) => MainProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => SplashScreen(),
          'home_screen': (context) => HomeScreen(),
          'detail_screen': (context) => DetailScreen(),
          'login_screen': (context) => LoginScreen(),
          'aa':(context)=>MyApp(),
        },
      ),
    ),
  );
}
