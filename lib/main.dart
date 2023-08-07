import 'package:financial_control/Screens/form_page.dart';
import 'package:financial_control/Screens/home_page.dart';
import 'package:financial_control/data/data.dart';
import 'package:financial_control/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

void main() {
  debugPaintSizeEnabled = false;
  debugPaintBaselinesEnabled = false;
  runApp(ChangeNotifierProvider(
    create: (context) => Operations(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          initialRoute: Routes.homePage,
          routes: {
            Routes.homePage: (_) => const HomePage(),
            Routes.formPage: (_) => const FormPage(),
          });
    });
  }
}
