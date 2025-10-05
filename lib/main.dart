import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simpati_flutter/beranda.dart';
import 'package:simpati_flutter/login.dart';
import 'package:simpati_flutter/pembayaran.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future<Widget> _checkFirstPage() async {
    final prefs = await SharedPreferences.getInstance();
    final nomor = prefs.getString('nomorHp');
    if (nomor != null && nomor.isNotEmpty) {
      return const Beranda();
    } else {
      return const Login();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Aplikasi SImpati',
          theme: ThemeData(
            primaryColor: const Color(0xFFD91A21),
            scaffoldBackgroundColor: Colors.white,
            fontFamily: "Roboto",
            appBarTheme: const AppBarTheme(
              backgroundColor: Color(0xFFD91A21),
              elevation: 0,
              centerTitle: true,
              titleTextStyle: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              iconTheme: IconThemeData(color: Colors.white),
            ),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFD91A21),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                padding: EdgeInsets.symmetric(vertical: 14),
                textStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Color(0xFFD91A21),
              ),
            ),
          ),

          home: FutureBuilder<Widget>(
            future: _checkFirstPage(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Scaffold(
                  body: Center(child: CircularProgressIndicator()),
                );
              } else {
                return snapshot.data ?? const Login();
              }
            },
          ),

          routes: {
            Login.routeName: (context) => const Login(),
            Beranda.routeName: (context) => const Beranda(),
            Pembayaran.routeName: (context) => const Pembayaran(),
          },
        );
      },
    );
  }
}
