import 'dart:async';
import 'dart:convert';
import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

import 'controller/iphone_14_pro_six_controller.dart';
import 'package:flutter/material.dart';
import 'package:mockup/core/app_export.dart';
import 'package:mockup/widgets/custom_icon_button.dart';

// ignore_for_file: must_be_immutable
class Iphone14ProSixScreen extends StatefulWidget {
  const Iphone14ProSixScreen({Key? key})
      : super(
          key: key,
        );

  @override
  State<Iphone14ProSixScreen> createState() => _Iphone14ProSixScreenState();
}

class _Iphone14ProSixScreenState extends State<Iphone14ProSixScreen> {
  List<String> sliderImages = [];
  CarouselOptions carouselOptions = CarouselOptions();
  VideoPlayerController? _controller;
  Timer? timer;
  final Iphone14ProSixController controller =
      Get.put(Iphone14ProSixController());
  int? buttonTimer;

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    load();
  }

  load() async {
    await loadCarouselData();
  }

  Future<void> loadCarouselData() async {
    try {
      // Load the JSON data from the asset file
      String jsonData =
          await rootBundle.loadString('assets/images/slider_images.json');

      // Parse the JSON data
      Map<String, dynamic> data = jsonDecode(jsonData);

      // Extract the image paths and carousel options from the parsed JSON
      List<dynamic> imagePaths = data['images'];
      Map<String, dynamic> options = data['carouselOptions'];

      // Set the state with the fetched data
      setState(() {
        sliderImages = List<String>.from(imagePaths);
        carouselOptions = CarouselOptions(
          height: double.infinity,
          viewportFraction: options['viewportFraction'].toDouble(),
          enableInfiniteScroll: options['enableInfiniteScroll'],
          autoPlay: options['autoPlay'],
          autoPlayInterval: Duration(milliseconds: options['autoPlayInterval']),
          autoPlayAnimationDuration:
              Duration(milliseconds: options['autoPlayAnimationDuration']),
          autoPlayCurve: getCurveFromString(options['autoPlayCurve']),
        );
        bool playVideoBackground = data['playVideoBackground'];
        buttonTimer =
            data.containsKey('button_timer') ? data['button_timer'] as int : 3;
        print(buttonTimer.toString());

        if (playVideoBackground) {
          _controller = VideoPlayerController.networkUrl(Uri.parse(
              'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'))
            ..initialize().then((_) {
              _controller!.play();
              _controller!.setLooping(true);
            });
        }
      });
      timer = Timer.periodic(Duration(seconds: buttonTimer!), (v) {
        print('object');
        if (controller.selectedIndex.value == 3) {
          controller.setIndex(0);
        } else {
          controller.setIndex(controller.selectedIndex.value + 1);
        }
      });
      print('completed');
    } catch (e) {
      print('Error loading carousel data: $e');
    }
  }

  Curve getCurveFromString(String curveName) {
    switch (curveName) {
      case 'linear':
        return Curves.linear;
      case 'easeIn':
        return Curves.easeIn;
      case 'easeOut':
        return Curves.easeOut;
      case 'easeInOut':
        return Curves.easeInOut;
      // Add more cases for other curve names if needed
      default:
        return Curves.ease;
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    SystemChrome.setEnabledSystemUIOverlays([]);

    double screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
          body: Stack(
        children: [
          _controller != null && !_controller!.value.isInitialized
              ? SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: VideoPlayer(_controller!),
                )
              : CarouselSlider(
                  items: sliderImages.map((imagePath) {
                    return Builder(
                      builder: (BuildContext context) {
                        return DecoratedBox(
                          position: DecorationPosition.background,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(imagePath),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Container(),
                        );
                      },
                    );
                  }).toList(),
                  options: carouselOptions),
          SingleChildScrollView(
            child: SizedBox(
              width: double.maxFinite,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: size.height,
                    width: double.maxFinite,
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
                        Obx(
                          () {
                            return CustomIconButton(
                              height: 40,
                              width: 40,
                              margin: getMargin(
                                bottom:
                                    screenWidth > 600 ? Get.height * 0.13 : 157,
                                right: 6,
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
                                if (timer!.isActive) {
                                  timer?.cancel();
                                }
                                controller.setIndex(3);
                              },
                            );
                          },
                        ),
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
                              right: screenWidth > 600 ? 45 : 55,
                              bottom:
                                  screenWidth > 600 ? Get.height * 0.125 : 163,
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
                              if (timer!.isActive) {
                                timer?.cancel();
                              }
                              controller.setIndex(2);
                            },
                          );
                        }),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: SizedBox(
                            height: getVerticalSize(
                                screenWidth > 600 ? Get.height * 0.138 : 193),
                            width: getHorizontalSize(
                                screenWidth > 600 ? Get.height * 0.11 : 177),
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
                                      if (timer!.isActive) {
                                        timer?.cancel();
                                      }
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
                                      variant:
                                          controller.selectedIndex.value == 0
                                              ? IconButtonVariant
                                                  .OutlineLightblueA700
                                              : null,
                                      padding: IconButtonPadding.PaddingAll6,
                                      alignment: Alignment.topLeft,
                                      child: CustomImageView(
                                        svgPath: ImageConstant.imgRewind,
                                      ),
                                      onTap: () {
                                        if (timer!.isActive) {
                                          timer?.cancel();
                                        }
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
        ],
      )),
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
