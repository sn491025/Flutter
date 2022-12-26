import 'package:flutter/material.dart';

void main() => runApp(const Contact());

class Contact extends StatelessWidget {
  const Contact({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            leading: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            backgroundColor: Colors.purple,
            actions: <Widget>[
              IconButton(
                onPressed: () {
                  print('Hi this is Star');
                },
                icon: const Icon(
                  Icons.star_border,
                  color: Colors.black,
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
                                  fontWeight: FontWeight.bold, fontSize: 35),
                            ),
                          ),
                        ],
                      )),
                  const Divider(
                    color: Colors.blueGrey,
                  ),

                  Container(
                    margin: const EdgeInsets.only(top: 8, bottom: 8),
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
                  )
                ],
              )
            ],
          )),
    );
  }
}

// Call IconButton
Widget buildCallButton() {
  return Column(
    children: <Widget>[
      IconButton(
        icon: Icon(
          Icons.call,
          color: Colors.indigo.shade800,
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
        icon: Icon(Icons.message, color: Colors.indigo.shade800),
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
        icon: Icon(Icons.video_call, color: Colors.indigo.shade800),
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
        icon: Icon(Icons.email, color: Colors.indigo.shade800),
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
        icon: Icon(Icons.directions, color: Colors.indigo.shade900),
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
        icon: Icon(Icons.payment, color: Colors.indigo.shade800),
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
