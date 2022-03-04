class BadgeModel {
  BadgeModel({
    this.badgeBGColor = "",
    this.badgeText = "",
  });

  String badgeBGColor;
  String badgeText;

  factory BadgeModel.fromJson(Map<String, dynamic> json) => BadgeModel(
        badgeBGColor: json["badgeBGColor"] ?? "",
        badgeText: json["badgeText"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "badgeBGColor": badgeBGColor,
        "badgeText": badgeText,
      };
}
