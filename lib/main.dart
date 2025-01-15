import 'package:flutter/material.dart';
import 'utils/theme.dart';
import 'views/post_list_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Posts App',
      theme: AppThemes.lightTheme,
      home: PostListPage(),
    );
  }
}
