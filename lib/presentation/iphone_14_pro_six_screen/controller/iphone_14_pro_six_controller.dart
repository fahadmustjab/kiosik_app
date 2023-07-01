import 'package:mockup/core/app_export.dart';
import 'package:mockup/presentation/iphone_14_pro_six_screen/models/iphone_14_pro_six_model.dart';

/// A controller class for the Iphone14ProSixScreen.
///
/// This class manages the state of the Iphone14ProSixScreen, including the
/// current iphone14ProSixModelObj
class Iphone14ProSixController extends GetxController {
  Rx<Iphone14ProSixModel> iphone14ProSixModelObj = Iphone14ProSixModel().obs;
  Rx<int> selectedIndex = 0.obs;

  setIndex(int index) {
    selectedIndex.value = index;
  }
}
