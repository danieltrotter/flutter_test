class CoverModel {
  CoverModel({
    this.aspectRatio = "",
    this.url = "",
  });

  String aspectRatio;
  String url;

  factory CoverModel.fromJson(Map<String, dynamic> json) => CoverModel(
        aspectRatio: json["aspectRatio"] ?? "",
        url: json["url"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "aspectRatio": aspectRatio,
        "url": url,
      };
}
