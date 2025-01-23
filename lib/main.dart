import 'package:flutter/material.dart';
import 'package:portfolio/home_page.dart';
import 'package:portfolio/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp( ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    context.read<ThemeProvider>().getPrefValue();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Saurav Patel',
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(brightness: Brightness.dark),
      themeMode:  context.watch<ThemeProvider>().getThemeValue()?ThemeMode.light:ThemeMode.dark,
      home: HomePage(),
    );
  }
}


