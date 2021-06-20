import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gallery/model/car.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TodoEditWidget extends HookWidget {
  TodoEditWidget(this.todo);

  final Car todo;

  @override
  Widget build(BuildContext context) {
    useProvider(carListProvider);

    String _title = '';

    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Car'),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
                controller: TextEditingController(text: todo.title),
                onChanged: (txt) {
                  _title = txt;
                }),
            const SizedBox(
              height: 8,
            ),
            ElevatedButton(
              child: Text('Update'),
              onPressed: () {
                edit(context, todo.id, _title);
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        ),
      ),
    );
  }

  void edit(BuildContext context, String id, String newTitle) {
    context.read(carListProvider.notifier).edit(id, newTitle);
  }
}
