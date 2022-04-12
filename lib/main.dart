import 'package:example_provider_and_themedata/model/cart.dart';
import 'package:example_provider_and_themedata/model/custom_theme_data.dart';
import 'package:example_provider_and_themedata/screen/catalog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CartModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => CustomThemeDataModel(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Provider.of<CustomThemeDataModel>(context).getThemeData,
      home: MyCatalog(),
    );
  }
}
