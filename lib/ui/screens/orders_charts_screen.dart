import 'package:flutter/material.dart';

import '../../base/base_state.dart';
import '../../data/model/order.dart';
import '../../network/order_repo.dart';
import '../views/simple_bar_chart.dart';

class OrderChartsScreen extends StatefulWidget {
  const OrderChartsScreen({Key? key}) : super(key: key);

  @override
  State<OrderChartsScreen> createState() => _OrderChartsScreenState();
}

class _OrderChartsScreenState extends BaseState<OrderChartsScreen> {
  OrderRepo repo = OrderRepo();

  Future<List<BarChartModel>> getOrderChart() async {
    return await repo.getOrderDatesChart();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.only(
          left: 14,
          right: 14,
        ),
        child: FutureBuilder(
          future: getOrderChart(),
          builder: (
            BuildContext ctx,
            AsyncSnapshot<List<BarChartModel>> snapshot,
          ) =>
              snapshot.hasData
                  ? OrdersCharts(
                      data: snapshot.data ?? [],
                    )
                  : const Center(
                      child: CircularProgressIndicator(),
                    ),
        ),
      ),
    );
  }
}
