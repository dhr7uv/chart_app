import 'package:chart_app/services/data_provider.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyChart extends ConsumerWidget {
  const MyChart({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final _data = ref.watch(stateDataProvider);
    return Scaffold(
      appBar: AppBar(title: const Text("Chart of shared Union Taxes(2017-18)",style: TextStyle(fontSize: 15),),),
      body: _data.when(
          data: (_data) {
            final barGroups = _data.map((record) {
              return BarChartGroupData(
                x: int.parse(record['sl_no_']),
                barRods: [
                  BarChartRodData(
                      toY: record['_2017_18'],
                      borderRadius: BorderRadius.circular(0),
                  )
                ],
              );
            }).toList();

            return Padding(
              padding: const EdgeInsets.all(20),
              child: Center(
                child: SizedBox(
                  height: 400,
                  child: BarChart(BarChartData(
                    barGroups: barGroups,
                    maxY: 70000,
                    minY: 0,
                    titlesData: FlTitlesData(
                      rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (double value, TitleMeta meta){
                            final statename = _data.firstWhere((element) => int.parse(element['sl_no_'])==value)['state'] as String;
                            return SideTitleWidget(
                              axisSide: meta.axisSide,
                              angle: 5,
                              child: Text(statename,style: const TextStyle(fontSize: 10),),
                            );
                          }
                        )
                      )
                    ),
                  )),
                ),
              ),
            );
          },
          error: (error, stackTrace) => Text(error.toString()),
          loading: () => const Center(child: CircularProgressIndicator(),),
      ),
    );
  }
}
