import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:landing/landing_screen.dart';
import 'package:oyt_front_core/theme/theme.dart';

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'On Your Table',
      debugShowCheckedModeBanner: false,
      theme: ref.watch(themeProvider),
      home: const LandingPage(),
    );
  }
}
