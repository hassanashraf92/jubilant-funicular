import 'dart:convert';
import 'package:flutter/services.dart';
import '../data/model/order.dart';
import 'package:intl/intl.dart';

class OrderRepo {
  Future<List<OrderModel>> getOrders() async {
    final response = await rootBundle.loadString('assets/orders.json');
    final data = await json.decode(response) as List<dynamic>;
    return data.map((e) => OrderModel.fromJson(e)).toList();
  }

  Future<List<BarChartModel>> getBarChartData() async {
    await Future.delayed(const Duration(seconds: 1));
    final orders = await getOrders();
    final map = await filterByOrderStatus(orders);
    final List<BarChartModel> list = [];

    map.forEach((key, value) {
      list.add(
        BarChartModel(
          title: key,
          value: value,
        ),
      );
    });
    return list;
  }

  Future<List<BarChartModel>> getOrderDatesChart() async {
    await Future.delayed(const Duration(seconds: 1));
    final orders = await getOrders();

    Map<DateTime, int> map = {};
    orders.forEach((element) {
      DateTime tempDate = new DateFormat("yyyy-MM-dd'T'HH:mm:ss")
          .parse(element.registered ?? "");
      String date = tempDate.year.toString() + "-" + tempDate.month.toString();

      var key = DateFormat("yyyy-MM").parse(date);

      if (map.keys.contains(key)) {
        map.update(key, (value) => value + 1);
      } else {
        map[key] = 1;
      }
    });

    var sortedKeys = map.keys.toList(growable: false)
      ..sort((k1, k2) => k1.compareTo(k2));

    Map<DateTime, int> sortedMap = {};

    sortedKeys.forEach((element) {
      sortedMap[element] = map[element] ?? 0;
    });

    final List<BarChartModel> list = [];

    sortedMap.forEach((key, value) {
      list.add(
        BarChartModel(
          title: key.month.toString() + "-" + key.year.toString(),
          value: value,
        ),
      );
    });
    return list;
  }

  Future<int> getTotalOrdersNumber() async {
    final orders = await getOrders();
    return orders.length;
  }

  Future<String> getAveragePrice() async {
    final orders = await getOrders();
    double avgPrice = 0;
    double minPrice = 0;
    double maxPrice = 0;
    NumberFormat format = NumberFormat.simpleCurrency();

    orders.forEach((element) {
      avgPrice += format.parse(element.price ?? "");
    });

    avgPrice = avgPrice / orders.length;

    final String str = format.format(avgPrice);

    return str;
  }

  Future<int> getCount(OrderStatus ofType) async {
    final orders = await getOrders();
    final map = await filterByOrderStatus(orders);
    return map[ofType.name.toLowerCase()] ?? 0;
  }

  Future<Map<String, int>> filterByOrderStatus(List<OrderModel> list) async {
    Map<String, int> map = {
      OrderStatus.delivered.name: 0,
      OrderStatus.returned.name: 0,
      OrderStatus.ordered.name: 0,
    };

    for (var element in list) {
      map.update(element.status.toString().toLowerCase(), (value) => value + 1);
    }

    return map;
  }
}
