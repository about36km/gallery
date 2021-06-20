import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gallery/model/car.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TodoAddWidget extends HookWidget {
  @override
  Widget build(BuildContext context) {
    useProvider(carListProvider);

    String _title = '';

    return Scaffold(
      appBar: AppBar(
        title: Text('Add Car'),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(onChanged: (txt) {
              _title = txt;
            }),
            const SizedBox(
              height: 8,
            ),
            ElevatedButton(
              child: Text('ADD'),
              onPressed: () {
                add(context, _title);
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

  void add(BuildContext context, String title) {
    context.read(carListProvider.notifier).add(title);
  }
}
