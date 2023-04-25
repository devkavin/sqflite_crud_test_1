import 'package:flutter/material.dart';

import 'sql_helper.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // List of maps to store journals data
  List<Map<String, dynamic>> _journals = [];

  // Boolean to load the data
  bool _isLoading = true;

  void _refreshJournals() async {
    // Get the data from the database
    final data = await SQLHelper.getItems();

    // Set the data to the list
    setState(() {
      _journals = data;
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _refreshJournals();
    print(
        "..number of items: ${_journals.length}"); // debug statement to check the number of items in the list
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SQFLite CRUD'),
      ),
    );
  }
}
