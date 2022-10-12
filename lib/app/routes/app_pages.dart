import 'package:get/get.dart';

import '../modules/MyHomePage/bindings/my_home_page_binding.dart';
import '../modules/MyHomePage/views/my_home_page_view.dart';
import '../modules/dashbord/bindings/dashbord_binding.dart';
import '../modules/dashbord/views/dashbord_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.DASHBORD,
      page: () => const DashbordView(),
      binding: DashbordBinding(),
    ),
    // GetPage(
    //   name: _Paths.MY_HOME_PAGE,
    //   page: () =>  MyHomePageView(),
    //   binding: MyHomePageBinding(),
    // ),
  ];
}
