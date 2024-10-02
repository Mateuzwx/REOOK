import 'package:app_reook/components/listagens.dart';
import 'package:app_reook/provider/adds.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final Adds users = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Reook'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add');
        },
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
          itemCount: users.count,
          itemBuilder: (context, index) => Listagens(users.byIndex(index))),
    );
  }
}
