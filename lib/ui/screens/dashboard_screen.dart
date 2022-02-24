import 'package:flapkap_challenge/base/base_state.dart';
import 'package:flapkap_challenge/data/model/container_data_model.dart';
import 'package:flapkap_challenge/network/order_repo.dart';
import 'package:flapkap_challenge/ui/views/full_width_container_view.dart';
import 'package:flapkap_challenge/ui/views/order_status_container_view.dart';
import 'package:flutter/material.dart';
import '../../data/model/order.dart';
import '../views/simple_bar_chart.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends BaseState<DashboardScreen> {
  OrderRepo repo = OrderRepo();

  Future<List<BarChartModel>> getOrders() async {
    return await repo.getBarChartData();
  }

  Future<int> getTotalOrdersCount() async {
    return await repo.getTotalOrdersNumber();
  }

  Future<String> getAvgPrice() async {
    return await repo.getAveragePrice();
  }

  Future<int> getOrdersCount(OrderStatus ofType) async {
    return repo.getCount(ofType);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder(
              future: getAvgPrice(),
              builder: (
                BuildContext ctx,
                AsyncSnapshot<String> snapshot,
              ) =>
                  FullWidthContainer(
                ContainerDataModel(
                  title: "Avg. Price",
                  value: snapshot.data ?? "",
                  backgroundColor: Color.fromRGBO(250, 180, 27, 1),
                  forgroundColor: Colors.white,
                ),
              ),
            ),
            FutureBuilder(
              future: getTotalOrdersCount(),
              builder: (
                BuildContext ctx,
                AsyncSnapshot<int> snapshot,
              ) =>
                  snapshot.hasData
                      ? FullWidthContainer(
                          ContainerDataModel(
                            title: "Total number of Orders",
                            value: snapshot.data.toString() + " Orders",
                            backgroundColor:
                                const Color.fromRGBO(44, 201, 153, 1),
                            forgroundColor: Colors.white,
                          ),
                        )
                      : const Center(
                          child: CircularProgressIndicator(),
                        ),
            ),
            Container(
              height: 0.5,
              color: Colors.grey,
            ),
            const SizedBox(
              height: 12,
            ),
            const Text(
              "More Numbers",
              style: TextStyle(
                color: Color.fromRGBO(0, 200, 203, 1),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              margin: const EdgeInsets.all(14),
              height: 100,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FutureBuilder(
                    future: getOrdersCount(OrderStatus.ordered),
                    builder: (
                      BuildContext ctx,
                      AsyncSnapshot<int> snapshot,
                    ) =>
                        snapshot.hasData
                            ? OrderStatusContainer(
                                title: "Ordered",
                                icon: Icons.delivery_dining,
                                color: const Color.fromRGBO(82, 122, 252, 1),
                                value: snapshot.data.toString(),
                              )
                            : const Center(
                                child: CircularProgressIndicator(),
                              ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  FutureBuilder(
                    future: getOrdersCount(OrderStatus.returned),
                    builder: (
                      BuildContext ctx,
                      AsyncSnapshot<int> snapshot,
                    ) =>
                        snapshot.hasData
                            ? OrderStatusContainer(
                                title: "Returned",
                                icon: Icons.cancel,
                                color: const Color.fromRGBO(241, 94, 141, 1),
                                value: snapshot.data.toString(),
                              )
                            : const Center(
                                child: CircularProgressIndicator(),
                              ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  FutureBuilder(
                    future: getOrdersCount(OrderStatus.delivered),
                    builder: (
                      BuildContext ctx,
                      AsyncSnapshot<int> snapshot,
                    ) =>
                        snapshot.hasData
                            ? OrderStatusContainer(
                                title: "Delivered",
                                icon: Icons.keyboard_return,
                                color: const Color.fromRGBO(149, 106, 230, 1),
                                value: snapshot.data.toString(),
                              )
                            : const Center(
                                child: CircularProgressIndicator(),
                              ),
                  ),
                ],
              ),
            ),
            FutureBuilder(
              future: getOrders(),
              builder: (
                BuildContext ctx,
                AsyncSnapshot<List<BarChartModel>> snapshot,
              ) =>
                  snapshot.hasData
                      ? SizedBox(
                          height: 300,
                          child: OrdersCharts(
                            data: snapshot.data ?? [],
                          ),
                        )
                      : const Center(
                          child: CircularProgressIndicator(),
                        ),
            ),
          ],
        ),
      ),
    );
  }
}
