import 'package:blocs/bloc/bloc/Counter_bloc.dart';
import 'package:blocs/bloc/ui/blocMain.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'dart:math' as math show Random;

const names = ['san', 'dev', 'ewar', 'bala', 'leo', '', ''];

extension RandomElement<T> on Iterable<T> {
  T getrandomElement() => elementAt(math.Random().nextInt(length));
}

class NamesCubit extends Cubit<String?> {
  NamesCubit() : super(null);

  void randomName() => emit(names.getrandomElement());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bloc',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Cubit'),
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const UiBlocMain()));
                  },
                  icon: const Icon(Icons.near_me))
            ],
          ),
          body: MyAppHome()),
    );
  }
}

class MyAppHome extends StatefulWidget {
  const MyAppHome({super.key});

  @override
  State<MyAppHome> createState() => _MyAppHomeState();
}

class _MyAppHomeState extends State<MyAppHome> {
  late final NamesCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = NamesCubit();
  }

  @override
  void dispose() {
    cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String?>(
      stream: cubit.stream,
      builder: (context, snapshot) {
        final button = Center(
            child: TextButton(
                onPressed: () => cubit.randomName(),
                child: const Text('click this button to change Name')));
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return button;
          case ConnectionState.waiting:
            return button;
          case ConnectionState.active:
            return Column(
              children: [Text(snapshot.data ?? 'gvgyvyg'), button],
            );
          case ConnectionState.done:
            return const SizedBox();
        }
      },
    );
  }
}
