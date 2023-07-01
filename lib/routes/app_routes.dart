import 'package:mockup/presentation/iphone_14_pro_six_screen/iphone_14_pro_six_screen.dart';
import 'package:mockup/presentation/iphone_14_pro_six_screen/binding/iphone_14_pro_six_binding.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const String iphone14ProSixScreen = '/iphone_14_pro_six_screen';

  static const String initialRoute = '/initialRoute';

  static List<GetPage> pages = [
    GetPage(
      name: iphone14ProSixScreen,
      page: () => Iphone14ProSixScreen(),
      bindings: [
        Iphone14ProSixBinding(),
      ],
    ),
    GetPage(
      name: initialRoute,
      page: () => Iphone14ProSixScreen(),
      bindings: [
        Iphone14ProSixBinding(),
      ],
    )
  ];
}
