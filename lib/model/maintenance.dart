import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

class Inspection {
  Inspection({required this.carId, required this.inspId});

  final String carId;
  final String inspId;
  DateTime date = DateTime.now();
  InspectorTiming timing = InspectorTiming.a;
  String operator = '';
}

enum InspectorTiming {
  a,
  b,
}

String InspectorTimingSelector(InspectorTiming timing) =>
    Intl.select(timing, {InspectorTiming.a: '返却時', InspectorTiming.b: '修理完了'},
        name: 'InspectorTimingSelector', args: [timing]);

class InspectionHistory extends StateNotifier<List<Inspection>> {
  InspectionHistory(List<Inspection> state) : super(state);
}
