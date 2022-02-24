import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import '../../data/model/order.dart';

class OrdersCharts extends StatelessWidget {
  final List<BarChartModel> data;

  OrdersCharts({required this.data});

  @override
  Widget build(BuildContext context) {
    List<charts.Series<BarChartModel, String>> series = [
      charts.Series(
        id: "orders",
        data: data,
        displayName: "Order Status",
        domainFn: (BarChartModel data, _) => data.title ?? "",
        measureFn: (BarChartModel data, _) => data.value ?? 0,
        colorFn: (_, __) => charts.Color.fromHex(code: "#00C8CB"),
      )
    ];

    // return charts.Barchart(series, animate: true);
    return charts.BarChart(
      series,
      animate: true,
      domainAxis: const charts.OrdinalAxisSpec(
        renderSpec: charts.SmallTickRendererSpec(
          labelRotation: 45,
        ),
      ),
    );
  }
}
