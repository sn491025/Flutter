import 'package:flutter/material.dart';

class UiBlocMain extends StatelessWidget {
  const UiBlocMain({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocMainHome(),
    );
  }
}

class BlocMainHome extends StatefulWidget {
  const BlocMainHome({super.key});

  @override
  State<BlocMainHome> createState() => _BlocMainHomeState();
}

class _BlocMainHomeState extends State<BlocMainHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc'),
      ),
      body: Container(),
    );
  }
}
