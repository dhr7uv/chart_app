import 'package:chart_app/view/chart_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'view/home_page.dart';

void main(){
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _routes = GoRouter(
      routes: [
        GoRoute(
            path: '/',
          builder: (context, state) => const Home(),
        ),
        GoRoute(
          path: '/chart',
          builder: (context, state) => const MyChart(),
          name: 'chartPage'
        ),
      ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _routes,
    );
  }
}
