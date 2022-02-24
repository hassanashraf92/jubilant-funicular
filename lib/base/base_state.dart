import 'package:flutter/material.dart';
import 'base_view.dart';

abstract class BaseState<T extends StatefulWidget> extends State<T>
    implements BaseView {
  @override
  void hideProgress() {}

  @override
  void showProgress() {}

  @override
  void showSuccessMsg(String msg) {}

  @override
  void showErrorMsg(String msg) {}

  @override
  void showCustomAlert(String msg) {}
}
