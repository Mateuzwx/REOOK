import 'package:app_reook/adicionar/add/add_page.dart';
import 'package:app_reook/provider/adds.dart';
import 'package:app_reook/screens/home/home_page/home_page.dart';
import 'package:app_reook/theme.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Adds(),
      child: MaterialApp(
        theme: MaterialTheme(Theme.of(context).textTheme).light(),
        darkTheme: MaterialTheme(Theme.of(context).textTheme).dark(),
        initialRoute: '/home',
        routes: {
          '/home': (_) => const HomePage(),
          '/add': (_) => AddPage(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
