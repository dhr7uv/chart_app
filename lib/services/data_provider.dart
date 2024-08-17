import 'package:chart_app/services/api_services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final stateDataProvider = FutureProvider<List<Map<String, dynamic>>>((ref) async{
  return ref.watch(dataProvider).getRecords();
},);