import 'package:flutter/material.dart';
import 'base_view.dart';

abstract class BaseState<T extends StatefulWidget> extends State<T>
    implements BaseView {
  // LoadingDialog loadingDialog =
  //     new LoadingDialog(); //TODO: Change to ProgressDialog Later.
  // TextUtils textUtils = new TextUtils();

  @override
  void hideProgress() {
    // loadingDialog.hide();
  }

  @override
  void showProgress() {
    // loadingDialog.show();
  }

  @override
  void showSuccessMsg(String msg) {
    // Utils.showSuccessSnackbar(msg);
  }

  @override
  void showErrorMsg(String msg) {
    // Utils.showErrorSnackbar(msg);
  }

  @override
  void showCustomAlert(String msg) {
    // Utils.showSessionExpiredAlert();
  }

  void changeLanguage(String lang) {
    // AppCache.getInstance().setLocale(lang);
    // EasyLocalizationProvider.of(context).data.changeLocale(Locale(lang));
    // Navigator.of(context).pushReplacementNamed('/');
  }
}
