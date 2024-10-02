import 'package:app_reook/elements/books.dart';
import 'package:app_reook/provider/adds.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Listagens extends StatelessWidget {
  final Bookss bookss;

  const Listagens(this.bookss, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        bookss.page,
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      title: Text(bookss.name),
      subtitle: Text(bookss.category),
      trailing: SizedBox(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
              color: Colors.blue[100],
              onPressed: () {},
              icon: const Icon(Icons.edit),
            ),
            IconButton(
              color: Colors.red[200],
              onPressed: () async {
                await Provider.of<Adds>(context, listen: false).remove(bookss);
              },
              icon: const Icon(Icons.delete),
            ),
          ],
        ),
      ),
    );
  }
}
