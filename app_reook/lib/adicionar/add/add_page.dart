import 'package:app_reook/elements/books.dart';
import 'package:app_reook/provider/adds.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class AddPage extends StatelessWidget {
  final _form = GlobalKey<FormState>();
  final Map<String, String> _formData = {};

  AddPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Book'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              final isValid = _form.currentState!.validate();
              if (isValid) {
                _form.currentState!.save();
                Provider.of<Adds>(context, listen: false).put(
                  Bookss(
                    name: _formData['name']!,
                    category: _formData['category']!,
                    page: _formData['page']!,
                  ),
                );
                Navigator.of(context).pop();
              }
            },
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _form,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Book'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Adicione um nome';
                  }
                  return null;
                },
                onSaved: (value) => _formData['name'] = value!,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Category'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Adicione a categoria';
                  }
                  return null;
                },
                onSaved: (value) => _formData['category'] = value!,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Page'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Adicione uma pagina';
                  }
                  return null;
                },
                onSaved: (value) => _formData['page'] = value!,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
