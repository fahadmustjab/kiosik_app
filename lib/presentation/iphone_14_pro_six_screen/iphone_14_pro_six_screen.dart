import 'dart:ui';

import 'package:flutter/services.dart';

import 'controller/iphone_14_pro_six_controller.dart';
import 'package:flutter/material.dart';
import 'package:mockup/core/app_export.dart';
import 'package:mockup/widgets/custom_icon_button.dart';

// ignore_for_file: must_be_immutable
class Iphone14ProSixScreen extends GetWidget<Iphone14ProSixController> {
  const Iphone14ProSixScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    SystemChrome.setEnabledSystemUIOverlays([]);
    final Iphone14ProSixController controller =
        Get.put(Iphone14ProSixController());

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            width: double.maxFinite,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: size.height,
                  width: double.maxFinite,
                  decoration: AppDecoration.fillBlack900,
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      // Obx(() => CustomIconButton(
                      //       height: 40,
                      //       width: 40,
                      //       margin: getMargin(
                      //         right: 6,
                      //         bottom: Get.height * 0.12,
                      //       ),
                      //       variant: controller.selectedIndex.value == 3
                      //           ? IconButtonVariant.OutlineLightblueA700
                      //           : null,
                      //       alignment: Alignment.bottomRight,
                      //       child: CustomImageView(
                      //         svgPath: ImageConstant.imgMenu,
                      //       ),
                      //       onTap: () {
                      //         controller.setIndex(3);
                      //       },
                      //     )),
                      Obx(() {
                        return CustomIconButton(
                          height: 40,
                          width: 40,
                          margin: getMargin(
                            right: 6,
                            // bottom: Get.height * 0.163,
                            bottom: 157,
                          ),
                          padding: IconButtonPadding.PaddingAll6,
                          alignment: Alignment.bottomRight,
                          variant: controller.selectedIndex.value == 3
                              ? IconButtonVariant.OutlineLightblueA700
                              : null,
                          child: CustomImageView(
                            svgPath: ImageConstant.imgMenu,
                          ),
                          onTap: () {
                            controller.setIndex(3);
                          },
                        );
                      }),
                      // Obx(() {
                      //   return CustomIconButton(
                      //     height: 40,
                      //     width: 40,
                      //     margin: getMargin(
                      //       right: 45,
                      //       bottom: Get.height * 0.125,
                      //     ),
                      //     variant: controller.selectedIndex.value == 2
                      //         ? IconButtonVariant.OutlineLightblueA700
                      //         : null,
                      //     alignment: Alignment.bottomRight,
                      //     child: CustomImageView(
                      //       svgPath: ImageConstant.imgVector,
                      //     ),
                      //     onTap: () {
                      //       controller.setIndex(2);
                      //     },
                      //   );
                      // }),
                      Obx(() {
                        return CustomIconButton(
                          height: 40,
                          width: 40,
                          margin: getMargin(
                            // right: 45,
                            // bottom: Get.height * 0.125,
                            right: 55,
                            bottom: 163,
                          ),
                          padding: IconButtonPadding.PaddingAll6,
                          alignment: Alignment.bottomRight,
                          variant: controller.selectedIndex.value == 2
                              ? IconButtonVariant.OutlineLightblueA700
                              : null,
                          child: CustomImageView(
                            svgPath: ImageConstant.imgVector,
                          ),
                          onTap: () {
                            controller.setIndex(2);
                          },
                        );
                      }),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: SizedBox(
                          height: getVerticalSize(
                              // Get.height * 0.138,
                              193),
                          width: getHorizontalSize(
                              // Get.height * 0.11,
                              177),
                          child: Stack(
                            alignment: Alignment.topLeft,
                            children: [
                              Obx(() {
                                return CustomIconButton(
                                  height: 40,
                                  width: 40,
                                  margin: getMargin(
                                    left: 36,
                                  ),
                                  padding: IconButtonPadding.PaddingAll6,
                                  alignment: Alignment.topLeft,
                                  variant: controller.selectedIndex.value == 1
                                      ? IconButtonVariant.OutlineLightblueA700
                                      : null,
                                  child: CustomImageView(
                                    svgPath: ImageConstant.imgTrash,
                                  ),
                                  onTap: () {
                                    controller.setIndex(1);
                                  },
                                );
                              }),
                              Obx(() => CustomIconButton(
                                    height: 40,
                                    width: 40,
                                    margin: getMargin(
                                      top: 40,
                                      left: 10,
                                    ),
                                    variant: controller.selectedIndex.value == 0
                                        ? IconButtonVariant.OutlineLightblueA700
                                        : null,
                                    padding: IconButtonPadding.PaddingAll6,
                                    alignment: Alignment.topLeft,
                                    child: CustomImageView(
                                      svgPath: ImageConstant.imgRewind,
                                    ),
                                    onTap: () {
                                      controller.setIndex(0);
                                    },
                                  )),
                              CustomImageView(
                                imagePath: ImageConstant.imgEllipse5,
                                height: getSize(
                                  140,
                                ),
                                width: getSize(
                                  140,
                                ),
                                radius: BorderRadius.circular(
                                  getHorizontalSize(
                                    70,
                                  ),
                                ),
                                alignment: Alignment.bottomRight,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class GlowIcon extends StatelessWidget {
  final IconData icon;
  final Color color;
  final Color glowColor;
  final double size;

  const GlowIcon(
    this.icon, {
    Key? key,
    required this.color,
    required this.glowColor,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Icon(
          icon,
          color: color,
          size: size,
        ),
        Positioned.fill(
          child: ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  boxShadow: [
                    BoxShadow(
                      color: glowColor,
                      blurRadius: 10,
                      spreadRadius: 10,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
