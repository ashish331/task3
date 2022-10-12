import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:search_page/search_page.dart';

/// This is a very simple class, used to
/// demo the `SearchPage` package
class Person implements Comparable<Person> {
  final String name, email, from;
  //final num age;

  const Person(this.name, this.email, this.from);

  @override
  int compareTo(Person other) => name.compareTo(other.name);
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Person> data = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //  GetStorage().remove("data");
    var a = GetStorage().read("data") ?? [];
    // GetStorage().remove("data");
    for (var element in a) {
      try {
        if (element.from == null) {
        } else {
          data.add(Person(element.name, element.email, element.from));
        }
      } catch (e) {}
      
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Page'),
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          final person = data[index];

          return ListTile(
            title: Text(person.name),
            subtitle: Text(person.email),
            trailing: Text(person.from),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Search people',
        onPressed: () => showSearch(
          context: context,
          delegate: SearchPage(
            onQueryUpdate: print,
            items: data,
            searchLabel: 'Search people',
            suggestion: const Center(
              child: Text('Filter people by name or email'),
            ),
            failure: const Center(
              child: Text('No person found :('),
            ),
            filter: (person) => [
              person.name,
              person.email,
            ],
            sort: (a, b) => a.compareTo(b),
            builder: (person) => ListTile(
              title: Text(person.name),
              subtitle: Text(person.email),
              trailing: Text(person.from),
            ),
          ),
        ),
        child: const Icon(Icons.search),
      ),
    );
  }
}
