import 'package:gallery/model/maintenance.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uuid/uuid.dart';

class Car {
  Car({required this.id, required this.title});

  final String id;
  String title;
  List<Inspection> maintHistory = [];

  @override
  String toString() {
    return 'Car(title: $title)';
  }
}

class CarList extends StateNotifier<List<Car>> {
  CarList([List<Car>? initialTodos])
      : super(initialTodos ??
            [
              Car(id: 'a', title: 'くるまA'),
              Car(id: 'b', title: 'くるまB'),
              Car(id: 'c', title: 'くるまC'),
              Car(id: 'd', title: 'くるまD'),
              Car(id: 'e', title: 'くるまE'),
              Car(id: 'f', title: 'くるまF'),
              Car(id: 'g', title: 'くるまG'),
            ]);

  void add(String title) {
    state = [...state, Car(id: Uuid().v4(), title: title)];
  }

  void edit(String id, String newTitle) {
    state = [
      for (final todo in state)
        if (todo.id == id) Car(id: todo.id, title: newTitle) else todo
    ];
  }

  void fetch() {
    state = [
      Car(id: Uuid().v4(), title: 'aaaaa'),
      Car(id: Uuid().v4(), title: 'abc'),
      Car(id: Uuid().v4(), title: 'addd'),
      Car(id: Uuid().v4(), title: 'aeeia'),
      Car(id: Uuid().v4(), title: 'bbbaa'),
      Car(id: Uuid().v4(), title: 'caaa'),
    ];
  }
}

final carListProvider =
    StateNotifierProvider<CarList, List<Car>>((ref) => CarList());
