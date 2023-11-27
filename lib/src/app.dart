import 'package:flutter/material.dart';

import 'sample_feature/screens/home.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      home: Home(),
    );
  }
}
