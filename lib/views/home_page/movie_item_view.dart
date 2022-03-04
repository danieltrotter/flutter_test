import 'package:flutter/material.dart';
import 'package:flutter_ptb/controllers/data_controller.dart';
import 'package:flutter_ptb/models/movie_model.dart';
import 'package:flutter_ptb/utils/widgets/colors.dart';
import 'package:flutter_ptb/utils/constants.dart';
import 'package:flutter_ptb/utils/widgets/texts.dart';
import 'package:flutter_ptb/utils/widgets/hex_color.dart';
import 'package:get/get.dart';

class MovieItemView extends StatefulWidget {
  const MovieItemView({Key? key, required this.movieModel}) : super(key: key);
  final MovieModel movieModel;
  @override
  State<MovieItemView> createState() => _MovieItemViewState();
}

class _MovieItemViewState extends State<MovieItemView> {
  var controller = Get.find<DataController>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        controller.setSelected(widget.movieModel);
        controller.switchFade();
        Future.delayed(const Duration(milliseconds: global_animation_duration),
            () {
          controller.switchFade();
        });
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Obx(() => Container(
                width: widget.movieModel == controller.movieModel
                    ? size.width * 0.28
                    : size.width * 0.25,
                height: widget.movieModel == controller.movieModel
                    ? size.height * 0.2
                    : size.height * 0.18,
                decoration: widget.movieModel == controller.movieModel
                    ? BoxDecoration(
                        border: Border.all(color: Colors.yellow, width: 1),
                      )
                    : BoxDecoration(),
                child: Stack(
                  children: [
                    Image.network(
                      widget.movieModel.covers![0].url,
                      fit: BoxFit.cover,
                      height: double.infinity,
                      width: double.infinity,
                    ),
                    Positioned(
                      bottom: 15,
                      left: 15,
                      child: _badge(widget.movieModel.badges!.badgeBGColor,
                          widget.movieModel.badges!.badgeText),
                    )
                  ],
                ),
              )),
          SizedBox(
            width: size.width * 0.25,
            child: PtbTexts.movieTitle(widget.movieModel.label),
          ).paddingOnly(top: 10),
        ],
      ),
    );
  }

  _badge(String color, String badgeText) {
    return Container(
      decoration: BoxDecoration(
          color: HexColor(color),
          borderRadius: const BorderRadius.all(Radius.circular(5))),
      child: Text(
        badgeText,
        style: TextStyle(
          color: PtbColors.whiteColor,
        ),
      ).paddingAll(5),
    );
  }
}
