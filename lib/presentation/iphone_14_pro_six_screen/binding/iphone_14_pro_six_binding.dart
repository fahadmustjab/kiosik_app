import '../controller/iphone_14_pro_six_controller.dart';
import 'package:get/get.dart';

/// A binding class for the Iphone14ProSixScreen.
///
/// This class ensures that the Iphone14ProSixController is created when the
/// Iphone14ProSixScreen is first loaded.
class Iphone14ProSixBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Iphone14ProSixController());
  }
}
