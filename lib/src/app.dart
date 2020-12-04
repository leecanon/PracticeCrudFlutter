import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:praticeflutter/src/providers/entry_provider.dart';
import 'package:praticeflutter/src/screens/home.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
          create: (context) => EntryProvider(),
          child: MaterialApp(
          home: HomeScreen(),
          theme: ThemeData(
              accentColor: Colors.pinkAccent,primaryColor: Colors.black)),
    );
  }
}
