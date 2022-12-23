import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _MyAppState createState() => _MyAppState();
}

// This is English text For change Text
String englishText = 'Hi This is Scaffold Page';

// This is Tamil Text For change
String tamilText = 'ஹாய் இது சாரக்கட்டு பக்கம்';

class _MyAppState extends State<MyApp> {
  String displayText = englishText;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('SANKARA HOME'),
            leading: const Icon(Icons.home),
            backgroundColor: const Color.fromARGB(255, 255, 51, 0),
            actions: <Widget>[
              IconButton(
                  onPressed: () {
                    setState(() {
                      displayText =
                          displayText == englishText ? tamilText : englishText;
                    });
                  },
                  icon: const Icon(Icons.refresh))
            ],
          ),
          body: Center(
            child: Text(
              displayText,
              style: const TextStyle(
                fontSize: 30,
                color: Color.fromARGB(255, 255, 179, 0),
                fontWeight: FontWeight.bold,
              ),
            ),
          )),
      debugShowCheckedModeBanner: false,
    );
  }
}
