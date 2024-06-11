import 'package:flutter/material.dart';
import 'package:lapak_tech/helpers/user_info.dart';
import 'package:lapak_tech/ui/login_page.dart';
import 'package:lapak_tech/ui/produk_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override 
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Widget page = const CircularProgressIndicator();

  @override 
  void initState() {
    super.initState();
    isLogin();
  }

  void isLogin() async {
    var token = await userInfo().getToken();

    if (token != null) {
      setState(() {page = const ProdukPage();});
    } else {
      setState(() {page = const LoginPage();});
    }
  }

  @override 
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lapak Tech',
      debugShowCheckedModeBanner: false,
      home: page,
    );
  }
}
