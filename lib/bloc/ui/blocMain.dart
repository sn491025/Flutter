import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum OverallPerson { person1, person2 }

@immutable
class LoadingPerson implements LoadingAction {
  final OverallPerson url;
  const LoadingPerson({required this.url}) : super();
}

extension VarPerson on OverallPerson {
  String get varPerson {
    switch (this) {
      case OverallPerson.person1:
        return 'http://127.0.0.1:5500/Api/person1.json';
      case OverallPerson.person2:
        return 'http://127.0.0.1:5500/Api/person2.json';
    }
  }
}

@immutable
abstract class LoadingAction {
  const LoadingAction();
}

@immutable
class Persons {
  final String name;
  final int age;
  String image;

  Persons({required this.name, required this.age, required this.image});

  Persons.fromJson(Map<String, dynamic> json)
      : name = json['name'] as String,
        age = json['age'] as int,
        image = json['image'] as String;
}

Future<Iterable<Persons>> getPersons(String url) => HttpClient()
    .getUrl(Uri.parse(url))
    .then((req) => req.close())
    .then((resp) => resp.transform(utf8.decoder).join())
    .then((str) => json.decode(str) as List<dynamic>)
    .then((list) => list.map((val) => Persons.fromJson(val)));

@immutable
class FetchResult {
  final Iterable<Persons> persons;
  final bool resieved;

  const FetchResult({required this.persons, required this.resieved});

  @override
  String toString() =>
      'FetchResult (Resieved = $resieved , Persons = $persons)';
}

class PersonsBloc extends Bloc<LoadingAction, FetchResult?> {
  final Map<OverallPerson, Iterable<Persons>> _cache = {};
  PersonsBloc() : super(null) {
    on<LoadingPerson>((event, emit) async {
      final url = event.url;
      if (_cache.containsKey(url)) {
        final cachedPerson = _cache[url]!;
        final result = FetchResult(persons: cachedPerson, resieved: true);
        emit(result);
      } else {
        final persons = await getPersons(url.varPerson);
        _cache[url] = persons;
        final result = FetchResult(persons: persons, resieved: false);
        emit(result);
      }
    });
  }
}

class BlocMainHome extends StatelessWidget {
  const BlocMainHome({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Bloc',
      debugShowCheckedModeBanner: false,
      home: BlocHomeState(),
    );
  }
}

class BlocHomeState extends StatelessWidget {
  const BlocHomeState({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc'),
      ),
      body:
          BlocProvider(create: (_) => PersonsBloc(), child: const BlocHome1()),
    );
  }
}

extension<T> on Iterable<T> {
  T? operator [](int index) {
    return length > index ? elementAt(index) : null;
  }
}

class BlocHome1 extends StatelessWidget {
  const BlocHome1({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  context
                      .read<PersonsBloc>()
                      .add(const LoadingPerson(url: OverallPerson.person1));
                },
                child: const Text('#Json1')),
            const SizedBox(width: 40),
            ElevatedButton(
                onPressed: () {
                  context
                      .read<PersonsBloc>()
                      .add(const LoadingPerson(url: OverallPerson.person2));
                },
                child: const Text('#Json2'))
          ],
        ),
        BlocBuilder<PersonsBloc, FetchResult?>(buildWhen: (previous, current) {
          return previous?.persons != current?.persons;
        }, builder: ((context, fetchResult) {
          final persons = fetchResult?.persons;
          if (persons == null) {
            return const SizedBox();
          }

          return Expanded(
            child: ListView.builder(
                itemCount: persons.length,
                itemBuilder: (context, index) {
                  final person = persons[index]!;

                  return Container(
                    child: Column(
                      children: [
                        ListTile(
                          title: Text(person.name),
                        ),
                        Image.network('${person.image}')
                      ],
                    ),
                  );
                }),
          );
        }))
      ],
    );
  }
}
