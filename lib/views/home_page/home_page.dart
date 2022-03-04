import 'package:flutter/material.dart';
import 'package:flutter_ptb/controllers/data_controller.dart';
import 'package:flutter_ptb/utils/constants.dart';
import 'package:flutter_ptb/utils/widgets/texts.dart';
import 'package:flutter_ptb/views/home_page/movie_item_view.dart';
import 'package:get/get.dart';

class HomePage extends GetView<DataController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(DataController());
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Obx(
            () => controller.loading.value ? Container() : _background(),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Obx(
                () => PtbTexts.title(controller.movieModel.label),
              ).paddingOnly(bottom: 20),
              SizedBox(
                width: size.width * 0.7,
                child: Obx(() =>
                    PtbTexts.description(controller.movieModel.description)),
              ).paddingOnly(bottom: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Obx(() => Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: controller.dataModel.items
                        .map(
                          (e) => MovieItemView(movieModel: e).paddingAll(20),
                        )
                        .toList())),
              )
            ],
          ).paddingAll(50),
        ],
      ),
    );
  }

  Widget _background() {
    return AnimatedOpacity(
        duration: const Duration(milliseconds: global_animation_duration),
        opacity: controller.fadeFlag.value ? fade_start : fade_end,
        child: Image.network(
          controller.movieModel.covers![0].url,
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
        ));
  }
}
