import 'package:flapkap_challenge/data/model/container_data_model.dart';
import 'package:flutter/material.dart';

class FullWidthContainer extends StatelessWidget {
  final ContainerDataModel data;

  FullWidthContainer(this.data);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 28,
      height: 100,
      padding: const EdgeInsets.only(left: 14, top: 14, right: 14, bottom: 14),
      margin: const EdgeInsets.only(left: 14, top: 14, right: 14, bottom: 14),
      decoration: BoxDecoration(
        color: data.backgroundColor ?? Color.fromRGBO(250, 180, 27, 1),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.9),
              spreadRadius: 1,
              blurRadius: 2,
              offset: const Offset(1, 2))
        ],
      ),
      child: Column(
        children: [
          Text(
            data.title ?? "",
            textAlign: TextAlign.left,
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 22,
              color: data.forgroundColor ?? Colors.white,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            data.value ?? "",
            textAlign: TextAlign.justify,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 28,
              color: data.forgroundColor ?? Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
