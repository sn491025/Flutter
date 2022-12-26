// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

void main() => runApp(const ContactProfilePage());

// ignore: camel_case_types
enum APP_THEME { LIGHT, DARK }

class MyAppThemes {
  static ThemeData appThemeBrightness() {
    return ThemeData(
        // General theme
        brightness: Brightness.light,
        fontFamily: 'Georgia',

        // appBar theme
        appBarTheme: const AppBarTheme(
          color: Color.fromARGB(255, 9, 82, 160),
        ),

        // icon Theme
        iconTheme: IconThemeData(color: Colors.red.shade800),

        // FBA(Floating Action Button)
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: Colors.white, foregroundColor: Colors.black));
  }

  static ThemeData appThemeDark() {
    return ThemeData(
        brightness: Brightness.dark,
        fontFamily: 'Georgia',
        appBarTheme: const AppBarTheme(
          color: Color.fromARGB(255, 9, 82, 160),
        ),
        iconTheme: IconThemeData(color: Colors.red.shade800));
  }
}

class ContactProfilePage extends StatefulWidget {
  const ContactProfilePage({super.key});

  @override
  _ContactProfilePageState createState() => _ContactProfilePageState();
}

class _ContactProfilePageState extends State<ContactProfilePage> {
  var currentTheme = APP_THEME.LIGHT;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: currentTheme == APP_THEME.DARK
            ? MyAppThemes.appThemeDark()
            : MyAppThemes.appThemeBrightness(),
        home: Scaffold(
          appBar: AppBar(
            leading: const Icon(
              Icons.arrow_back,
            ),
            actions: <Widget>[
              IconButton(
                onPressed: () {
                  print('Hi this is Star');
                },
                icon: const Icon(
                  Icons.star_border,
                  size: 30,
                ),
              )
            ],
          ),
          body: ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  // Image
                  Container(
                    width: double.infinity,
                    height: 250,
                    color: Colors.blue,
                    child: Image.network(
                      'https://i.pinimg.com/564x/b4/c1/1a/b4c11a320b8edcc8292b75ceea6e871c.jpg',
                      height: 750,
                      fit: BoxFit.cover,
                    ),
                  ),

                  // Name
                  Container(
                      height: 70,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const <Widget>[
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Captain America',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 30),
                            ),
                          ),
                        ],
                      )),
                  const Divider(
                    color: Colors.blueGrey,
                  ),

                  Container(
                    margin: const EdgeInsets.only(top: 8, bottom: 8),
                    child: Theme(
                      data: ThemeData(
                          iconTheme: IconThemeData(
                        color: Colors.indigo.shade900,
                      )),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          buildCallButton(),
                          buildTextButton(),
                          buildVideoButton(),
                          buildEmailButton(),
                          buildDirectionsButton(),
                          buildPayButton()
                        ],
                      ),
                    ),
                  ),
                  const Divider(
                    color: Colors.blueGrey,
                  ),

                  // Contact list
                  mobilePhoneListTile(),
                  anotherMobilePhoneListTile(),

                  const Divider(
                    color: Colors.blueGrey,
                  ),

                  // Email ListTail
                  emailListTile(),

                  const Divider(
                    color: Colors.blueGrey,
                  ),

                  // Address ListTail
                  addressListTile(),

                  const Divider(
                    color: Colors.indigo,
                  ),
                ],
              )
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: IconButton(
              icon: Icon(Icons.add),
              onPressed: (() {
                setState(() {
                  currentTheme == APP_THEME.DARK
                      ? currentTheme = APP_THEME.LIGHT
                      : currentTheme = APP_THEME.DARK;
                });
              }),
            ),
          ),
        ));
  }
}

// Call IconButton
Widget buildCallButton() {
  return Column(
    children: <Widget>[
      IconButton(
        icon: const Icon(
          Icons.call,
        ),
        onPressed: () {},
      ),
      const Text("Call")
    ],
  );
}

// Text IconButton
Widget buildTextButton() {
  return Column(
    children: <Widget>[
      IconButton(
        icon: const Icon(Icons.message),
        onPressed: () {},
      ),
      const Text("Text")
    ],
  );
}

// Video IconButton
Widget buildVideoButton() {
  return Column(
    children: <Widget>[
      IconButton(
        icon: const Icon(
          Icons.video_call,
        ),
        onPressed: () {},
      ),
      const Text("Video")
    ],
  );
}

// Email IconButton
Widget buildEmailButton() {
  return Column(
    children: <Widget>[
      IconButton(
        icon: const Icon(
          Icons.email,
        ),
        onPressed: () {},
      ),
      const Text("Email")
    ],
  );
}

// Directions IconButton
Widget buildDirectionsButton() {
  return Column(
    children: <Widget>[
      IconButton(
        icon: const Icon(
          Icons.directions,
        ),
        onPressed: () {},
      ),
      const Text("Direction")
    ],
  );
}

// Pay IconButton
Widget buildPayButton() {
  return Column(
    children: <Widget>[
      IconButton(
        icon: const Icon(
          Icons.payment,
        ),
        onPressed: () {},
      ),
      const Text("Pay")
    ],
  );
}

// Mobile Phone ListTile
Widget mobilePhoneListTile() {
  return ListTile(
    leading: Icon(Icons.call, color: Colors.indigo.shade800),
    title: const Text('7358495594'),
    subtitle: const Text('Mobile'),
    trailing: IconButton(
      onPressed: () {},
      icon: const Icon(Icons.message),
      color: Colors.indigo.shade800,
    ),
  );
}

// Another Mobile Phone listTile
Widget anotherMobilePhoneListTile() {
  return ListTile(
    leading: Icon(Icons.call, color: Colors.indigo.shade800),
    title: const Text('7358495594'),
    subtitle: const Text('Mobile'),
    trailing: IconButton(
      onPressed: () {},
      icon: const Icon(Icons.message),
      color: Colors.indigo.shade800,
    ),
  );
}

// Email listTile
Widget emailListTile() {
  return ListTile(
    leading: Icon(Icons.email, color: Colors.indigo.shade800),
    title: const Text('sn491025@gmail.com'),
    subtitle: const Text('Personal'),
  );
}

// Address listTile
Widget addressListTile() {
  return ListTile(
    leading: Icon(Icons.location_on, color: Colors.indigo.shade800),
    title: const Text('234 IndiraNagar St, London'),
    subtitle: const Text('Home'),
    trailing: IconButton(
        onPressed: () {},
        icon: Icon(Icons.directions, color: Colors.indigo.shade800)),
  );
}
