import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gallery/model/car.dart';
import 'package:gallery/car_add.dart';
import 'package:gallery/car_edit.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CarList extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final cars = useProvider(carListProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Gallery'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return TodoAddWidget();
                }));
              },
              icon: Icon(Icons.add)),
          Icon(Icons.more_vert)
        ],
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return CarWidget(car: cars[index]);
        },
        itemCount: cars.length,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.search),
        onPressed: () {},
      ),
    );
  }
}

class CarWidget extends Card {
  CarWidget({required this.car});

  final Car car;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              // 車の画像の予定
              width: 128,
              height: 128,
              color: Colors.green.shade100,
            ),
            Expanded(
                child: Padding(
                    padding: EdgeInsets.only(left: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(car.title,
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 24,
                            )),
                        Text('description')
                      ],
                    ))),
            IconButton(
              icon: Icon(Icons.navigate_next),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return TodoEditWidget(car);
                }));
              },
            ),
          ],
        ),
      ),
    );
  }
}
