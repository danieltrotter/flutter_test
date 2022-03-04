import 'package:flutter_ptb/models/badge_model.dart';
import 'package:flutter_ptb/models/cover_model.dart';

class MovieModel {
  MovieModel({
    this.badges,
    this.contentId = "",
    this.covers,
    this.ctaData = "",
    this.ctaType = "",
    this.description = "",
    this.label = "",
    this.type = "",
  });

  BadgeModel? badges;
  String contentId;
  List<CoverModel>? covers;
  String ctaData;
  String ctaType;
  String description;
  String label;
  String type;

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    final coversData = json['covers'] as List<dynamic>?;
    final covers = coversData != null
        ? coversData.map((coverData) => CoverModel.fromJson(coverData)).toList()
        : <CoverModel>[];
    return MovieModel(
      badges: BadgeModel.fromJson(json["badges"]),
      contentId: json["contentId"],
      covers: covers,
      ctaData: json["ctaData"],
      ctaType: json["ctaType"],
      description: json["description"],
      label: json["label"],
      type: json["type"],
    );
  }
  Map<String, dynamic> toJson() => {
        "badges": badges!.toJson(),
        "contentId": contentId,
        "covers": covers!.map((e) => e.toJson()).toList(),
        "ctaData": ctaData,
        "ctaType": ctaType,
        "description": description,
        "label": label,
        "type": type,
      };
}
