import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: (){
            GoRouter.of(context).pushNamed('chartPage');
          },
          child: const Text("Fetch Chart"),
        ),
      ),
    );
  }
}
