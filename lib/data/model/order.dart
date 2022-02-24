// import 'package:flutter/foundation.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class DeveloperSeries {
  final String year;
  final int developers;
  final charts.Color barColor;

  DeveloperSeries(
      {required this.year, required this.developers, required this.barColor});
}

class OrderModel {
  OrderModel(
      {this.id,
      this.isActive,
      this.price,
      this.company,
      this.picture,
      this.buyer,
      this.status,
      this.registered});

  String? id;
  bool? isActive;
  String? price;
  String? company;
  String? picture;
  String? buyer;
  String? status;
  String? registered;

  OrderModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    isActive = json['isActive'];
    price = json['price'];
    company = json['company'];
    picture = json['picture'];
    buyer = json['buyer'];
    status = json['status'];
    registered = json['registered'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['isActive'] = this.isActive;
    data['price'] = this.price;
    data['company'] = this.company;
    data['picture'] = this.picture;
    data['buyer'] = this.buyer;
    data['status'] = this.status;
    data['registered'] = this.registered;

    return data;
  }
}

class BarChartModel {
  String? title;
  int? value;

  BarChartModel({this.title, this.value});
}

enum OrderStatus { ordered, delivered, returned, unknown }
